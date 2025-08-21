FROM r-base:latest

# Install packages
RUN R -e "install.packages('tidyverse', repos='https://cloud.r-project.org')"

WORKDIR /app
COPY plot-data-data.R /app/
COPY data-data.csv /app/

CMD ["Rscript", "plot-data-data.R"]
