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
# Extend this list when new backends introduce additional names.
known_quoted_words <- c(
  "(ADLS)", "(HDFS)", "(S3)",
  "ADBC", "API", "APIs",
  "AWS", "AWS Athena", "AWS SDK",
  "Amazon Redshift", "Andromeda", "Apache Impala",
  "Azure Data Explorer", "AzureR", "AzureRMR",
  "BigQuery", "Boto3",
  "C++", "CKAN", "ClickHouse",
  "DBI", "DataBase Interface", "Databricks",
  "EMC",
  "GDAL", "GDAL vector data source", "Google BigQuery",
  "HBase", "Hadoop",
  "IBM Netezza", "InterSystems IRIS", "Isilon",
  "JDBC", "Java Database Connectivity",
  "KQL", "Kudu", "Kusto",
  "MariaDB", "Microsoft Parallel Database Warehouse",
  "Microsoft SQL Server", "Microsoft Windows",
  "MonetDB", "MySQL",
  "ODBC", "Oracle",
  "PostgreSQL", "Python",
  "R", "RMariaDB", "RStudio", "Redshift",
  "SDK", "SQL", "SQL Server", "SQLite", "Snowflake", "Spark",
  "Yandex Clickhouse",
  "adbcdrivermanager", "analytics",
  "datastore", "dbplyr", "dplyr",
  "jTDS",
  "libpq",
  "macOS",
  "paws", "pins", "postgresql-devel",
  "sf"
)

unquote_known_words <- function(x) {
  words <- known_quoted_words[order(-nchar(known_quoted_words))]
  for (w in words) {
    x <- gsub(paste0("'", w, "'"), w, x, fixed = TRUE)
    x <- gsub(paste0('"', w, '"'), w, x, fixed = TRUE)
  }
  x
}
