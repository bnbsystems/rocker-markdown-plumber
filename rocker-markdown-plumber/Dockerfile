FROM rstudio/plumber 
LABEL org.opencontainers.image.authors="BnB Systems"
LABEL maintainer="BnB Systems"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update -qq \
  && apt-get -y --no-install-recommends install \
    libxml2-dev \
    jq \
    rsync \
    texlive \
    libssl-dev \
    procps \
    rrdtool \
    libclang-dev \
    libmagick++-dev \
    pandoc \
    pandoc-citeproc \
    lmodern \
    texlive-latex-extra \
    texlive-xetex \
    wget \
    nano \
  && update-ca-certificates --fresh \
  && install2.r --error --deps TRUE \
    rmarkdown \
    knitr \
    tinytex \
    remotes  \
    tidyverse \
    kableExtra \
    stargazer \
    pander \
    rhandsontable \
    gridExtra \
    data.table \
    plotly \
    reshape2 \
    RCurl \
    pander \
  ## clean up
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
