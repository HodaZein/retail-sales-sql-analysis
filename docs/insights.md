# notes from poking at this dataset

quick stuff, not a formal report. things I'd actually flag to a category/commercial manager.

**Nov is everything.** revenue is super seasonal, Nov peaks at ~2.5x off-season. Build-up starts in Sep so Q4 stock decisions need to be locked by end of Aug. Miss that window and Q4 is at risk.

**Top 10 SKUs do ~12% of revenue.** long tail but real concentration at the top. Stock-outs on any of those 10 hurt disproportionately. Worth a daily availability exception report on that set.

**Outside the UK, the EU corridors carry the rest.** NL, IE, DE, FR in that order. Anything affecting shipping cost on those four (currency, brexit, fuel) is the first thing to model.

**A handful of products have nasty return rates.** some SKUs with >100 units sold are coming back at >30%. Either listing is misleading or the product is just disappointing. Worth a category review.

**New customers drop off fast after month 1.** pretty steep drop-off across all cohorts after the first purchase month. A 30-day re-engagement email feels like a cheap test to run.

---

if I were actually doing this for a client:
- lock Q4 stock plan by end Aug (supply planning, M effort)
- daily exception report on top-10 SKUs (BI/ops, S)
- quality review on the high-return SKUs (category, M)
- 30-day re-engagement email (CRM, S)
- per-corridor shipping cost model NL/IE/DE/FR (finance/ops, L)

caveats: one retailer not market-representative. ~25% of rows have no customer_id (guest checkout) so cohort stuff is partial. returns matched to original sale by SKU only, not invoice pair.
