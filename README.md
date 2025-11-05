# Workshop on Reproducible Research Workflows with Quarto and R on November 14, 2025 at the University of Geneva

The website for this workshop is: <https://crsuzh.pages.uzh.ch/workshop-quarto-2025-unige>

## Citation

Cite this workshop as
> Molo, F., Fraga González, G., Degen, P., Pawel, S. 2025. Reproducible Research Workflows with Quarto and R - Getting Started. Workshop at the University of Geneva. <https://doi.org/XXXXX/zenodo.XXXXXX>

A BibTeX entry is given by

```{bibtex}
@misc{,
  author       = {Fabio Molo, Gorka {Fraga Gonz\'{a}lez}, Peter Degen and Samuel Pawel},
  title        = {Workshop ``Reproducible Research Workflows with Quarto and R - Getting Started'' at UNIGE },
  month        = November,
  year         = 2025,
  doi          = {doi.org/XXXXXXX/zenodo.XXXXXXX},
  url          = {https://crsuzh.pages.uzh.ch/workshop-quarto-2025-unige/}
}
```

## Development in Docker

Build Docker image:

```{bash}
docker build -t pyverse .
```

Run container as live dev session:

```{bash}
docker run -d -p 8787:8787 -e PASSWORD=rstudio \
  -v "$(pwd)":/home/rstudio/project pyverse
```

Or, using Docker Compose:

```{bash}
docker compose up -d
```

Open RStudio Server at [http://localhost:8787/](http://localhost:8787/).
