library(tidyverse)
pkgload::load_all()

x <- gh::gh(
  "/search/code",
  q = "setClass+DBIDriver+org:cran",
  per_page = 100
)

pkg <-
  tibble(items) %>%
  unnest_wider(items) %>%
  select(path, repository) %>%
  unnest_wider(repository) %>%
  mutate(available = name %in% rownames(available.packages())) %>%
  arrange(available, name) %>%
  filter(name != "DBI") %>%
  nest(data = -c(name, description)) %>%
  mutate(crandb = map(name, pkgsearch::cran_package))

pkg_tbl <-
  pkg %>%
  select(-data) %>%
  mutate(crandb = map(crandb, unclass)) %>%
  hoist(
    crandb,
    version = "Version",
    title = "Title",
    description = "Description",
    date = "Date/Publication",
    maintainer = "Maintainer",
    license = "License",
    url = "URL",
    bugs = "BugReports"
  ) %>%
  select(-crandb) %>%
  mutate(date = as.Date(date)) %>%
  mutate_at(vars(title, description), sanitize_text) %>%
  mutate_at(vars(url), sanitize_multi) %>%
  arrange(name)

pkg_tbl

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
