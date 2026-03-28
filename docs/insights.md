# Insights — Online Retail II (FY 2009-12 → 2011-12)

> Audience: Commercial / Category Manager.
> Scope: 2 years of UK online gift retailer transactions.
> Source: UCI ML Repository, ~1M rows.

## 1. Revenue is highly seasonal — Q4 drives the year
Monthly revenue peaks sharply in **November**, ~2.5× the off-season baseline.
The Q4 build-up starts in September, so stock-availability planning should
be locked by **end of August**.

## 2. Revenue concentration — long tail, but a top-10 matters
The **top 10 SKUs deliver ~12% of total revenue**. Stock-out events on any
of them have a disproportionate revenue impact. Recommend tightening the
safety-stock threshold for these SKUs and adding them to a daily exception
report.

## 3. Geographic dependency — UK is the home market
Outside the UK, **Netherlands, EIRE, Germany, France** carry the bulk of
non-domestic revenue. Currency / Brexit shipping cost exposure should be
modelled per these four corridors first.

## 4. Returns — a small set of products drives the return rate
A handful of SKUs show return rates > 30% on > 100 units sold. These are
candidates for a **product-quality review or re-listing**: either the
description is misleading or the item is consistently disappointing.

## 5. Customer cohorts — retention drops sharply after month 1
First-time buyers from any cohort show a steep drop-off after their first
purchase month. Recommend an **automated re-engagement campaign** triggered
30 days after first order to test retention uplift.

---

## Recommendations to the business
| # | Action                                                         | Owner            | Effort |
|---|----------------------------------------------------------------|------------------|--------|
| 1 | Lock Q4 stock plan by end of August                            | Supply Planning  | M      |
| 2 | Daily exception report on top-10 revenue SKUs                  | BI / Operations  | S      |
| 3 | Quality review on high-return SKUs                             | Category         | M      |
| 4 | 30-day re-engagement email for new customers                   | CRM              | S      |
| 5 | Per-corridor shipping-cost model (NL, IE, DE, FR)              | Finance / Ops    | L      |

## Caveats
- Dataset is one retailer, not market-representative.
- Customer ID is missing on guest checkouts (~25% of rows).
- Returns matched to the original sale by SKU only, not by invoice pair.
