# Module 3 Demo — Snakemake

A minimal Snakemake pipeline demonstrating a reproducible multi-language workflow.
Snakemake figures out the execution order automatically by matching rule inputs to outputs.

```
example_data.csv
      │
      ▼
 1_derive.py  (Python)  →  work/1_derived.csv
                                  │
                                  ▼
                       2_summary.R  (R)  →  work/2_summary.txt
                                                    │
                            ┌───────────────────────┘
                            ▼
                      3_report.qmd  (Quarto)  →  results/3_report.html
```

## Running the demo

```bash
# 1. Build the image and start the container (first run only)
docker compose up -d

# 2. Open a shell inside the container
docker compose exec snakemake bash

# 3. Run the workflow
snakemake --cores 1

# Results are published to results/
#   results/1_derived.csv
#   results/2_summary.txt
#   results/3_report.html
```

## Re-running after changes

Snakemake tracks whether output files are newer than their inputs.
If you change a script and re-run, it automatically re-runs only the affected
rules and everything downstream — no special flag needed.

```bash
snakemake --cores 1
```

For example, if you edit `2_summary.R`:

```
 py_derive    — skipped  (outputs are up to date)
 r_summary    — re-runs  (you changed this script)
 final_report — re-runs  (depends on r_summary's output)
```

To force a specific rule to re-run regardless of timestamps:

```bash
snakemake --cores 1 --forcerun r_summary
```

To force a complete re-run from scratch:

```bash
snakemake --cores 1 --forceall
```

## Cleaning up

```bash
# Remove outputs and Snakemake metadata
rm -rf work results .snakemake

# Stop and remove the container
docker compose down
```
