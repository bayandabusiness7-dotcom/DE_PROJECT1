# DE_PROJECT1
# Kasi Mart — Data Engineering Project 1

A small end-to-end data engineering exercise built on Snowflake: loading a retail dataset (customers, products, orders) into a database, then writing SQL to answer core business questions about revenue and customer spend.

## Business Context

Kasi Mart is a fictional South African retailer selling products across four categories: **Electronics, Home, Fashion, and Beauty**. This project simulates loading their operational data into a cloud data warehouse (Snowflake) and running analytical queries to understand revenue drivers and top customers.

## Datasets

Three CSV files were provided and loaded into Snowflake as tables:

| File | Rows | Description |
|---|---|---|
| `customers.csv` | 50 | Customer ID, name, email, province, signup date |
| `products.csv` | 20 | Product ID, name, category, unit price |
| `orders.csv` | 150 | Order ID, customer ID, product ID, order date, quantity |

## Repository Structure

```
kasi-mart-data-engineering/
├── README.md
├── data/
│   ├── DE_PROJECT1_CUSTOMERS.csv
│   ├── DE_PROJECT1_PRODUCTS.csv
│   └── DE_PROJECT1_ORDERS.csv
├── sql/
│   ├── kasi_mart_load_statements.sql   -- table creation + data load
│   └── kasi_mart_queries.sql           -- the four analytical queries
├── results/
│   ├── QUERY_1.csv
│   ├── QUERY_2.csv
│   ├── QUERY_3.csv
│   └── QUERY_4.csv
└── screenshots/
    └── snowflake_database_schema_tables.png
```

## Setup in Snowflake

1. Created a database `DE_PROJECT1` and schema `DBO`.
2. Created three tables — `customers`, `products`, `orders` — matching the CSV structures.
3. Loaded data using `INSERT INTO` statements (see `sql/kasi_mart_load_statements.sql`).
4. Verified row counts and table sizes in Snowflake's Database Explorer:

   | Table | Rows | Size |
   |---|---|---|
   | CUSTOMERS | 50 | 2.5 KB |
   | ORDERS | 150 | 2.5 KB |
   | PRODUCTS | 20 | 1.5 KB |

## Queries & Results

All four required queries are in `sql/kasi_mart_queries.sql`. Full result sets are in `/results`.

### 1. Orders joined to customer, product, category, and line revenue
Joins `orders` to `customers` and `products`, adding a calculated `line_revenue` (`quantity × unit_price`) per order line. Returned all 150 orders with no orphaned rows, confirming referential integrity across the three tables.

### 2. Total revenue per customer
Aggregates line revenue by customer. 49 of the 50 customers had placed at least one order. **Nomvula Coetzee** was the highest-spending customer, with total revenue of **R11,722**.

### 3. Total revenue per product category
Aggregates line revenue by product category:

| Category | Total Revenue |
|---|---|
| Beauty | R87,081 |
| Home | R72,904 |
| Fashion | R49,800 |
| Electronics | R47,562 |

Beauty and Home are the strongest revenue-driving categories.

### 4. Top 5 customers by total spend
Ranks all customers by total spend and limits to the top 5:

| Rank | Customer | Total Spend |
|---|---|---|
| 1 | Nomvula Coetzee | R11,722 |
| 2 | Karabo Nkosi | R11,004 |
| 3 | Naledi Ndlovu | R10,691 |
| 4 | Fatima Sithole | R9,116 |
| 5 | Michael Els | R8,968 |

## Key Takeaways

- Beauty and Home products generate the most revenue for Kasi Mart, together accounting for well over half of total sales.
- Nomvula Coetzee is the store's top customer by spend, and appears consistently at #1 in both the per-customer revenue and top-5 rankings — a strong candidate for a loyalty or retention program.
- One customer (out of 50) had never placed an order, which could be worth flagging for a re-engagement campaign.

## Tech Stack

- **Snowflake** — data warehouse, table storage, SQL execution
- **SQL** — joins, aggregations, ranking queries
- **GitHub** — version control and submission

## Author

Data Engineering Project 1 submission.
