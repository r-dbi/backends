library(tidyverse)
pkgload::load_all()


# Unstable in CI, seems to work locally?
CHECK_REMOVED <- FALSE


pkg_tbl <- fetch_pkg_tbl()

# Check a second time, log GH results
try(fetch_pkg_tbl())

dir.create("docs/by-package", showWarnings = FALSE, recursive = TRUE)

new <- pkg_tbl_to_json(pkg_tbl)

old <- read_by_pkg()

added <- anti_join(new, old, by = "path")

removed <- anti_join(old, new, by = "path")

updated <-
  inner_join(new, old, by = "path") %>%
  filter(!map2_lgl(new, old, identical))

updated
added
removed

if (!CHECK_REMOVED && nrow(removed) > 0) {
  message("Not checking removed packages.")
  removed <- removed[0, ]
}

if (nrow(updated) > 0) {
  updated %>%
    select(con = path, text = new) %>%
    pwalk(writeLines)

  gert::git_add("docs/by-package")
  gert::git_commit("Update definition for existing package")
  gert::git_pull()
  gert::git_push()
}

if (nrow(added) > 0) {
  gert::git_fetch()

  pwalk(added, pr_new)
}

if (nrow(removed) > 0) {
  gert::git_fetch()

  pwalk(removed %>% select(path), pr_old)
}


# Create unconditionally (could be the result of a PR merge)
create_all_json()

if ("docs/all.json" %in% gert::git_status()$file) {
  gert::git_add("docs/all.json")
  gert::git_commit("Update definition for all packages")
  gert::git_pull()
  gert::git_push()
}

# Render unconditionally (could be the result of a PR merge)
rmarkdown::render("README.Rmd")

if ("README.md" %in% gert::git_status()$file) {
  gert::git_add("README.md")
  gert::git_commit("Update overview of backends")
  gert::git_pull()
  gert::git_push()
}
