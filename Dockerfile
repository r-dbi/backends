FROM rocker/r-ubuntu:20.04

RUN R -e 'getRversion()'

RUN R -e 'getOption("repos")'
