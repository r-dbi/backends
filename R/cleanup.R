sanitize_text <- function(x) {
  x <- gsub("\r", "", x, fixed = TRUE)
  x <- gsub("\n", " ", x, fixed = TRUE)
  x <- gsub("<U+000a>", " ", x, fixed = TRUE)
  x
}

sanitize_multi <- function(x) {
  x <- sub("^[ \n]*", "", x)
  x <- strsplit(x, "(?:[,\n][ \n]*)", perl = TRUE)
  x <- map(x, ~ gsub(" .*$", "", .))
  x
}
