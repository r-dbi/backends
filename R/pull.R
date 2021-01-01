pr_new <- function(path, new) {
  name <- sub("[.][^.]*$", "", basename(path))

  old_branch <- gert::git_branch()

  exists <- gert::git_branch_exists(paste0("origin/", name), local = FALSE)
  exists

  if (!exists) {
    # checkout = TRUE didn't work
    message("Creating new branch: ", name)
    gert::git_branch_create(name)
  }
  message("Checking out branch: ", name)
  gert::git_branch_checkout(name)

  on.exit(gert::git_branch_checkout(old_branch))

  gert::git_merge(old_branch)

  message("Writing ", path)
  writeLines(new, path)
  create_all_json()

  title <- paste0("New package: ", name)
  body <- paste0(
    "Merge this if you think this is a DBI backend. Convert to a draft and leave open if not.\n\n",
    "Decision based on: https://github.com/cran/",  name, "/search?q=DBIConnection+setMethod"
  )

  if (path %in% gert::git_status()$file) {
    message("Committing")
    # FIXME: Align with search expression

    gert::git_add("docs")
    gert::git_commit(title)
  }

  message("Pushing")
  gert::git_push()

  # FIXME: Hard code
  message("Checking if PR is already open")
  open_pr <- gh::gh("/repos/r-dbi/backends/pulls", state = "all", head = paste0("r-dbi:", name))
  if (length(open_pr) == 0) {
    message("Opening PR")
    gh::gh(
      "/repos/r-dbi/backends/pulls", head = name, base = old_branch,
      title = title, body = body,
      .method = "POST"
    )
  } else if (open_pr[[1]]$state != "open") {
    gh::gh(
      paste0("/repos/r-dbi/backends/pulls/", open_pr[[1]]$number),
      state = "open",
      title = title, body = body,
      .method = "PATCH"
    )
  }
}
