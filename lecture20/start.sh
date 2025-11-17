docker run \
    -p 8123:8123 \
    -v $(pwd):/home/rstudio/work\
    -e PASSWORD=pwd \
    -it rocker/verse:latest \
    /bin/bash -c "Rscript /home/rstudio/work/shiny-hello.R"