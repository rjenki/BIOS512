#! /bin/bash

docker build . -t babysfirstcontainer

docker run -v $(pwd):/home/rstudio/work\
    -e PASSWORD=pwd\
    -p 8787:8787 -it