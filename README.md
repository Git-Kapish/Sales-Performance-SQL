# Sales Performance & Growth Analysis (SQL)

## Project Overview
This project analyzes retail sales data using SQL to uncover revenue trends, product performance, regional contribution, and revenue concentration patterns.  
It simulates a real-world **Data Analyst / Business Analyst** workflow — from raw data ingestion to business-ready insights.

The entire analysis is performed using **MySQL**, leveraging advanced SQL concepts such as CTEs, window functions, aggregations, and Pareto analysis.

---

## Dataset
- **Source:** Sample Superstore Dataset (Kaggle)
- **Records:** ~9,694 rows
- **Key Fields:**
  - Order Date, Ship Date
  - Product Name, Category, Sub-Category
  - Region, Sales, Profit, Quantity

The dataset represents historical retail sales across multiple regions and product categories.

---

## Tools & Technologies
- **Database:** MySQL  
- **Language:** SQL  

### SQL Concepts Used
- Common Table Expressions (CTEs)
- Window Functions (`LAG`, `RANK`, cumulative sums)
- Aggregations & Grouping
- Date transformations
- Pareto (80/20) analysis

---

## Analysis Breakdown

### 1️. Data Cleaning & Preparation
- Converted text-based date fields into proper `DATE` format
- Validated record counts and null values
- Ensured consistent data types for reliable analysis

---

### 2️. Monthly Revenue Growth Analysis
- Calculated monthly revenue trends
- Performed month-on-month (MoM) growth analysis using window functions
- Identified long-term growth patterns and seasonal volatility

---

### 3️. Product Performance Analysis
- Identified top 10 and bottom 10 products by revenue
- Calculated product-level revenue contribution
- Evaluated revenue distribution across the product portfolio

---

### 4️. Regional & Category Analysis
- Analyzed region-wise revenue contribution
- Compared category performance across regions
- Identified high-performing markets and product segments

---

### 5️. Pareto (80/20) Analysis
- Performed cumulative revenue analysis at the product level
- Identified that ~11% of products contribute ~80% of total revenue
- Highlighted revenue concentration and business risk implications

---

## Key Business Insights
- Revenue shows strong long-term growth with noticeable seasonal spikes.
- The top 10 products contribute ~10.76% of total revenue, indicating a diversified product mix.
- West and East regions together generate ~61% of overall revenue.
- Technology is the highest revenue-generating category across all regions.
- Pareto analysis confirms that a small subset of products drives the majority of revenue.

*Detailed insights are documented in `insights.md`.*

---

## 📁 Project Structure
```text
Sales-Performance-SQL/
│
├── dataset/
│   └── Sample - Superstore.csv
├── sql/
│   ├── 01_data_setup.sql
│   ├── 02_data_cleaning.sql
│   ├── 03_revenue_growth.sql
│   ├── 04_product_performance.sql
│   ├── 05_regional_analysis.sql
│   └── 06_pareto_analysis.sql
├── insights.md
└── README.md
```

## Author
**Kapish Yadav**  
Aspiring Data Analyst
