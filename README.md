# retail-sales-sql-analysis

side project. UCI online retail II dataset, dumped into sqlite, ran some sql + pandas to answer business-y questions.

basically wanted to do the whole thing end to end:
- grab raw csv
- sqlite warehouse
- sql + pandas for the questions
- plot the interesting bits
- write up the takeaways for someone non-technical

stack: python 3.10+, pandas, matplotlib, sqlite, jupyter

## run
```
pip install -r requirements.txt
python src/build_warehouse.py
jupyter lab notebooks/analysis.ipynb
```

dataset is online retail II from UCI - UK gift retailer 2009-2011. download instructions in `data/README.md`.

write-up of what I found is in `docs/insights.md`.
