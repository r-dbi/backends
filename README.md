
<!-- README.md is generated from README.Rmd. Please edit that file -->

# backends

<!-- badges: start -->

[![Lifecycle:
maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
<!-- badges: end -->

List of [DBI](https://dbi.r-dbi.org) backends.

Do you maintain a backend and think that yours should be on this list?
Please open an issue in this repository.

## [AzureKusto](https://github.com/Azure/AzureKusto) 1.1.3 (2023-10-12) [:link:](https://github.com/Azure/AzureR) [:bug:](https://github.com/Azure/AzureKusto/issues)

Interface to ‘Kusto’/‘Azure Data Explorer’

An interface to ‘Azure Data Explorer’, also known as ‘Kusto’, a fast,
distributed data exploration service from Microsoft:
<https://azure.microsoft.com/en-us/products/data-explorer/>. Includes
‘DBI’ and ‘dplyr’ interfaces, with the latter modelled after the
‘dbplyr’ package, whereby queries are translated from R into the
native ‘KQL’ query language and executed lazily. On the admin side, the
package extends the object framework provided by ‘AzureRMR’ to support
creation and deletion of databases, and management of database
principals. Part of the ‘AzureR’ family of packages.

Maintainer: Alex Kyllo <jekyllo@microsoft.com>. License: MIT + file
LICENSE

## [bigrquery](https://bigrquery.r-dbi.org) 1.5.1 (2024-03-14) [:link:](https://github.com/r-dbi/bigrquery) [:bug:](https://github.com/r-dbi/bigrquery/issues)

An Interface to Google’s ‘BigQuery’ ‘API’

Easily talk to Google’s ‘BigQuery’ database from R.

Maintainer: Hadley Wickham <hadley@posit.co>. License: MIT + file
LICENSE

## [ckanr](https://docs.ropensci.org/ckanr/) 0.7.0 (2023-03-17) [:link:](https://github.com/ropensci/ckanr) [:bug:](https://github.com/ropensci/ckanr/issues)

Client for the Comprehensive Knowledge Archive Network (‘CKAN’) API

Client for ‘CKAN’ API (<https://ckan.org/>). Includes interface to
‘CKAN’ ‘APIs’ for search, list, show for packages, organizations,
and resources. In addition, provides an interface to the ‘datastore’
API.

Maintainer: Francisco Alves <fjunior.alves.oliveira@gmail.com>. License:
MIT + file LICENSE

## [ClickHouseHTTP](https://github.com/patzaw/ClickHouseHTTP) 0.3.2 (2023-07-04) [:bug:](https://github.com/patzaw/ClickHouseHTTP/issues)

A Simple HTTP Database Interface to ‘ClickHouse’

‘ClickHouse’ (<https://clickhouse.com/>) is an open-source, high
performance columnar OLAP (online analytical processing of queries)
database management system for real-time analytics using SQL. This ‘DBI’
backend relies on the ‘ClickHouse’ HTTP interface and support HTTPS
protocol.

Maintainer: Patrice Godard <patrice.godard@gmail.com>. License: GPL-3

## [connections](https://github.com/rstudio/connections) 0.2.0 (2023-12-18) [:link:](https://rstudio.github.io/connections/) [:bug:](https://github.com/rstudio/connections/issues)

Integrates with the ‘RStudio’ Connections Pane and ‘pins’

Enables ‘DBI’ compliant packages to integrate with the ‘RStudio’
connections pane, and the ‘pins’ package. It automates the display of
schemata, tables, views, as well as the preview of the table’s top 1000
records.

Maintainer: Edgar Ruiz <edgar@posit.co>. License: MIT + file LICENSE

## [DatabaseConnector](https://ohdsi.github.io/DatabaseConnector/) 6.3.2 (2023-12-11) [:link:](https://github.com/OHDSI/DatabaseConnector) [:bug:](https://github.com/OHDSI/DatabaseConnector/issues)

Connecting to Various Database Platforms

An R ‘DataBase Interface’ (‘DBI’) compatible interface to various
database platforms (‘PostgreSQL’, ‘Oracle’, ‘Microsoft SQL Server’,
‘Amazon Redshift’, ‘Microsoft Parallel Database Warehouse’, ‘IBM
Netezza’, ‘Apache Impala’, ‘Google BigQuery’, ‘Snowflake’, ‘Spark’, and
‘SQLite’). Also includes support for fetching data as ‘Andromeda’
objects. Uses either ‘Java Database Connectivity’ (‘JDBC’) or other
‘DBI’ drivers to connect to databases.

Maintainer: Martijn Schuemie <schuemie@ohdsi.org>. License: Apache
License

## [DBI.RODBC](http://developer.r-project.org/db) 0.1-2

DBI front-end to RODBC

A simple DBI front-end to the RODBC package. This package uses version 4
style classes and methods to create a front-end to the existing RODBC
(version 0.8-3) package.

Maintainer: David A. James <dj@bell-labs.com>. License: GPL (version 2
or later)

## [DBI.RPgSQL](http://developer.r-project.org/db) 0.1-2

DBI front-end to RPgSQL

A simple DBI front-end to the RPgSQL package. This package uses version
4 style classes and methods to create a front-end to the existing RPgSQL
(version 1.0-0) package.

Maintainer: David A. James <dj@bell-labs.com>. License: GPL (version 2
or later)

## [dittodb](https://dittodb.jonkeane.com/) 0.1.7 (2023-08-13) [:link:](https://github.com/ropensci/dittodb) [:bug:](https://github.com/ropensci/dittodb/issues)

A Test Environment for Database Requests

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

Maintainer: Jonathan Keane <jkeane@gmail.com>. License: Apache License
(\>= 2.0)

## [duckdb](https://r.duckdb.org/) 0.10.0 (2024-03-13) [:link:](https://github.com/duckdb/duckdb-r) [:bug:](https://github.com/duckdb/duckdb-r/issues)

DBI Package for the DuckDB Database Management System

The DuckDB project is an embedded analytical data management system with
support for the Structured Query Language (SQL). This package includes
all of DuckDB and a R Database Interface (DBI) connector.

Maintainer: Hannes Mühleisen <hannes@cwi.nl>. License: MIT + file
LICENSE

## [implyr](https://github.com/ianmcook/implyr) 0.5.0 (2024-02-06) [:bug:](https://github.com/ianmcook/implyr/issues)

R Interface for Apache Impala

‘SQL’ back-end to ‘dplyr’ for Apache Impala, the massively parallel
processing query engine for Apache ‘Hadoop’. Impala enables low-latency
‘SQL’ queries on data stored in the ‘Hadoop’ Distributed File System
‘(HDFS)’, Apache ‘HBase’, Apache ‘Kudu’, Amazon Simple Storage Service
‘(S3)’, Microsoft Azure Data Lake Store ‘(ADLS)’, and Dell ‘EMC’
‘Isilon’. See <https://impala.apache.org> for more information about
Impala.

Maintainer: Ian Cook <ianmcook@gmail.com>. License: Apache License 2.0 |
file LICENSE

## [lazysf](https://github.com/mdsumner/lazysf) 0.1.0 (2020-11-14) [:bug:](https://github.com/mdsumner/lazysf/issues)

Delayed Read for ‘GDAL’ Vector Data Sources

Lazy read for drawings. A ‘dplyr’ back end for data sources supported by
‘GDAL’ vector drivers, that allows working with local or remote sources
as if they are in-memory data frames. Basic features works with any
drawing format (‘GDAL vector data source’) supported by the ‘sf’
package.

Maintainer: Michael Sumner <mdsumner@gmail.com>. License: GPL-3

## [MonetDB.R](http://www.monetdb.org) 2.0.0 (2020-08-14)

Connect MonetDB to R

Allows to pull data from MonetDB into R.

Maintainer: Mitchell Weggemans
<mitchell.weggemans@monetdbsolutions.com>. License: MPL (== 2.0)

## [MonetDBLite](https://github.com/hannesmuehleisen/MonetDBLite-R) 0.6.0 (2018-07-27) [:bug:](https://github.com/hannesmuehleisen/MonetDBLite-R/issues)

In-Process Version of ‘MonetDB’

An in-process version of ‘MonetDB’, a SQL database designed for
analytical tasks. Similar to ‘SQLite’, the database runs entirely inside
the ‘R’ shell.

Maintainer: Hannes Mühleisen <hannes@cwi.nl>. License: MPL (== 2.0)

## [noctua](https://github.com/DyfanJones/noctua) 2.6.2 (2023-08-08) [:bug:](https://github.com/DyfanJones/noctua/issues)

Connect to ‘AWS Athena’ using R ‘AWS SDK’ ‘paws’ (‘DBI’ Interface)

Designed to be compatible with the ‘R’ package ‘DBI’ (Database
Interface) when connecting to Amazon Web Service (‘AWS’) Athena
<https://aws.amazon.com/athena/>. To do this the ‘R’ ‘AWS’ Software
Development Kit (‘SDK’) ‘paws’ <https://github.com/paws-r/paws> is used
as a driver.

Maintainer: Dyfan Jones <dyfan.r.jones@gmail.com>. License: MIT + file
LICENSE

## [odbc](https://odbc.r-dbi.org) 1.4.2 (2024-01-22) [:link:](https://github.com/r-dbi/odbc) [:link:](https://solutions.posit.co/connections/db/) [:bug:](https://github.com/r-dbi/odbc/issues)

Connect to ODBC Compatible Databases (using the DBI Interface)

A DBI-compatible interface to ODBC databases.

Maintainer: Hadley Wickham <hadley@posit.co>. License: MIT + file
LICENSE

## [pool](https://github.com/rstudio/pool) 1.0.3 (2024-02-14) [:link:](http://rstudio.github.io/pool/) [:bug:](https://github.com/rstudio/pool/issues)

Object Pooling

Enables the creation of object pools, which make it less computationally
expensive to fetch a new object. Currently the only supported pooled
objects are ‘DBI’ connections.

Maintainer: Hadley Wickham <hadley@posit.co>. License: MIT + file
LICENSE

## [RAthena](https://github.com/DyfanJones/RAthena) 2.6.1 (2022-12-20) [:bug:](https://github.com/DyfanJones/RAthena/issues)

Connect to ‘AWS Athena’ using ‘Boto3’ (‘DBI’ Interface)

Designed to be compatible with the R package ‘DBI’ (Database Interface)
when connecting to Amazon Web Service (‘AWS’) Athena
<https://aws.amazon.com/athena/>. To do this ‘Python’ ‘Boto3’ Software
Development Kit (‘SDK’)
<https://boto3.amazonaws.com/v1/documentation/api/latest/index.html> is
used as a driver.

Maintainer: Dyfan Jones <dyfan.r.jones@gmail.com>. License: MIT + file
LICENSE

## [RClickhouse](https://github.com/IMSMWU/RClickhouse) 0.6.9 (2024-01-19) [:bug:](https://github.com/IMSMWU/RClickhouse/issues)

‘Yandex Clickhouse’ Interface for R with Basic ‘dplyr’ Support

‘Yandex Clickhouse’ (<https://clickhouse.com/>) is a high-performance
relational column-store database to enable big data exploration and
‘analytics’ scaling to petabytes of data. Methods are provided that
enable working with ‘Yandex Clickhouse’ databases via ‘DBI’ methods and
using ‘dplyr’/‘dbplyr’ idioms.

Maintainer: Christian Hotz-Behofsits
<christian.hotz-behofsits@wu.ac.at>. License: GPL-2

## [RH2](https://github.com/dmkaplan2000/RH2.git) 0.2.4 (2018-03-14)

DBI/RJDBC Interface to H2 Database

DBI/RJDBC interface to h2 database. h2 version 1.3.175 is included.

Maintainer: “David M. Kaplan” <dmkaplan2000@gmail.com>. License: Mozilla
Public License 1.1

## [RJDBC](http://www.rforge.net/RJDBC/) 0.2-10 (2022-03-24)

Provides Access to Databases Through the JDBC Interface

The RJDBC package is an implementation of R’s DBI interface using JDBC
as a back-end. This allows R to connect to any DBMS that has a JDBC
driver.

Maintainer: Simon Urbanek <Simon.Urbanek@r-project.org>. License: MIT +
file LICENSE

## [RMariaDB](https://rmariadb.r-dbi.org) 1.3.1 (2023-10-26) [:link:](https://github.com/r-dbi/RMariaDB) [:link:](https://downloads.mariadb.org/connector-c/) [:bug:](https://github.com/r-dbi/RMariaDB/issues)

Database Interface and MariaDB Driver

Implements a DBI-compliant interface to MariaDB (<https://mariadb.org/>)
and MySQL (<https://www.mysql.com/>) databases.

Maintainer: Kirill Müller <kirill@cynkra.com>. License: MIT + file
LICENSE

## [RMySQL](https://downloads.mariadb.org/connector-c/) 0.10.27 (2023-12-04) [:bug:](https://github.com/r-dbi/rmysql/issues)

Database Interface and ‘MySQL’ Driver for R

Legacy ‘DBI’ interface to ‘MySQL’ / ‘MariaDB’ based on old code ported
from S-PLUS. A modern ‘MySQL’ client written in ‘C++’ is available from
the ‘RMariaDB’ package.

Maintainer: Jeroen Ooms <jeroen@berkeley.edu>. License: GPL-2

## RODBCDBI 0.1.1 (2016-03-14)

Provides Access to Databases Through the ODBC Interface

An implementation of R’s DBI interface using ODBC package as a back-end.
This allows R to connect to any DBMS that has a ODBC driver.

Maintainer: Nagi Teramo <teramonagi@gmail.com>. License: MIT + file
LICENSE

## [ROracle](http://www.oracle.com) 1.3-1.1 (2021-11-10)

OCI Based Oracle Database Interface for R

Oracle Database interface (DBI) driver for R. This is a DBI-compliant
Oracle driver based on the OCI.

Maintainer: Rajendra S. Pingte <rajendra.pingte@oracle.com>. License:
LGPL

## [RPostgres](https://rpostgres.r-dbi.org) 1.4.6 (2023-10-22) [:link:](https://github.com/r-dbi/RPostgres) [:bug:](https://github.com/r-dbi/RPostgres/issues)

C++ Interface to PostgreSQL

Fully DBI-compliant Rcpp-backed interface to PostgreSQL
<https://www.postgresql.org/>, an open-source relational database.

Maintainer: Kirill Müller <kirill@cynkra.com>. License: MIT + file
LICENSE

## [RPostgreSQL](https://github.com/tomoakin/RPostgreSQL) 0.7-6 (2024-01-11) [:link:](https://cran.r-project.org/package=DBI) [:link:](https://www.postgresql.org)

R Interface to the ‘PostgreSQL’ Database System

Database interface and ‘PostgreSQL’ driver for ‘R’. This package
provides a Database Interface ‘DBI’ compliant driver for ‘R’ to access
‘PostgreSQL’ database systems. In order to build and install this
package from source, ‘PostgreSQL’ itself must be present your system to
provide ‘PostgreSQL’ functionality via its libraries and header files.
These files are provided as ‘postgresql-devel’ package under some Linux
distributions. On ‘macOS’ and ‘Microsoft Windows’ system the attached
‘libpq’ library source will be used.

Maintainer: Tomoaki Nishiyama <tomoakin@staff.kanazawa-u.ac.jp>.
License: GPL-3 | file LICENSE

## [RPresto](https://github.com/prestodb/RPresto) 1.4.6 (2023-11-01) [:bug:](https://github.com/prestodb/RPresto/issues)

DBI Connector to Presto

Implements a ‘DBI’ compliant interface to Presto. Presto is an open
source distributed SQL query engine for running interactive analytic
queries against data sources of all sizes ranging from gigabytes to
petabytes: <https://prestodb.io/>.

Maintainer: Jarod G.R. Meng <jarodm@fb.com>. License: BSD\_3\_clause +
file LICENSE

## RRedshiftSQL 0.1.2 (2016-09-15)

R Interface to the ‘Redshift’ Database

Superclasses ‘PostgreSQL’ connection to help enable full ‘dplyr’
functionality on ‘Redshift’.

Maintainer: Michael Treadwell <michael.treadwell@interworks.com>.
License: GPL-2

## [RSQLite](https://rsqlite.r-dbi.org) 2.3.5 (2024-01-21) [:link:](https://github.com/r-dbi/RSQLite) [:bug:](https://github.com/r-dbi/RSQLite/issues)

SQLite Interface for R

Embeds the SQLite database engine in R and provides an interface
compliant with the DBI package. The source for the SQLite engine and for
various extensions in a recent version is included. System libraries
will never be consulted because this package relies on static linking
for the plugins it includes; this also ensures a consistent experience
across all installations.

Maintainer: Kirill Müller <kirill@cynkra.com>. License: LGPL (\>= 2.1)

## [RSQLServer](https://github.com/imanuelcostigan/RSQLServer) 0.3.0 (2017-06-17) [:bug:](https://github.com/imanuelcostigan/RSQLServer/issues)

SQL Server R Database Interface (DBI) and ‘dplyr’ SQL Backend

Utilises The ‘jTDS’ project’s ‘JDBC’ 3.0 ‘SQL Server’ driver to extend
‘DBI’ classes and methods. The package also implements a ‘SQL’ backend
to the ‘dplyr’ package.

Maintainer: Imanuel Costigan <i.costigan@me.com>. License: GPL-2

## [sergeant](https://gitlab.com/hrbrmstr/sergeant) 0.9.1 (2021-11-29) [:bug:](https://gitlab.com/hrbrmstr/sergeant/-/issues)

Tools to Transform and Query Data with Apache Drill

Apache Drill is a low-latency distributed query engine designed to
enable data exploration and analysis on both relational and
non-relational data stores, scaling to petabytes of data. Methods are
provided that enable working with Apache Drill instances via the REST
API, DBI methods and using ‘dplyr’/‘dbplyr’ idioms. Helper functions are
included to facilitate using official Drill Docker images/containers.

Maintainer: Bob Rudis <bob@rud.is>. License: MIT + file LICENSE

## [sparklyr](https://spark.rstudio.com/) 1.8.4 (2023-10-30) [:bug:](https://github.com/sparklyr/sparklyr/issues)

R Interface to Apache Spark

R interface to Apache Spark, a fast and general engine for big data
processing, see <https://spark.apache.org/>. This package supports
connecting to local and remote Apache Spark clusters, provides a ‘dplyr’
compatible back-end, and provides an interface to Spark’s built-in
machine learning algorithms.

Maintainer: Edgar Ruiz <edgar@rstudio.com>. License: Apache License 2.0
| file LICENSE

# Implementation

The list of all known DBI backends is provided as a set of static JSON
files.

## Usage

### Query all packages

``` r
all <- httr::GET("https://r-dbi.github.io/backends/all.json")
httr::stop_for_status(all)
all_df <- httr::content(all, flatten = TRUE, simplifyVector = TRUE)
```

### Query a single package

``` r
first_name <- all_df$name[[1]]
first_url <- paste0("https://r-dbi.github.io/backends/by-package/", first_name, ".json")
first <- httr::GET(first_url)
httr::stop_for_status(first)
httr::content(first)
#> $version
#> [1] "1.1.3"
#> 
#> $title
#> [1] "Interface to 'Kusto'/'Azure Data Explorer'"
#> 
#> $description
#> [1] "An interface to 'Azure Data Explorer', also known as 'Kusto', a fast, distributed data exploration service from Microsoft: <https://azure.microsoft.com/en-us/products/data-explorer/>. Includes 'DBI' and 'dplyr' interfaces, with the latter modelled after the 'dbplyr' package, whereby queries are translated from R into the native 'KQL' query language and executed lazily. On the admin side, the package extends the object framework provided by 'AzureRMR' to support creation and deletion of databases, and management of database principals. Part of the 'AzureR' family of packages."
#> 
#> $date
#> [1] "2023-10-12"
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

-----

Please note that the ‘backends’ project is released with a [Contributor
Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project,
you agree to abide by its terms.
