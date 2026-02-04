FROM rocker/shiny
RUN groupadd -g 1000 renku && useradd -m -u 1000 -g 1000 renku 
USER renku
COPY app.R /home/renku/app.R
ENTRYPOINT [ "Rscript", "/home/renku/app.R" ]

