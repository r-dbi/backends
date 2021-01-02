
<!-- README.md is generated from README.Rmd. Please edit that file -->

# backends

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

The goal of backends is to provide a web API that lists all known DBI
backends. It is implemented as a set of static JSON files

## Usage

### Query all packages

``` r
all <- httr::GET("https://r-dbi.github.io/backends/all.json")
httr::stop_for_status(all)
all_df <- httr::content(all, flatten = TRUE, simplifyVector = TRUE)
```

``` r
fix_url <- function(x) {
  if (length(x) == 0 || anyNA(x)) {
    x <- ""
  }
  glue::glue_collapse(x, ", ")
}

all_df$url <- purrr::map_chr(all_df$url, fix_url)
all_df$bugs <- purrr::map_chr(all_df$bugs, fix_url)
all_df[] <- purrr::map(all_df, knitr:::escape_html)
all_df$description <- paste0("<details>", all_df$description, "</details>")
knitr::kable(all_df, "html", escape = FALSE)
```

<table>
<thead>
<tr>
<th style="text-align:left;">
name
</th>
<th style="text-align:left;">
version
</th>
<th style="text-align:left;">
title
</th>
<th style="text-align:left;">
description
</th>
<th style="text-align:left;">
date
</th>
<th style="text-align:left;">
maintainer
</th>
<th style="text-align:left;">
license
</th>
<th style="text-align:left;">
url
</th>
<th style="text-align:left;">
bugs
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
AzureKusto
</td>
<td style="text-align:left;">
1.0.6
</td>
<td style="text-align:left;">
Interface to ‘Kusto’/‘Azure Data Explorer’
</td>
<td style="text-align:left;">
<details>
An interface to ‘Azure Data Explorer’, also known as ‘Kusto’, a fast,
highly scalable data exploration service from Microsoft:
&lt;<https://azure.microsoft.com/en-us/services/data-explorer/%3E>;.
Includes ‘DBI’ and ‘dplyr’ interfaces, with the latter modelled after
the ‘dbplyr’ package, whereby queries are translated from R into the
native ‘KQL’ query language and executed lazily. On the admin side, the
package extends the object framework provided by ‘AzureRMR’ to support
creation and deletion of databases, and management of database
principals. Part of the ‘AzureR’ family of packages.
</details>
</td>
<td style="text-align:left;">
2020-04-27
</td>
<td style="text-align:left;">
Alex Kyllo &lt;<jekyllo@microsoft.com%3E>;
</td>
<td style="text-align:left;">
MIT + file LICENSE
</td>
<td style="text-align:left;">
<https://github.com/Azure/AzureKusto>, <https://github.com/Azure/AzureR>
</td>
<td style="text-align:left;">
<https://github.com/Azure/AzureKusto/issues>
</td>
</tr>
<tr>
<td style="text-align:left;">
bigrquery
</td>
<td style="text-align:left;">
1.3.2
</td>
<td style="text-align:left;">
An Interface to Google’s ‘BigQuery’ ‘API’
</td>
<td style="text-align:left;">
<details>
Easily talk to Google’s ‘BigQuery’ database from R.
</details>
</td>
<td style="text-align:left;">
2020-10-05
</td>
<td style="text-align:left;">
Hadley Wickham &lt;<hadley@rstudio.com%3E>;
</td>
<td style="text-align:left;">
GPL-3
</td>
<td style="text-align:left;">
<https://github.com/r-dbi/bigrquery>
</td>
<td style="text-align:left;">
<https://github.com/r-dbi/bigrquery/issues>
</td>
</tr>
<tr>
<td style="text-align:left;">
ckanr
</td>
<td style="text-align:left;">
0.5.0
</td>
<td style="text-align:left;">
Client for the Comprehensive Knowledge Archive Network (‘CKAN’) API
</td>
<td style="text-align:left;">
<details>
Client for ‘CKAN’ API (&lt;<https://ckan.org/%3E>;). Includes interface
to ‘CKAN’ ‘APIs’ for search, list, show for packages, organizations, and
resources. In addition, provides an interface to the ‘datastore’ API.
</details>
</td>
<td style="text-align:left;">
2020-07-30
</td>
<td style="text-align:left;">
Scott Chamberlain &lt;<myrmecocystus@gmail.com%3E>;
</td>
<td style="text-align:left;">
MIT + file LICENSE
</td>
<td style="text-align:left;">
<https://docs.ropensci.org/ckanr>, <https://github.com/ropensci/ckanr>
</td>
<td style="text-align:left;">
<https://github.com/ropensci/ckanr/issues>
</td>
</tr>
<tr>
<td style="text-align:left;">
connections
</td>
<td style="text-align:left;">
0.1.1
</td>
<td style="text-align:left;">
Integrates with the ‘RStudio’ Connections Pane and ‘pins’
</td>
<td style="text-align:left;">
<details>
Enables ‘DBI’ compliant packages to integrate with the ‘RStudio’
connections pane, and the ‘pins’ package. It automates the display of
schemata, tables, views, as well as the preview of the table’s top 1000
records.
</details>
</td>
<td style="text-align:left;">
2020-02-07
</td>
<td style="text-align:left;">
Javier Luraschi &lt;<javier@rstudio.com%3E>;
</td>
<td style="text-align:left;">
GPL-3
</td>
<td style="text-align:left;">
<https://github.com/edgararuiz/connections>
</td>
<td style="text-align:left;">
<https://github.com/edgararuiz/connections/issues>
</td>
</tr>
<tr>
<td style="text-align:left;">
DatabaseConnector
</td>
<td style="text-align:left;">
3.0.0
</td>
<td style="text-align:left;">
Connecting to Various Database Platforms
</td>
<td style="text-align:left;">
<details>
An R ‘DataBase Interface’ (‘DBI’) compatible interface to various
database platforms (‘PostgreSQL’, ‘Oracle’, ‘Microsoft SQL Server’,
‘Amazon Redshift’, ‘Microsoft Parallel Database Warehouse’, ‘IBM
Netezza’, ‘Apache Impala’, ‘Google BigQuery’, and ‘SQLite’). Also
includes support for fetching data as ‘Andromeda’ objects. Uses ‘Java
Database Connectivity’ (‘JDBC’) to connect to databases (except SQLite).
</details>
</td>
<td style="text-align:left;">
2020-06-06
</td>
<td style="text-align:left;">
Martijn Schuemie &lt;<schuemie@ohdsi.org%3E>;
</td>
<td style="text-align:left;">
Apache License
</td>
<td style="text-align:left;">
<https://ohdsi.github.io/DatabaseConnector>,
<https://github.com/OHDSI/DatabaseConnector>
</td>
<td style="text-align:left;">
<https://github.com/OHDSI/DatabaseConnector/issues>
</td>
</tr>
<tr>
<td style="text-align:left;">
DBI.RODBC
</td>
<td style="text-align:left;">
0.1-2
</td>
<td style="text-align:left;">
DBI front-end to RODBC
</td>
<td style="text-align:left;">
<details>
A simple DBI front-end to the RODBC package. This package uses version 4
style classes and methods to create a front-end to the existing RODBC
(version 0.8-3) package.
</details>
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
David A. James &lt;<dj@bell-labs.com%3E>;
</td>
<td style="text-align:left;">
GPL (version 2 or later)
</td>
<td style="text-align:left;">
<http://developer.r-project.org/db>
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
DBI.RPgSQL
</td>
<td style="text-align:left;">
0.1-2
</td>
<td style="text-align:left;">
DBI front-end to RPgSQL
</td>
<td style="text-align:left;">
<details>
A simple DBI front-end to the RPgSQL package. This package uses version
4 style classes and methods to create a front-end to the existing RPgSQL
(version 1.0-0) package.
</details>
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
David A. James &lt;<dj@bell-labs.com%3E>;
</td>
<td style="text-align:left;">
GPL (version 2 or later)
</td>
<td style="text-align:left;">
<http://developer.r-project.org/db>
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
dittodb
</td>
<td style="text-align:left;">
0.1.3
</td>
<td style="text-align:left;">
A Test Environment for Database Requests
</td>
<td style="text-align:left;">
<details>
Testing and documenting code that communicates with remote databases can
be painful. Although the interaction with R is usually relatively simple
(e.g. data(frames) passed to and from a database), because they rely on
a separate service and the data there, testing them can be difficult to
set up, unsustainable in a continuous integration environment, or
impossible without replicating an entire production cluster. This
package addresses that by allowing you to make recordings from your
database interactions and then play them back while testing (or in other
contexts) all without needing to spin up or have access to the database
your code would typically connect to.
</details>
</td>
<td style="text-align:left;">
2020-10-10
</td>
<td style="text-align:left;">
Jonathan Keane &lt;<jkeane@gmail.com%3E>;
</td>
<td style="text-align:left;">
Apache License (&gt;= 2.0)
</td>
<td style="text-align:left;">
<https://dittodb.jonkeane.com/>, <https://github.com/ropensci/dittodb>
</td>
<td style="text-align:left;">
<https://github.com/ropensci/dittodb/issues>
</td>
</tr>
<tr>
<td style="text-align:left;">
duckdb
</td>
<td style="text-align:left;">
0.2.3
</td>
<td style="text-align:left;">
DBI Package for the DuckDB Database Management System
</td>
<td style="text-align:left;">
<details>
The DuckDB project is an embedded analytical data management system with
support for the Structured Query Language (SQL). This package includes
all of DuckDB and a R Database Interface (DBI) connector.
</details>
</td>
<td style="text-align:left;">
2020-12-12
</td>
<td style="text-align:left;">
Hannes Mühleisen &lt;<hannes@cwi.nl%3E>;
</td>
<td style="text-align:left;">
MPL
</td>
<td style="text-align:left;">
<https://duckdb.org/>, <https://github.com/cwida/duckdb>
</td>
<td style="text-align:left;">
<https://github.com/cwida/duckdb/issues>
</td>
</tr>
<tr>
<td style="text-align:left;">
implyr
</td>
<td style="text-align:left;">
0.3.0
</td>
<td style="text-align:left;">
R Interface for Apache Impala
</td>
<td style="text-align:left;">
<details>
‘SQL’ back-end to ‘dplyr’ for Apache Impala, the massively parallel
processing query engine for Apache ‘Hadoop’. Impala enables low-latency
‘SQL’ queries on data stored in the ‘Hadoop’ Distributed File System
‘(HDFS)’, Apache ‘HBase’, Apache ‘Kudu’, Amazon Simple Storage Service
‘(S3)’, Microsoft Azure Data Lake Store ‘(ADLS)’, and Dell ‘EMC’
‘Isilon’. See &lt;<https://impala.apache.org%3E>; for more information
about Impala.
</details>
</td>
<td style="text-align:left;">
2019-07-21
</td>
<td style="text-align:left;">
Ian Cook &lt;<ian@cloudera.com%3E>;
</td>
<td style="text-align:left;">
Apache License 2.0 \| file LICENSE
</td>
<td style="text-align:left;">
<https://github.com/ianmcook/implyr>
</td>
<td style="text-align:left;">
<https://github.com/ianmcook/implyr/issues>
</td>
</tr>
<tr>
<td style="text-align:left;">
lazysf
</td>
<td style="text-align:left;">
0.1.0
</td>
<td style="text-align:left;">
Delayed Read for ‘GDAL’ Vector Data Sources
</td>
<td style="text-align:left;">
<details>
Lazy read for drawings. A ‘dplyr’ back end for data sources supported by
‘GDAL’ vector drivers, that allows working with local or remote sources
as if they are in-memory data frames. Basic features works with any
drawing format (‘GDAL vector data source’) supported by the ‘sf’
package.
</details>
</td>
<td style="text-align:left;">
2020-11-14
</td>
<td style="text-align:left;">
Michael Sumner &lt;<mdsumner@gmail.com%3E>;
</td>
<td style="text-align:left;">
GPL-3
</td>
<td style="text-align:left;">
<https://github.com/mdsumner/lazysf>
</td>
<td style="text-align:left;">
<https://github.com/mdsumner/lazysf/issues>
</td>
</tr>
<tr>
<td style="text-align:left;">
MonetDB.R
</td>
<td style="text-align:left;">
2.0.0
</td>
<td style="text-align:left;">
Connect MonetDB to R
</td>
<td style="text-align:left;">
<details>
Allows to pull data from MonetDB into R.
</details>
</td>
<td style="text-align:left;">
2020-08-14
</td>
<td style="text-align:left;">
Mitchell Weggemans &lt;<mitchell.weggemans@monetdbsolutions.com%3E>;
</td>
<td style="text-align:left;">
MPL (== 2.0)
</td>
<td style="text-align:left;">
<http://www.monetdb.org>
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
MonetDBLite
</td>
<td style="text-align:left;">
0.6.0
</td>
<td style="text-align:left;">
In-Process Version of ‘MonetDB’
</td>
<td style="text-align:left;">
<details>
An in-process version of ‘MonetDB’, a SQL database designed for
analytical tasks. Similar to ‘SQLite’, the database runs entirely inside
the ‘R’ shell.
</details>
</td>
<td style="text-align:left;">
2018-07-27
</td>
<td style="text-align:left;">
Hannes Mühleisen &lt;<hannes@cwi.nl%3E>;
</td>
<td style="text-align:left;">
MPL (== 2.0)
</td>
<td style="text-align:left;">
<https://github.com/hannesmuehleisen/MonetDBLite-R>
</td>
<td style="text-align:left;">
<https://github.com/hannesmuehleisen/MonetDBLite-R/issues>
</td>
</tr>
<tr>
<td style="text-align:left;">
noctua
</td>
<td style="text-align:left;">
1.9.1
</td>
<td style="text-align:left;">
Connect to ‘AWS Athena’ using R ‘AWS SDK’ ‘paws’ (‘DBI’ Interface)
</td>
<td style="text-align:left;">
<details>
Designed to be compatible with the ‘R’ package ‘DBI’ (Database
Interface) when connecting to Amazon Web Service (‘AWS’) Athena
&lt;<https://aws.amazon.com/athena/%3E>;. To do this the ‘R’ ‘AWS’
Software Development Kit (‘SDK’) ‘paws’
&lt;<https://github.com/paws-r/paws%3E>; is used as a driver.
</details>
</td>
<td style="text-align:left;">
2020-11-17
</td>
<td style="text-align:left;">
Dyfan Jones &lt;<dyfan.r.jones@gmail.com%3E>;
</td>
<td style="text-align:left;">
MIT + file LICENSE
</td>
<td style="text-align:left;">
<https://github.com/DyfanJones/noctua>
</td>
<td style="text-align:left;">
<https://github.com/DyfanJones/noctua/issues>
</td>
</tr>
<tr>
<td style="text-align:left;">
odbc
</td>
<td style="text-align:left;">
1.3.0
</td>
<td style="text-align:left;">
Connect to ODBC Compatible Databases (using the DBI Interface)
</td>
<td style="text-align:left;">
<details>
A DBI-compatible interface to ODBC databases.
</details>
</td>
<td style="text-align:left;">
2020-10-27
</td>
<td style="text-align:left;">
Jim Hester &lt;<jim.hester@rstudio.com%3E>;
</td>
<td style="text-align:left;">
MIT + file LICENSE
</td>
<td style="text-align:left;">
<https://github.com/r-dbi/odbc>, <https://db.rstudio.com>
</td>
<td style="text-align:left;">
<https://github.com/r-dbi/odbc/issues>
</td>
</tr>
<tr>
<td style="text-align:left;">
pool
</td>
<td style="text-align:left;">
0.1.4.3
</td>
<td style="text-align:left;">
Object Pooling
</td>
<td style="text-align:left;">
<details>
Enables the creation of object pools, which make it less computationally
expensive to fetch a new object. Currently the only supported pooled
objects are ‘DBI’ connections.
</details>
</td>
<td style="text-align:left;">
2019-10-03
</td>
<td style="text-align:left;">
Joe Cheng &lt;<joe@rstudio.com%3E>;
</td>
<td style="text-align:left;">
GPL-3
</td>
<td style="text-align:left;">
<https://github.com/rstudio/pool>
</td>
<td style="text-align:left;">
<https://github.com/rstudio/pool/issues>
</td>
</tr>
<tr>
<td style="text-align:left;">
rapbase
</td>
<td style="text-align:left;">
1.10.0
</td>
<td style="text-align:left;">
Base Functions and Resources for Rapporteket
</td>
<td style="text-align:left;">
<details>
Provide common functions and resources for registry specific R-packages
at Rapporteket
&lt;<https://rapporteket.github.io/rapporteket/articles/short_introduction.html%3E>;.
This package is relevant for developers of packages/registries at
Rapporteket.
</details>
</td>
<td style="text-align:left;">
2019-08-07
</td>
<td style="text-align:left;">
Are Edvardsen &lt;<biorakel@gmail.com%3E>;
</td>
<td style="text-align:left;">
GPL-3
</td>
<td style="text-align:left;">
<http://github.com/Rapporteket/rapbase>
</td>
<td style="text-align:left;">
<http://github.com/Rapporteket/rapbase/issues>
</td>
</tr>
<tr>
<td style="text-align:left;">
RAthena
</td>
<td style="text-align:left;">
1.11.1
</td>
<td style="text-align:left;">
Connect to ‘AWS Athena’ using ‘Boto3’ (‘DBI’ Interface)
</td>
<td style="text-align:left;">
<details>
Designed to be compatible with the R package ‘DBI’ (Database Interface)
when connecting to Amazon Web Service (‘AWS’) Athena
&lt;<https://aws.amazon.com/athena/%3E>;. To do this ‘Python’ ‘Boto3’
Software Development Kit (‘SDK’)
&lt;<https://boto3.amazonaws.com/v1/documentation/api/latest/index.html%3E>;
is used as a driver.
</details>
</td>
<td style="text-align:left;">
2020-11-17
</td>
<td style="text-align:left;">
Dyfan Jones &lt;<dyfan.r.jones@gmail.com%3E>;
</td>
<td style="text-align:left;">
MIT + file LICENSE
</td>
<td style="text-align:left;">
<https://github.com/DyfanJones/RAthena>
</td>
<td style="text-align:left;">
<https://github.com/DyfanJones/RAthena/issues>
</td>
</tr>
<tr>
<td style="text-align:left;">
RClickhouse
</td>
<td style="text-align:left;">
0.5.2
</td>
<td style="text-align:left;">
A ‘DBI’ Interface to the ‘Yandex Clickhouse’ Database Providing Basic
‘dplyr’ Support
</td>
<td style="text-align:left;">
<details>
‘Yandex Clickhouse’ (&lt;<https://clickhouse.yandex/%3E>;) is a
high-performance relational column-store database to enable big data
exploration and ‘analytics’ scaling to petabytes of data. Methods are
provided that enable working with ‘Yandex Clickhouse’ databases via
‘DBI’ methods and using ‘dplyr’/‘dbplyr’ idioms.
</details>
</td>
<td style="text-align:left;">
2020-03-06
</td>
<td style="text-align:left;">
Christian Hotz-Behofsits &lt;<christian.hotz-behofsits@wu.ac.at%3E>;
</td>
<td style="text-align:left;">
GPL-2
</td>
<td style="text-align:left;">
<https://github.com/IMSMWU/RClickhouse>
</td>
<td style="text-align:left;">
<https://github.com/IMSMWU/RClickhouse/issues>
</td>
</tr>
<tr>
<td style="text-align:left;">
RecordLinkage
</td>
<td style="text-align:left;">
0.4-12.1
</td>
<td style="text-align:left;">
Record Linkage Functions for Linking and Deduplicating Data Sets
</td>
<td style="text-align:left;">
<details>
Provides functions for linking and deduplicating data sets. Methods
based on a stochastic approach are implemented as well as classification
algorithms from the machine learning domain. For details, see our paper
“The RecordLinkage Package: Detecting Errors in Data” Sariyar M / Borg A
(2010) &lt;<doi:10.32614/RJ-2010-017%3E>;.
</details>
</td>
<td style="text-align:left;">
2020-08-25
</td>
<td style="text-align:left;">
Murat Sariyar &lt;<murat.sariyar@bfh.ch%3E>;
</td>
<td style="text-align:left;">
GPL (&gt;= 2)
</td>
<td style="text-align:left;">
,
<https://journal.r-project.org/archive/2010-2/RJournal_2010-2_Sariyar+Borg.pdf>
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
RJDBC
</td>
<td style="text-align:left;">
0.2-8
</td>
<td style="text-align:left;">
Provides Access to Databases Through the JDBC Interface
</td>
<td style="text-align:left;">
<details>
The RJDBC package is an implementation of R’s DBI interface using JDBC
as a back-end. This allows R to connect to any DBMS that has a JDBC
driver.
</details>
</td>
<td style="text-align:left;">
2020-03-10
</td>
<td style="text-align:left;">
Simon Urbanek &lt;<Simon.Urbanek@r-project.org%3E>;
</td>
<td style="text-align:left;">
MIT + file LICENSE
</td>
<td style="text-align:left;">
<http://www.rforge.net/RJDBC/>
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
RMariaDB
</td>
<td style="text-align:left;">
1.0.11
</td>
<td style="text-align:left;">
Database Interface and ‘MariaDB’ Driver
</td>
<td style="text-align:left;">
<details>
Implements a ‘DBI’-compliant interface to ‘MariaDB’
(&lt;<https://mariadb.org/%3E>;) and ‘MySQL’
(&lt;<https://www.mysql.com/%3E>;) databases.
</details>
</td>
<td style="text-align:left;">
2020-12-16
</td>
<td style="text-align:left;">
Kirill Müller &lt;<krlmlr+r@mailbox.org%3E>;
</td>
<td style="text-align:left;">
GPL-3
</td>
<td style="text-align:left;">
<https://rmariadb.r-dbi.org>, <https://github.com/r-dbi/RMariaDB>,
<https://downloads.mariadb.org/connector-c/>
</td>
<td style="text-align:left;">
<https://github.com/r-dbi/RMariaDB/issues>
</td>
</tr>
<tr>
<td style="text-align:left;">
RMySQL
</td>
<td style="text-align:left;">
0.10.21
</td>
<td style="text-align:left;">
Database Interface and ‘MySQL’ Driver for R
</td>
<td style="text-align:left;">
<details>
Legacy ‘DBI’ interface to ‘MySQL’ / ‘MariaDB’ based on old code ported
from S-PLUS. A modern ‘MySQL’ client based on ‘Rcpp’ is available from
the ‘RMariaDB’ package.
</details>
</td>
<td style="text-align:left;">
2020-12-15
</td>
<td style="text-align:left;">
Jeroen Ooms &lt;<jeroen@berkeley.edu%3E>;
</td>
<td style="text-align:left;">
GPL-2
</td>
<td style="text-align:left;">
<https://downloads.mariadb.org/connector-c/>
</td>
<td style="text-align:left;">
<https://github.com/r-dbi/rmysql/issues>
</td>
</tr>
<tr>
<td style="text-align:left;">
RODBCDBI
</td>
<td style="text-align:left;">
0.1.1
</td>
<td style="text-align:left;">
Provides Access to Databases Through the ODBC Interface
</td>
<td style="text-align:left;">
<details>
An implementation of R’s DBI interface using ODBC package as a back-end.
This allows R to connect to any DBMS that has a ODBC driver.
</details>
</td>
<td style="text-align:left;">
2016-03-14
</td>
<td style="text-align:left;">
Nagi Teramo &lt;<teramonagi@gmail.com%3E>;
</td>
<td style="text-align:left;">
MIT + file LICENSE
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
ROracle
</td>
<td style="text-align:left;">
1.3-1
</td>
<td style="text-align:left;">
OCI Based Oracle Database Interface for R
</td>
<td style="text-align:left;">
<details>
Oracle Database interface (DBI) driver for R. This is a DBI-compliant
Oracle driver based on the OCI.
</details>
</td>
<td style="text-align:left;">
2016-10-26
</td>
<td style="text-align:left;">
Rajendra S. Pingte &lt;<rajendra.pingte@oracle.com%3E>;
</td>
<td style="text-align:left;">
LGPL
</td>
<td style="text-align:left;">
<http://www.oracle.com>
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
RPostgres
</td>
<td style="text-align:left;">
1.2.1
</td>
<td style="text-align:left;">
‘Rcpp’ Interface to ‘PostgreSQL’
</td>
<td style="text-align:left;">
<details>
Fully ‘DBI’-compliant ‘Rcpp’-backed interface to ‘PostgreSQL’
&lt;<https://www.postgresql.org/%3E>;, an open-source relational
database.
</details>
</td>
<td style="text-align:left;">
2020-09-28
</td>
<td style="text-align:left;">
Kirill Müller &lt;<krlmlr+r@mailbox.org%3E>;
</td>
<td style="text-align:left;">
GPL-3
</td>
<td style="text-align:left;">
<https://rpostgres.r-dbi.org>, <https://github.com/r-dbi/RPostgres>
</td>
<td style="text-align:left;">
<https://github.com/r-dbi/RPostgres/issues>
</td>
</tr>
<tr>
<td style="text-align:left;">
RPostgreSQL
</td>
<td style="text-align:left;">
0.6-2
</td>
<td style="text-align:left;">
R Interface to the ‘PostgreSQL’ Database System
</td>
<td style="text-align:left;">
<details>
Database interface and ‘PostgreSQL’ driver for ‘R’. This package
provides a Database Interface ‘DBI’ compliant driver for ‘R’ to access
‘PostgreSQL’ database systems. In order to build and install this
package from source, ‘PostgreSQL’ itself must be present your system to
provide ‘PostgreSQL’ functionality via its libraries and header files.
These files are provided as ‘postgresql-devel’ package under some Linux
distributions. On ‘macOS’ and ‘Microsoft Windows’ system the attached
‘libpq’ library source will be used.
</details>
</td>
<td style="text-align:left;">
2017-06-24
</td>
<td style="text-align:left;">
Tomoaki Nishiyama &lt;<tomoakin@staff.kanazawa-u.ac.jp%3E>;
</td>
<td style="text-align:left;">
GPL-2 \| file LICENSE
</td>
<td style="text-align:left;">
<https://github.com/tomoakin/RPostgreSQL>,
<https://cran.r-project.org/package=DBI>, <http://www.postgresql.org>
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
RPresto
</td>
<td style="text-align:left;">
1.3.5
</td>
<td style="text-align:left;">
DBI Connector to Presto
</td>
<td style="text-align:left;">
<details>
Implements a ‘DBI’ compliant interface to Presto. Presto is an open
source distributed SQL query engine for running interactive analytic
queries against data sources of all sizes ranging from gigabytes to
petabytes: &lt;<https://prestodb.io/%3E>;.
</details>
</td>
<td style="text-align:left;">
2020-11-13
</td>
<td style="text-align:left;">
Onur Ismail Filiz &lt;<onur@fb.com%3E>;
</td>
<td style="text-align:left;">
BSD\_3\_clause + file LICENSE
</td>
<td style="text-align:left;">
<https://github.com/prestodb/RPresto>
</td>
<td style="text-align:left;">
<https://github.com/prestodb/RPresto/issues>
</td>
</tr>
<tr>
<td style="text-align:left;">
RSQLite
</td>
<td style="text-align:left;">
2.2.1
</td>
<td style="text-align:left;">
‘SQLite’ Interface for R
</td>
<td style="text-align:left;">
<details>
Embeds the ‘SQLite’ database engine in R and provides an interface
compliant with the ‘DBI’ package. The source for the ‘SQLite’ engine is
included.
</details>
</td>
<td style="text-align:left;">
2020-09-30
</td>
<td style="text-align:left;">
Kirill Müller &lt;<krlmlr+r@mailbox.org%3E>;
</td>
<td style="text-align:left;">
LGPL (&gt;= 2.1)
</td>
<td style="text-align:left;">
<https://rsqlite.r-dbi.org>, <https://github.com/r-dbi/RSQLite>
</td>
<td style="text-align:left;">
<https://github.com/r-dbi/RSQLite/issues>
</td>
</tr>
<tr>
<td style="text-align:left;">
RSQLServer
</td>
<td style="text-align:left;">
0.3.0
</td>
<td style="text-align:left;">
SQL Server R Database Interface (DBI) and ‘dplyr’ SQL Backend
</td>
<td style="text-align:left;">
<details>
Utilises The ‘jTDS’ project’s ‘JDBC’ 3.0 ‘SQL Server’ driver to extend
‘DBI’ classes and methods. The package also implements a ‘SQL’ backend
to the ‘dplyr’ package.
</details>
</td>
<td style="text-align:left;">
2017-06-17
</td>
<td style="text-align:left;">
Imanuel Costigan &lt;<i.costigan@me.com%3E>;
</td>
<td style="text-align:left;">
GPL-2
</td>
<td style="text-align:left;">
<https://github.com/imanuelcostigan/RSQLServer>
</td>
<td style="text-align:left;">
<https://github.com/imanuelcostigan/RSQLServer/issues>
</td>
</tr>
<tr>
<td style="text-align:left;">
sergeant
</td>
<td style="text-align:left;">
0.9.0
</td>
<td style="text-align:left;">
Tools to Transform and Query Data with Apache Drill
</td>
<td style="text-align:left;">
<details>
Apache Drill is a low-latency distributed query engine designed to
enable data exploration and analysis on both relational and
non-relational data stores, scaling to petabytes of data. Methods are
provided that enable working with Apache Drill instances via the REST
API, DBI methods and using ‘dplyr’/‘dbplyr’ idioms. Helper functions are
included to facilitate using official Drill Docker images/containers.
</details>
</td>
<td style="text-align:left;">
2020-06-01
</td>
<td style="text-align:left;">
Bob Rudis &lt;<bob@rud.is%3E>;
</td>
<td style="text-align:left;">
MIT + file LICENSE
</td>
<td style="text-align:left;">
<https://gitlab.com/hrbrmstr/sergeant>
</td>
<td style="text-align:left;">
<https://gitlab.com/hrbrmstr/sergeant/issues>
</td>
</tr>
<tr>
<td style="text-align:left;">
SpaDES.core
</td>
<td style="text-align:left;">
1.0.3
</td>
<td style="text-align:left;">
Core Utilities for Developing and Running Spatially Explicit Discrete
Event Models
</td>
<td style="text-align:left;">
<details>
Provides the core framework for a discrete event system (DES) to
implement a complete data-to-decisions, reproducible workflow. The core
DES components facilitate modularity, and easily enable the user to
include additional functionality by running user-built modules. Includes
conditional scheduling, restart after interruption, packaging of
reusable modules, tools for developing arbitrary automated workflows,
automated interweaving of modules of different temporal resolution, and
tools for visualizing and understanding the DES project.
</details>
</td>
<td style="text-align:left;">
2020-09-12
</td>
<td style="text-align:left;">
Alex M Chubaty &lt;<alex.chubaty@gmail.com%3E>;
</td>
<td style="text-align:left;">
GPL-3
</td>
<td style="text-align:left;">
<https://spades-core.predictiveecology.org/>,
<https://github.com/PredictiveEcology/SpaDES.core>
</td>
<td style="text-align:left;">
<https://github.com/PredictiveEcology/SpaDES.core/issues>
</td>
</tr>
<tr>
<td style="text-align:left;">
TSdbi
</td>
<td style="text-align:left;">
2017.4-1
</td>
<td style="text-align:left;">
Time Series Database Interface
</td>
<td style="text-align:left;">
<details>
Provides a common interface to time series databases. The objective is
to define a standard interface so users can retrieve time series data
from various sources with a simple, common, set of commands, and so
programs can be written to be portable with respect to the data source.
The SQL implementations also provide a database table design, so users
needing to set up a time series database have a reasonably complete way
to do this easily. The interface provides for a variety of options with
respect to the representation of time series in R. The interface, and
the SQL implementations, also handle vintages of time series data
(sometime called editions or real-time data). There is also a (not yet
well tested) mechanism to handle multilingual data documentation.
Comprehensive examples of all the ’TS\*’ packages is provided in the
vignette Guide.pdf with the ‘TSdata’ package.
</details>
</td>
<td style="text-align:left;">
2017-05-10
</td>
<td style="text-align:left;">
Paul Gilbert &lt;<pgilbert.ttv9z@ncf.ca%3E>;
</td>
<td style="text-align:left;">
GPL-2
</td>
<td style="text-align:left;">
<http://tsdbi.r-forge.r-project.org/>
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
TSfame
</td>
<td style="text-align:left;">
2015.4-1
</td>
<td style="text-align:left;">
‘TSdbi’ Extensions for Fame
</td>
<td style="text-align:left;">
<details>
A ‘fame’ interface for ‘TSdbi’. Comprehensive examples of all the ’TS\*’
packages is provided in the vignette Guide.pdf with the ‘TSdata’
package.
</details>
</td>
<td style="text-align:left;">
2015-04-30
</td>
<td style="text-align:left;">
Paul Gilbert &lt;<pgilbert.ttv9z@ncf.ca%3E>;
</td>
<td style="text-align:left;">
GPL-2
</td>
<td style="text-align:left;">
<http://tsdbi.r-forge.r-project.org/>
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
TSgetSymbol
</td>
<td style="text-align:left;">
2013.9-1
</td>
<td style="text-align:left;">
TSdbi extension to connect with getSymbols
</td>
<td style="text-align:left;">
<details>
Provides methods for generics in the TSdbi package to retrieve data with
getSymbols, in particular from the Federal Reserve FRED database.
Comprehensive examples of all the TS\* packages is provided in the
vignette Guide.pdf with the TSdata package.
</details>
</td>
<td style="text-align:left;">
2013-09-29
</td>
<td style="text-align:left;">
Paul Gilbert &lt;<pgilbert.ttv9z@ncf.ca%3E>;
</td>
<td style="text-align:left;">
GPL-2
</td>
<td style="text-align:left;">
<http://tsdbi.r-forge.r-project.org/>
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
TShistQuote
</td>
<td style="text-align:left;">
2013.9-1
</td>
<td style="text-align:left;">
TSdbi extensions for get.hist.quote
</td>
<td style="text-align:left;">
<details>
Provides methods for generics in the TSdbi package to retrieve data from
historical quote URLs. Comprehensive examples of all the TS\* packages
is provided in the vignette Guide.pdf with the TSdata package.
</details>
</td>
<td style="text-align:left;">
2013-09-29
</td>
<td style="text-align:left;">
Paul Gilbert &lt;<pgilbert.ttv9z@ncf.ca%3E>;
</td>
<td style="text-align:left;">
GPL-2
</td>
<td style="text-align:left;">
<http://tsdbi.r-forge.r-project.org/>
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
TSjson
</td>
<td style="text-align:left;">
2014.4-1
</td>
<td style="text-align:left;">
TSdbi extension for importing time series from web sources via JSON
</td>
<td style="text-align:left;">
<details>
Provides methods for generics in the TSdbi package to retrieve data from
web data sources, importing them using Javascript object notation.
Direct connections or a proxy connection are possible. (Only Statistics
Canada connections are currently supported.) Comprehensive examples of
all the TS\* packages is provided in the vignette Guide.pdf with the
TSdata package.
</details>
</td>
<td style="text-align:left;">
2014-04-09
</td>
<td style="text-align:left;">
Paul Gilbert &lt;<pgilbert.ttv9z@ncf.ca%3E>;
</td>
<td style="text-align:left;">
GPL-2
</td>
<td style="text-align:left;">
<http://tsdbi.r-forge.r-project.org/>
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
TSmisc
</td>
<td style="text-align:left;">
2016.8-1
</td>
<td style="text-align:left;">
‘TSdbi’ Extensions to Wrap Miscellaneous Data Sources
</td>
<td style="text-align:left;">
<details>
Methods to retrieve data from several different sources. This include
historical quote data from ‘Yahoo’ and ‘Oanda’, economic data from
‘FRED’, and ‘xls’ and ‘csv’ data from different sources. Comprehensive
examples of all the ’TS\*’ packages is provided in the vignette
Guide.pdf with the ‘TSdata’ package.
</details>
</td>
<td style="text-align:left;">
2016-08-26
</td>
<td style="text-align:left;">
Paul Gilbert &lt;<pgilbert.ttv9z@ncf.ca%3E>;
</td>
<td style="text-align:left;">
GPL-2
</td>
<td style="text-align:left;">
<http://tsdbi.r-forge.r-project.org/>
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
TSodbc
</td>
<td style="text-align:left;">
2015.4-1
</td>
<td style="text-align:left;">
‘TSdbi’ Extensions for ODBC
</td>
<td style="text-align:left;">
<details>
An ODBC interface for ‘TSdbi’. Comprehensive examples of all the ’TS\*’
packages is provided in the vignette Guide.pdf with the ‘TSdata’
package.
</details>
</td>
<td style="text-align:left;">
2015-04-30
</td>
<td style="text-align:left;">
Paul Gilbert &lt;<pgilbert.ttv9z@ncf.ca%3E>;
</td>
<td style="text-align:left;">
GPL-2
</td>
<td style="text-align:left;">
<http://tsdbi.r-forge.r-project.org/>
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
TSpadi
</td>
<td style="text-align:left;">
2012.8-1
</td>
<td style="text-align:left;">
TSdbi extensions for PADI Time Series Server
</td>
<td style="text-align:left;">
<details>
Provides methods for generics in the TSdbi package to connect through a
protocol for application database interface (PADI) to a time series
database (e.g. Fame). Comprehensive examples of all the TS\* packages is
provided in the vignette Guide.pdf with the TSdata package.
</details>
</td>
<td style="text-align:left;">
2012-10-02
</td>
<td style="text-align:left;">
Paul Gilbert &lt;<pgilbert.ttv9z@ncf.ca%3E>;
</td>
<td style="text-align:left;">
GPL-2
</td>
<td style="text-align:left;">
<http://tsdbi.r-forge.r-project.org/>
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
TSsdmx
</td>
<td style="text-align:left;">
2016.8-1
</td>
<td style="text-align:left;">
‘TSdbi’ Extension to Connect with ‘SDMX’
</td>
<td style="text-align:left;">
<details>
Methods to retrieve data in the Statistical Data and Metadata Exchange
(‘SDMX’) format from several database. (For example, ‘EuroStat’, the
European Central Bank, the Organisation for Economic Co-operation and
Development, the ‘Unesco’ Institute for Statistics, and the
International Labor Organization.) This is a wrapper for package
‘RJSDMX’. Comprehensive examples of all the ’TS\*’ packages is provided
in the vignette Guide.pdf with the ‘TSdata’ package.
</details>
</td>
<td style="text-align:left;">
2016-08-26
</td>
<td style="text-align:left;">
Paul Gilbert &lt;<pgilbert.ttv9z@ncf.ca%3E>;
</td>
<td style="text-align:left;">
GPL-2
</td>
<td style="text-align:left;">
<http://tsdbi.r-forge.r-project.org/>
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
TSxls
</td>
<td style="text-align:left;">
2013.8-2
</td>
<td style="text-align:left;">
TSdbi extension to connect to spreadsheets
</td>
<td style="text-align:left;">
<details>
Provides TSdbi package methods to retrieve time series data from
spreadsheets, pretending the spreadsheet is a database. Comprehensive
examples of all the TS\* packages is provided in the vignette Guide.pdf
with the TSdata package.
</details>
</td>
<td style="text-align:left;">
2013-09-29
</td>
<td style="text-align:left;">
Paul Gilbert &lt;<pgilbert.ttv9z@ncf.ca%3E>;
</td>
<td style="text-align:left;">
GPL-2
</td>
<td style="text-align:left;">
<http://tsdbi.r-forge.r-project.org/>
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
TSzip
</td>
<td style="text-align:left;">
2013.9-1
</td>
<td style="text-align:left;">
TSdbi extension to connect to zip files
</td>
<td style="text-align:left;">
<details>
Provides TSdbi package methods to retrieve time series data from zipped,
as if the files form a database. Comprehensive examples of all the TS\*
packages is provided in the vignette Guide.pdf with the TSdata package.
</details>
</td>
<td style="text-align:left;">
2013-09-29
</td>
<td style="text-align:left;">
Paul Gilbert &lt;<pgilbert.ttv9z@ncf.ca%3E>;
</td>
<td style="text-align:left;">
GPL-2
</td>
<td style="text-align:left;">
<http://tsdbi.r-forge.r-project.org/>
</td>
<td style="text-align:left;">
</td>
</tr>
</tbody>
</table>

### Query a single package

``` r
first_name <- all_df$name[[1]]
first_url <- paste0("https://r-dbi.github.io/backends/by-package/", first_name, ".json")
first <- httr::GET(first_url)
httr::stop_for_status(first)
httr::content(first)
#> $version
#> [1] "1.0.6"
#> 
#> $title
#> [1] "Interface to 'Kusto'/'Azure Data Explorer'"
#> 
#> $description
#> [1] "An interface to 'Azure Data Explorer', also known as 'Kusto', a fast, highly scalable data exploration service from Microsoft: <https://azure.microsoft.com/en-us/services/data-explorer/>. Includes 'DBI' and 'dplyr' interfaces, with the latter modelled after the 'dbplyr' package, whereby queries are translated from R into the native 'KQL' query language and executed lazily. On the admin side, the package extends the object framework provided by 'AzureRMR' to support creation and deletion of databases, and management of database principals. Part of the 'AzureR' family of packages."
#> 
#> $date
#> [1] "2020-04-27"
#> 
#> $maintainer
#> [1] "Alex Kyllo <jekyllo@microsoft.com>"
#> 
#> $license
#> [1] "MIT + file LICENSE"
#> 
#> $url
#> $url[[1]]
#> [1] "https://github.com/Azure/AzureKusto"
#> 
#> $url[[2]]
#> [1] "https://github.com/Azure/AzureR"
#> 
#> 
#> $bugs
#> [1] "https://github.com/Azure/AzureKusto/issues"
```

## Updating the database

The database is updated via `script/prepare.R` which is run daily by
GitHub Actions. Existing packages are updated directly. For new or
removed packages, pull requests are opened.

------------------------------------------------------------------------

Please note that the ‘backends’ project is released with a [Contributor
Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project,
you agree to abide by its terms.
