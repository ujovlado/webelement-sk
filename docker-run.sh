#!/bin/bash

docker run -i -t --rm -v "$PWD:/jekyll" -w /jekyll -p 4000:4000 webelement/website:latest jekyll serve --watch -H 0.0.0.0
