FROM r-ubuntu:latest

RUN R -e 'getRversion()'

RUN R -e 'getOption("repos")'
