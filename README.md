# Retail Sales SQL Analysis

Small portfolio project: load a public retail dataset into SQLite, run SQL +
Pandas analyses, and produce a short business-facing insights write-up.

## Why
End-to-end demonstration of the Data Analyst / BI workflow:

1. Source raw CSV data
2. Model it in a normalised SQLite warehouse
3. Answer business questions in SQL
4. Visualise key findings in Python
5. Communicate the result in a one-page insight summary

## Stack
- Python 3.10+, Pandas, Matplotlib
- SQLite (single-file warehouse, no server)
- Jupyter for the analysis notebook

## Project layout
```
data/        raw CSV(s) - not committed, see data/README.md
sql/         schema + analysis queries
src/         small Python helpers (loader, query runner)
notebooks/   analysis notebook
docs/        business insights summary
```

## Quick start
```bash
pip install -r requirements.txt
python src/build_warehouse.py
jupyter lab notebooks/analysis.ipynb
```

## Dataset
The "Online Retail II" dataset (UCI ML Repository) — UK gift retailer
transactions 2009–2011. Download instructions in `data/README.md`.

## Status
Work in progress.
