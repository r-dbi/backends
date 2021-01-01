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

  message("Writing ", path)
  writeLines(new, path)
  create_all_json()

  if (path %in% gert::git_status()$file) {
    message("Committing")
    title <- paste0("New package: ", name)
    body <- "Merge this if you think this is a DBI backend."

    gert::git_add("docs")
    gert::git_commit(title)

    message("Pushing")
    gert::git_push()
  }

  # FIXME: Hard code
  open_pr <- gh::gh("/repos/r-dbi/backends/pulls", state = "open", head = paste0("r-dbi:", name))
  if (length(open_pr) == 0) {
    gh::gh(
      "/repos/r-dbi/backends/pulls", head = name, base = old_branch,
      title = title, body = body,
      .method = "POST"
    )
  }
}
