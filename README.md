# 🛒 Retail Sales SQL Project – Business Intelligence Storytelling  

## 📌 Business Requirement  
*Stakeholders asked to analyze the sales on **5th November 2022** (the best sales day of the year) to prepare for future campaigns.  
They want to understand sales performance by categories, customer behavior, and key revenue drivers.*  

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


