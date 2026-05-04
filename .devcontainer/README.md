# Codespaces / Dev Containers

This repo provides two separate Dev Container configurations for the Module 3 workflow-management demos:

- `nextflow/` (uses `contents/module_3_workflow_management/demo/nextflow/docker-compose.yaml`)
- `snakemake/` (uses `contents/module_3_workflow_management/demo/snakemake/docker-compose.yaml`)
- `rstudio/` (uses `docker-compose.yaml` to run RStudio Server for the whole project)

## Choosing the config

- In GitHub Codespaces: when creating the Codespace, pick the Dev Container configuration you want.
- In VS Code: run **Dev Containers: Reopen in Container** and select the desired configuration.

## RStudio login

When using the `rstudio/` configuration, open the forwarded port `8787` and log in with:

- Username: `rstudio`
- Password: `rstudio`

## Git availability

The `nextflow/` and `snakemake/` configurations mount the **repo root** at `/workspace` so that `.git` is available and `git status` works even when working inside the workflow subdirectories.
