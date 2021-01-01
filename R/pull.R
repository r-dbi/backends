pr_new <- function(path, new) withAutoprint({
  name <- sub("[.][^.]*$", "", basename(path))

  old_branch <- gert::git_branch()

  exists <- gert::git_branch_exists(name, local = FALSE)
  exists

  if (!exists) {
  } else {
    # checkout = TRUE didn't work
    message("Creating new branch: ", name)
    gert::git_branch_create(name)
  }
  message("Checking out existing branch:", name)
  gert::git_branch_checkout(name)
  on.exit(gert::git_branch_checkout(old_branch))

  message("Writing ", path)
  writeLines(new, path)
  create_all_json()

  if (nrow(gert::git_status()) > 0) {
    message("Committing")
    title <- paste0("New package: ", name)
    body <- "Merge this if you think this is a DBI backend."

    gert::git_add("docs")
    gert::git_commit(title)

    message("Pushing")
    gert::git_push(set_upstream = TRUE)

    # FIXME: Hard code
    gh::gh(
      "/repos/r-dbi/backends/pulls", head = name, base = old_branch,
      title = title, body = body,
      .method = "POST"
    )
  }
})
