"""Load the Online Retail II Excel file into a SQLite warehouse.

Usage:
    python src/build_warehouse.py
"""
from __future__ import annotations

import sqlite3
from pathlib import Path

import pandas as pd

ROOT = Path(__file__).resolve().parent.parent
RAW = ROOT / "data" / "online_retail_II.xlsx"
DB = ROOT / "data" / "retail.db"
SCHEMA = ROOT / "sql" / "schema.sql"


def load_raw() -> pd.DataFrame:
    if not RAW.exists():
        raise FileNotFoundError(
            f"Missing {RAW}. See data/README.md for the download command."
        )
    sheets = pd.read_excel(RAW, sheet_name=None)
    df = pd.concat(sheets.values(), ignore_index=True)
    df = df.rename(
        columns={
            "Invoice": "invoice",
            "StockCode": "stock_code",
            "Description": "description",
            "Quantity": "quantity",
            "InvoiceDate": "invoice_dt",
            "Price": "unit_price",
            "Customer ID": "customer_id",
            "Country": "country",
        }
    )
    df["invoice"] = df["invoice"].astype(str)
    df["stock_code"] = df["stock_code"].astype(str)
    df["invoice_dt"] = pd.to_datetime(df["invoice_dt"]).dt.strftime(
        "%Y-%m-%d %H:%M:%S"
    )
    return df


def build() -> None:
    df = load_raw()
    schema_sql = SCHEMA.read_text()
    DB.unlink(missing_ok=True)
    with sqlite3.connect(DB) as con:
        con.executescript(schema_sql)
        df.to_sql("sales", con, if_exists="append", index=False)
        rows = con.execute("SELECT COUNT(*) FROM sales").fetchone()[0]
    print(f"Loaded {rows:,} rows into {DB}")


if __name__ == "__main__":
    build()
