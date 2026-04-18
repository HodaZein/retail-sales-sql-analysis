# data

raw stuff goes here, gitignored.

dataset: online retail II from UCI.

download:
```
curl -L -o data/online_retail_II.xlsx https://archive.ics.uci.edu/ml/machine-learning-databases/00502/online_retail_II.xlsx
```

it's an excel file with two sheets (2009-2010, 2010-2011). loader script combines both into one transactional table.

after load the schema is:
- invoice (invoice number, prefix C means credit note)
- stock_code (product code)
- description
- quantity (negative for returns)
- invoice_dt (iso timestamp)
- unit_price (GBP)
- customer_id (nullable, missing for guest checkouts)
- country (shipping country)
