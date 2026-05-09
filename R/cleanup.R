sanitize_text <- function(x) {
  x <- gsub("\r", "", x, fixed = TRUE)
  x <- gsub("\n", " ", x, fixed = TRUE)
  x <- gsub("<U+000a>", " ", x, fixed = TRUE)
  x <- unquote_known_words(x)
  x
}

sanitize_multi <- function(x) {
  x <- sub("^[ \n]*", "", x)
  x <- strsplit(x, "(?:[,\n][ \n]*)", perl = TRUE)
  x <- map(x, ~ gsub(" .*$", "", .))
  x
}

# Software/technology names that CRAN policy asks authors to wrap in single
# (or sometimes double) quotes inside Title and Description fields. The
# wrapping is a CRAN artifact; the JSON we publish should carry the bare names.
# Extend inst/known-words.txt when new backends introduce additional names.
read_known_quoted_words <- function() {
  path <- system.file("known-words.txt", package = "backends")
  if (!nzchar(path)) path <- "inst/known-words.txt"
  words <- readLines(path, warn = FALSE, encoding = "UTF-8")
  words <- words[nzchar(words)]
  words
}

unquote_known_words <- function(x) {
  words <- read_known_quoted_words()
  words <- words[order(-nchar(words))]
  for (w in words) {
    x <- gsub(paste0("'", w, "'"), w, x, fixed = TRUE)
    x <- gsub(paste0('"', w, '"'), w, x, fixed = TRUE)
  }
  x
}
