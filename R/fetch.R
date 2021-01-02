get_query_keywords <- function() {
  c("setClass", "DBIConnection")
}

get_api_query <- function() {
  paste0(c(get_query_keywords(), "org:cran"), collapse = "")
}

get_query_url <- function(name) {
  paste0(
    "https://github.com/cran/",  name, "/search?q=",
    paste(get_query_keywords(), collapse = "+")
  )
}

fetch_pkg_tbl <- function() {
  x <- gh::gh(
    "/search/code",
    q = get_api_query(),
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
