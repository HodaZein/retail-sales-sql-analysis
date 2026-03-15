-- Online Retail II analytical schema
-- Single fact table; intentionally denormalised for analytical queries.

DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
    invoice      TEXT    NOT NULL,
    stock_code   TEXT    NOT NULL,
    description  TEXT,
    quantity     INTEGER NOT NULL,
    invoice_dt   TEXT    NOT NULL,
    unit_price   REAL    NOT NULL,
    customer_id  INTEGER,
    country      TEXT
);

CREATE INDEX idx_sales_invoice_dt  ON sales(invoice_dt);
CREATE INDEX idx_sales_customer_id ON sales(customer_id);
CREATE INDEX idx_sales_country     ON sales(country);
CREATE INDEX idx_sales_stock_code  ON sales(stock_code);
