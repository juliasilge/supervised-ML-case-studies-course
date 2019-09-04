FROM rocker/binder:3.5.2

## Copies your repo files into the Docker Container
USER root
COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}

## Run an deps.R script, if it exists.
RUN install.r cran/tidyverse@1.2.1 cran/yardstick@0.0.1 cran/caret@6.0-78 cran/xgboost@0.6.4.1 cran/randomForest@4.6-12 cran/gbm@2.1.3 cran/e1017@1.6-8

## Become normal user again
USER ${NB_USER}
