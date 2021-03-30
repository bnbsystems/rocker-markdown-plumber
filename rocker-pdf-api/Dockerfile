FROM bnbsystems/rocker-markdown-plumber:dockerfile
ARG BUILD_API_KEY

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

WORKDIR /script/
COPY ./src/plumber.R /script/plumber.R 
COPY ./src/render.sh /script/render.sh
COPY ./src/rmarkdown.Rmd /script/rmarkdown.Rmd

CMD ["/script/plumber.R"]
