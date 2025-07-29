# Zepto E-commerce SQL Data Analytics Project
This is a complete, real-world data project based on an e-commerce inventory dataset scraped from Zepto — one of India’s fastest-growing quick-commerce startups. This project simulates real analyst workflows, from raw data exploration to business-focused data analysis.

The dataset was sourced from Kaggle and was originally scraped from Zepto’s official product listings. It mimics what you’d typically encounter in a real-world e-commerce inventory system.

Each row represents a unique SKU (Stock Keeping Unit) for a product. Duplicate product names exist because the same product may appear multiple times in different package sizes, weights, discounts, or categories to improve visibility – exactly how real catalog data looks.

1. Data Exploration
-Counted the total number of records in the dataset

-Viewed a sample of the dataset to understand structure and content

-Checked for null values across all columns

-Identified distinct product categories available in the dataset

-Compared in-stock vs out-of-stock product counts

-Detected products present multiple times, representing different SKUs

2. Business Insights
-Found top 10 best-value products based on discount percentage

-Identified high-MRP products that are currently out of stock

-Estimated potential revenue for each product category

-Filtered expensive products (MRP > ₹500) with minimal discount

-Ranked top 5 categories offering highest average discounts

-Calculated price per gram to identify value-for-money products

-Grouped products based on weight into Low, Medium, and Bulk categories

-Measured total inventory weight per product category
