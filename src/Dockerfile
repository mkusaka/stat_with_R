FROM jupyter/r-notebook:7a3e968dd212

RUN Rscript -e 'install.packages(c("rstan", "ggfortify", "brms"), repos = "https://cloud.r-project.org/", dependencies = TRUE)'

CMD ["jupyter", "notebook",  "--ip=0.0.0.0",  "--allow-root", "--NotebookApp.token="]
