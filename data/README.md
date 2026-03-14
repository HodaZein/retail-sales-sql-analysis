# Data

This folder is for raw inputs. Files here are git-ignored.

## Download
We use the **Online Retail II** dataset from the UCI ML Repository.

```bash
curl -L -o data/online_retail_II.xlsx \
  https://archive.ics.uci.edu/ml/machine-learning-databases/00502/online_retail_II.xlsx
```

The Excel file has two sheets (2009-2010, 2010-2011). The loader script
combines both into a single transactional table.

## Schema (after load)
| column      | type     | notes                                  |
|-------------|----------|----------------------------------------|
| invoice     | TEXT     | invoice number, prefix `C` = credit    |
| stock_code  | TEXT     | product code                           |
| description | TEXT     | product description                    |
| quantity    | INTEGER  | negative for returns                   |
| invoice_dt  | TEXT     | ISO timestamp                          |
| unit_price  | REAL     | GBP                                    |
| customer_id | INTEGER  | nullable (guest checkouts)             |
| country     | TEXT     | shipping country                       |
