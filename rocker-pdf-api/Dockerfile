FROM bnbsystems/rocker-markdown-plumber:dockerfile
ARG BUILD_API_KEY

SHELL ["/bin/bash", "-o", "pipefail", "-c"]


  ## update tex live
# RUN tlmgr init-usertree 
# RUN curl -kSsL -O --retry 10 --connect-timeout 5 http://mirror.ctan.org/systems/texlive/tlnet/update-tlmgr-latest.sh 
# RUN chmod u+x update-tlmgr-latest.sh
# RUn which tlmgr
# RUN which kpsewhich 
# RUN ./update-tlmgr-latest.sh 
# RUN rm ./update-tlmgr-latest.sh 
# RUN tlmgr conf
# RUN tlmgr update --self --all 
# RUN tlmgr install framed xcolor metafont mfware inconsolata tex ae parskip listings 

WORKDIR /script/
COPY ./src/plumber.R /script/plumber.R 
COPY ./src/render.sh /script/render.sh
COPY ./src/rmarkdown.Rmd /script/rmarkdown.Rmd
COPY ./src/rmarkdown.yaml /script/rmarkdown.yaml

CMD ["/script/plumber.R"]
