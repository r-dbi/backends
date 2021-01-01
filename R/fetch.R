fetch_pkg_tbl <- function() {
  x <- gh::gh(
    "/search/code",
    q = "setClass DBIConnection org:cran",
    per_page = 100
  )

  pkg <-
    tibble(items = x$items) %>%
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
}
