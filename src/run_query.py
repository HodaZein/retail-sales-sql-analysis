"""Tiny helper to run a named SQL block against the warehouse."""
from __future__ import annotations

import argparse
import sqlite3
from pathlib import Path

import pandas as pd

ROOT = Path(__file__).resolve().parent.parent
DB = ROOT / "data" / "retail.db"


def run(sql: str) -> pd.DataFrame:
    with sqlite3.connect(DB) as con:
        return pd.read_sql_query(sql, con)


def main() -> None:
    p = argparse.ArgumentParser()
    p.add_argument("file", help="path to a .sql file containing a single statement")
    args = p.parse_args()
    sql = Path(args.file).read_text()
    print(run(sql).to_string(index=False))


if __name__ == "__main__":
    main()
