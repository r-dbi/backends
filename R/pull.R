pr_new <- function(path, new) {
  name <- sub("[.][^.]*$", "", basename(path))

  old_branch <- gert::git_branch()

  exists <- gert::git_branch_exists(name)

  if (exists) {
    gert::git_branch_checkout(name)
  } else {
    gert::git_branch_create(name)
  }
  on.exit(gert::git_branch_checkout(old_branch))

  writeLines(path, new)
  create_all_json()

  if (nrow(gert::git_status()) > 0) {
    title <- paste0("New package: ", name)
    body <- "Merge this if you think this is a DBI backend."

    gert::git_add("docs")
    gert::git_commit(title)
    gert::git_push(set_upstream = TRUE)
    # FIXME: Hard code
    gh::gh(
      "/repos/r-dbi/backends/pulls", head = name, base = old_branch,
      title = title, body = body,
      .method = "POST"
    )
  }
}
