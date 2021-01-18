#!/bin/bash
docker run --rm -p 8000:8000 -v `pwd`/src:/pwd bnbsystems/rocker-markdown-plumber:latest /pwd/plumber.R


