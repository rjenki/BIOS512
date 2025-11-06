FROM rocker/verse
RUN apt -y update && apt install -y man-db
RUN yes | unminimize
RUN R -e "install.packages('matlab');"
