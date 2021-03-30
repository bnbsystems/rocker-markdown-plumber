FROM rstudio/plumber 
MAINTAINER BnB Systems
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
  && update-ca-certificates --fresh \
  && install2.r --error --deps TRUE \
    rmarkdown \
    knitr \
    tinytex \
    remotes  \
    tidyverse \  
    kableExtra \
  #&& tlmgr update --self \
  #&& tlmgr install framed xcolor metafont mfware inconsolata tex ae parskip listings \
  ## clean up
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
