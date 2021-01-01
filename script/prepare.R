library(tidyverse)
pkgload::load_all()


pkg_tbl <- fetch_pkg_tbl()

dir.create("docs", showWarnings = FALSE)

unlink("docs/by-package", recursive = TRUE)
dir.create("docs/by-package", showWarnings = FALSE)

new <- pkg_tbl_to_json(pkg_tbl)

new %>%
  rename(con = path, text = new) %>%
  pwalk(writeLines)

create_all_json()
