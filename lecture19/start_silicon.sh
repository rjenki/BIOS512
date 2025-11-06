#! /bin/bash

docker build --platform linux/amd64 -t babysfirstcontainer .

docker run --platform linux/amd64 -v $(pwd):/home/rstudio/work\
    -e PASSWORD=pwd\
    -p 8787:8787 -it babysfirstcontainer