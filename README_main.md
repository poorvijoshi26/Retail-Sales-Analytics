# Retail Sales Analytics

End-to-end retail sales and profitability analysis on the Superstore dataset, using two complementary tools: **SQL** for query-level analysis and **Power BI** for interactive stakeholder reporting.

## Projects in this repo

### 📊 Power BI Dashboard — `sales performance dashboard.pbix`
3-page interactive report (Executive Summary, Customer & Product Analysis, Profit Analysis) covering 9,000+ sales records with 12+ tracked KPIs — Total Sales, Total Profit, Profit Margin, Total Orders, Total Customers, Average Order Value — across Region, State, Category, Sub-Category, and Customer Segment.

### 🧮 SQL Analysis — `SQL-Analysis/`
Independent SQL analysis on the exact same dataset, answering 6 core business questions: overall profitability, regional/category performance, loss-making sub-categories, top customers, year-over-year growth, and ship-mode margin impact (using window functions). Built and executed in a Python + SQLite notebook, with a standalone `.sql` file containing the raw queries.

- `Superstore_SQL_Analysis.ipynb` — full notebook with queries, explanations, and charts
- `superstore_queries.sql` — raw SQL queries only
- Chart exports (sales by region, loss-making sub-categories, YoY trend)

## Dataset
`Dataset/Sample - Superstore.csv` — 9,994 order-line records. Same source file used by both the SQL analysis and the Power BI dashboard, so results are directly comparable.

## Data Quality Note
During analysis, ~17% of orders were found to have `Order Date` values affected by a day/month locale mismatch in the source file. This was identified and explicitly corrected in the SQL notebook before any time-based analysis was run.

## Why two tools on the same data
This repo is meant to show both ends of the analyst toolkit: **SQL** for direct, auditable query logic, and **Power BI** for polished, drill-down reporting that a non-technical stakeholder can use. Numbers from the SQL analysis (e.g. Total Sales, Profit Margin) can be cross-checked directly against the corresponding Power BI cards, since both are built on identical source data.

---
**Author:** Poorvi Joshi
