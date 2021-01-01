library(tidyverse)
pkgload::load_all()


pkg_tbl <- fetch_pkg_tbl()

dir.create("docs/by-package", showWarnings = FALSE, recursive = TRUE)

new <- pkg_tbl_to_json(pkg_tbl)

old <- read_by_pkg()

added <- anti_join(new, old, by = "path")

removed <- anti_join(old, new, by = "path")

updated <-
  inner_join(new, old, by = "path") %>%
  filter(!map2_lgl(new, old, identical))

updated

if (nrow(updated) > 0) {
  updated %>%
    select(con = path, text = new) %>%
    pwalk(writeLines)

  create_all_json()

  gert::git_add("docs")
  gert::git_commit("Update definition for existing packages")
  gert::git_pull()
  gert::git_push()
}

if (nrow(added) > 0) {
  gert::git_fetch()

  pwalk(added, pr_new)
}

# Render unconditionally (could be the result of a PR merge)
rmarkdown::render("README.Rmd")

if ("README.md" %in% gert::git_status()$file) {
  gert::git_add("README.md")
  gert::git_commit("Update definition for existing packages")
  gert::git_pull()
  gert::git_push()
}
