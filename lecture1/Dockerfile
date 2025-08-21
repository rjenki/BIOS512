FROM r-base:latest

# Install packages
RUN R -e "install.packages(c('ggplot2', 'readr', 'tidyverse'), repos='https://cloud.r-project.org')"

WORKDIR /app
COPY plot-data-data.R /app/
COPY data-data.csv /app/

CMD ["Rscript", "plot-data-data.R"]
