FROM jupyter/r-notebook:latest

RUN Rscript -e 'install.packages("rstan", repos = "https://cloud.r-project.org/", dependencies = TRUE)'

# TODO: unit to above command by using `&&`
RUN Rscript -e 'install.packages("ggfortify",repos = "http://cran.r-project.org/", dependencies = TRUE)'
