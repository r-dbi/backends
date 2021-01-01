library(tidyverse)
pkgload::load_all()


pkg_tbl <- fetch_pkg_tbl()

dir.create("docs", showWarnings = FALSE)

pkg_tbl %>%
  jsonlite::toJSON(pretty = TRUE) %>%
  writeLines("docs/all.json")

unlink("docs/by-package", recursive = TRUE)
dir.create("docs/by-package", showWarnings = FALSE)

pkg_tbl %>%
  nest(data = -name) %>%
  mutate(data = map(data, unclass)) %>%
  mutate(data = map(data, map, unlist)) %>%
  mutate(text = map(data, jsonlite::toJSON, pretty = TRUE, auto_unbox = TRUE)) %>%
  mutate(con = file.path("docs/by-package", paste0(name, ".json"))) %>%
  select(-data, -name) %>%
  pwalk(writeLines)
