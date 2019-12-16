sanitize_text <- function(x) {
  x <- gsub("\r", "", x, fixed = TRUE)
  x <- gsub("\n", " ", x, fixed = TRUE)
  x <- gsub("<U+000a>", " ", x, fixed = TRUE)
  x
}
