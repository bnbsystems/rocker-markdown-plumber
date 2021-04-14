#!/bin/bash
R --vanilla <<- 'EOF'
library(plumber)
pr("plumber.R") %>%
  pr_run(port=8000)
EOF