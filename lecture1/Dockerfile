FROM rocker/tidyverse:latest

WORKDIR /app
COPY plot-data-data.R /app/
COPY data-data.csv /app/

CMD ["Rscript", "plot-data-data.R"]
