FROM rocker/r-ubuntu:20.04

RUN echo 'options(repos = "https://packagemanager.rstudio.com/cran/__linux__/focal/latest", HTTPUserAgent = sprintf("R/%s R (%s)", getRversion(), paste(getRversion(), R.version$platform, R.version$arch, R.version$os)))' >> /etc/R/Rprofile.site

RUN R -e 'getOption("repos")'

WORKDIR /pkg
COPY DESCRIPTION .

RUN R -q -e 'remotes::install_local(".", dependencies = TRUE)'
