# 🛒 Retail Sales SQL Project – Business Intelligence Storytelling  

## 📌 Business Requirement  
*Stakeholders asked to analyze the sales on **5th November 2022** (the best sales day of the year) to prepare for future campaigns.  
They want to understand sales performance by categories, customer behavior, and key revenue drivers.*  
--- 
## Step 1: Data Cleaning  

- Explored the first 10 rows of the dataset to understand its structure and content.  

```sql
SELECT *
FROM RetailSales AS rs
LIMIT 10;
```
--- 
- Counted the total number of records available in the dataset. 
```sql

SELECT COUNT(*) 
FROM Retailsales r; 
```
--- 
- Checked for missing or null values across all key columns 
```sql
SELECT *
FROM Retailsales
WHERE customer_id IS NULL OR customer_id = ''
   OR age IS NULL OR age = ''
   OR category IS NULL OR category = ''
   OR sale_date IS NULL OR sale_date = ''
   OR cogs IS NULL OR cogs = ''
   OR gender IS NULL OR gender = ''
   OR price_per_unit IS NULL OR price_per_unit = ''
   OR quantiy IS NULL OR quantiy = ''
   OR sale_time IS NULL OR sale_time = ''
   OR total_sale IS NULL OR total_sale = ''
``` 
--- 
- Identified and removed rows with null or empty values to ensure the dataset is  clean and ready for analysis
``` sql
ELETE 
FROM Retailsales 
WHERE customer_id IS NULL OR customer_id = ''
   OR age IS NULL OR age = ''
   OR category IS NULL OR category = ''
   OR sale_date IS NULL OR sale_date = ''
   OR cogs IS NULL OR cogs = ''
   OR gender IS NULL OR gender = ''
   OR price_per_unit IS NULL OR price_per_unit = ''
   OR quantiy IS NULL OR quantiy = ''
   OR sale_time IS NULL OR sale_time = ''
   OR total_sale IS NULL OR total_sale = '';
``` 
--- 
## ❓ Business Questions → 💻 SQL Queries → 📊 Insights  

### **Q1. What were the total sales and transactions on 5th Nov 2022?**  
```sql
SELECT 
    SUM(price * quantity) AS total_sales,
    COUNT(*) AS total_transactions
FROM retail_sales
WHERE sale_date = '2022-11-05';
```
--- 
**Insight:**  

| Metric               | Value   |
|-----------------------|---------|
| Total Sales           | $6,830  |
| Total Transactions    | 11      |
| Average Order Value   | $621    | 

--- 
### **Q2. Which product categories contributed most on that day?**
```sql
SELECT 
    category, 
    SUM(price * quantity) AS total_sales
FROM retail_sales
WHERE sale_date = '2022-11-05'
GROUP BY category
ORDER BY total_sales DESC;
```
--- 
**Insight:**  
> 💡 **Insight:**  
> - Clothing dominated sales on Nov 5, 2022.  
> - Beauty was the second top contributor.  
> - Electronics performed moderately.

---  




