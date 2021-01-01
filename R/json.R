read_by_pkg <- function() {
  files <- dir("docs/by-package", full.names = TRUE)
  names <- sub("[.][^.]*$", "", basename(files))
  map(set_names(files, names), jsonlite::read_json)
}

create_all_json <- function() {
  all <- read_by_pkg()

  all_named <- unname(imap(all, ~ { rlang::list2(name = .y, !!!.x) }))

  all_url <- map(all_named, ~ {
    if (!is.null(.x$url)) .x$url <- I(.x$url)
    if (length(.x$date) == 0) .x$date <- NULL
    if (length(.x$bugs) == 0) .x$bugs <- NULL
    .x
  })

  jsonlite::write_json(all_url, "docs/all.json", pretty = TRUE, auto_unbox = TRUE)
}
