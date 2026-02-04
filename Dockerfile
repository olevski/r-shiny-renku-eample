FROM rocker/shiny
RUN groupadd -g 1000 renku && useradd -m -u 1000 -g 1000 renku 
RUN apt-get update && apt-get install -y tini && rm -rf /var/cache/apt/archives /var/lib/apt/lists/*
USER renku
COPY app.R /home/renku/app.R
ENTRYPOINT [ "tini", "-g", "--", "Rscript", "/home/renku/app.R" ]

