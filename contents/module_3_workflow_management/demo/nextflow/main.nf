#!/usr/bin/env nextflow

/*
 * Minimal workshop demo pipeline:
 * 1. Python centres the values in example_data.csv  → 1_derived.csv
 * 2. R reads 1_derived.csv and produces summary stats → 2_summary.txt
 * 3. Quarto collects both outputs into a PDF report   → 3_report.pdf
 *
 * Steps 1 and 2 are sequential: R depends on Python's output.
 */

workflow {
  def derived = PY_DERIVE( file('example_data.csv'), file('1_derive.py') )
  def summary = R_SUMMARY( derived, file('2_summary.R') )

  FINAL_REPORT(
    file('3_report.qmd'),
    file('example_data.csv'),
    derived,
    summary
  )
}

process PY_DERIVE {
  publishDir "${params.outdir}", mode: 'copy'

  input:
  path "example_data.csv"
  path "1_derive.py"

  output:
  path "1_derived.csv"

  script:
  """
  python3 1_derive.py --input example_data.csv --output 1_derived.csv
  """
}

process R_SUMMARY {
  publishDir "${params.outdir}", mode: 'copy'

  input:
  path "1_derived.csv"
  path "2_summary.R"

  output:
  path "2_summary.txt"

  script:
  """
  Rscript 2_summary.R --input 1_derived.csv --output 2_summary.txt
  """
}

process FINAL_REPORT {
  publishDir "${params.outdir}", mode: 'copy'

  input:
  path "3_report.qmd"
  path "example_data.csv"
  path "1_derived.csv"
  path "2_summary.txt"

  output:
  path "3_report.html"

  script:
  """
  quarto render 3_report.qmd --to html --output 3_report.html --output-dir .
  """
}
