library(tidyverse)
pkgload::load_all()


pkg_tbl <- fetch_pkg_tbl()

dir.create("docs", showWarnings = FALSE)

unlink("docs/by-package", recursive = TRUE)
dir.create("docs/by-package", showWarnings = FALSE)

new <- pkg_tbl_to_json(pkg_tbl)

old <- read_by_pkg()

added <- anti_join(new, old, by = "path")

removed <- anti_join(old, new, by = "path")

updated <-
  inner_join(new, old, by = "path") %>%
  filter(!map2_lgl(new, old, identical))

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
