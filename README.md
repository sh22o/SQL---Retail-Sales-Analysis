# 🛒 Retail Sales SQL Project – Business Intelligence Storytelling  

## 📌 Business Requirement  
* Stakeholders asked to analyze the sales on **5th November 2022** (the best sales day of the year) to prepare for future campaigns.  
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
## STEP 2:  Data exploration  
- q1: How many customers have a unique VALUE?
  ``` sql
  SELECT  count( DISTINCT customer_id) FROM Retailsales r ;
  ```
  ---
 - q2: how many categories?
  ``` sql
SELECT DISTINCT  r.category  from RetailSales r ; 

```
--- 
## STEP 3 : analysis & business problems  
## ❓ Business Questions → 💻 SQL Queries → 📊 Insights  
--- 
### **q1: Retrieve all columns for sales made on '2022-11-05' ?**
```sql
SELECT * from Retailsales r 
WHERE r.sale_date = '2022-11-05';
```
--- 
### **q2:what is the total transition?**
```sql
SELECT count(*) as total_sale 
from Retailsales r 
WHERE r.sale_date = '2022-11-05';
```
--- 
### **q3: What is  the total revenue?**
```sql
SELECT SUM(r.total_sale ) as total_revenue 
from Retailsales r 
WHERE r.sale_date = '2022-11-05'; 

```
### **q4:What was the average order value?**

```sql
SELECT AVG(r.total_sale ) as avg_order_value 
from Retailsales r 
WHERE r.sale_date = '2022-11-05'; 

```
**Insight:**  

| Metric               | Value   |
|-----------------------|---------|
| Total Sales           | $6,830  |
| Total Transactions    | 11      |
| Average Order Value   | 621     | 


---  
### **Q5. Which product categories contributed the most on that day?** 
```SQL
SELECT category, SUM(total_sale) AS category_sales
FROM Retailsales
WHERE sale_date = '2022-11-05'
GROUP BY category
ORDER BY category_sales DESC;
```
--- 
### **Q6.Which categories sold most on that day?** 
```SQL
SELECT category, SUM(total_sale) AS category_sales
FROM Retailsales
WHERE sale_date = '2022-11-05'
GROUP BY category
ORDER BY category_sales DESC;
``` 
---  
 💡 **Insight:**  
> - Clothing dominated sales on Nov 5, 2022.  
> - Beauty was the second top contributor.  
> - Electronics performed moderately.

--- 
### **Q7. All transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022** 

``` SQL
SELECT *  
FROM Retailsales r 
Where r.category ='Clothing' 
And r.quantiy >=4 
AND r.sale_date BETWEEN '2022-11-01' AND '2022-11-31';

```
### **q8.Count of transition for all November**

```sql
SELECT COUNT(*) AS total_transactions 
FROM Retailsales r 
Where r.category ='Clothing' 
And r.quantiy >=4 
AND r.sale_date BETWEEN '2022-11-01' AND '2022-11-31'; 
```

### **Q9. How much Total revenue for all of  November** 

```sql
SELECT SUM(r.total_sale ) AS total_transactions 
FROM Retailsales r 
Where r.category ='Clothing' 
And r.quantiy >=4 
AND r.sale_date BETWEEN '2022-11-01' AND '2022-11-31';
```
### **Q10. What is the average order value (AOV) for these sales for all of November?** 

```sql
SELECT AVG(r.total_sale )AS avg_order_value
FROM Retailsales r
Where r.category ='Clothing' 
And r.quantiy >=4 
AND r.sale_date BETWEEN '2022-11-01' AND '2022-11-31';
```
--- 
 💡 **Insight:**  
 
| Metric               | Value   |
|-----------------------|---------|
| Total Sales           | $11.360 |
| Total Transactions    | 17      |
| Average Order Value   | 668     |  

--- 
### **Q11.Which gender bought the most Clothing items (>4 units) in November 2022?**  

```sql
SELECT r.gender , COUNT(*) AS transactions ,
SUM(r.total_sale ) AS revenue
FROM Retailsales r
Where r.category ='Clothing' 
And r.quantiy >=4 
AND r.sale_date BETWEEN '2022-11-01' AND '2022-11-31';
```
<img width="637" height="164" alt="image" src="https://github.com/user-attachments/assets/7cf407da-be29-4ac5-a672-4cb0d006d79b" />

--- 
### **Q.12 THE BEST day for sales by data and value** 

```SQL
SELECT MAX(R.total_sale) , R.sale_date  AS TOP_DAY 
FROM Retailsales r 
Where r.category ='Clothing' 
And r.quantiy >=4 
AND r.sale_date BETWEEN '2022-11-01' AND '2022-11-31';
```
<img width="512" height="161" alt="image" src="https://github.com/user-attachments/assets/fcb45c26-0770-4acd-abc4-a8058ed3bd99" />

---  
### **Q13. Write a SQL query to calculate the total sales (total_sale) for each category.:** 

```sql
SELECT  R.category  , SUM(r.total_sale )as net_sale,
    COUNT(*) as total_orders
FROM Retailsales r 
GROUP BY 1 ; 

``` 
<img width="660" height="203" alt="image" src="https://github.com/user-attachments/assets/d88a9d91-7ba1-4642-9017-5eb72233fd1e" /> 
--- 
### **Q14. FIND AVG AGE FOR CUSTOMERS' SALES?**  

```sql
SELECT  
    ROUND(AVG(r.age), 2) AS avg_age, 
    r.category, 
    SUM(r.total_sale) AS net_sale,
    COUNT(*) AS total_orders
FROM Retailsales r
GROUP BY r.category;
```
<img width="910" height="256" alt="image" src="https://github.com/user-attachments/assets/ca40016b-abb3-4f3f-a4ae-6bb690ec2ee1" /> 

--- 
### **Q15. Find the top 5 customers based on the highest total sales.**  

```sql
SELECT R.customer_id ,r.category , r.sale_date ,SUM(r.total_sale) as total_sales 
FROM Retailsales r
GROUP BY 1
LIMIT 5
```
<img width="935" height="315" alt="image" src="https://github.com/user-attachments/assets/78214143-8c10-4179-bb29-1a2e4b4dea3c" /> 

--- 
### **Q15. Find the number of unique customers who purchased items from each category.**   

```sql
SELECT 
    r.category,    
    COUNT(DISTINCT r.customer_id ) as unique_customer 
FROM Retailsales r 
GROUP BY category
```
 
<img width="767" height="264" alt="image" src="https://github.com/user-attachments/assets/de928c3f-1f01-4c04-8299-453f64fc36f4" />  

--- 

### **Q16. SHOW ALL TRANSITION DETAILS FOR ID VIEW ON UNIQUE CUSTOMER:(EX: "141" )**   

```sql
select   * 
from Retailsales r 
WHERE r.customer_id = 141;
```
<img width="1411" height="408" alt="image" src="https://github.com/user-attachments/assets/bc9cf2d9-8e1e-4c09-ba8b-a267f489a243" /> 

---
## 🚀 Conclusion & Business Impact  

This project demonstrates how **SQL** can be used not only for querying data but also for **business intelligence storytelling**.  
By cleaning, exploring, and analyzing the retail sales dataset, we answered key stakeholder questions such as:  

- 📊 **Performance on Nov 5, 2022 (best sales day)** – total revenue, transactions, and average order value.  
- 🛍️ **Top-performing categories** – Clothing dominated, followed by Beauty and Electronics.  
- 👥 **Customer behavior insights** – gender preferences, average age, and top customers by revenue.  
- 📈 **Campaign readiness** – identified opportunities for targeting high-value segments and best-performing product categories.
  -- ✅ With these insights, the business can make **data-driven decisions** for future campaigns, optimize **inventory**, and improve **marketing strategies**.  
--- 
## 🔮 Next Steps  

- 📆 Extend analysis to other months for trend comparison.  
- 📊 Build dashboards (Excel / Power BI / Tableau) for real-time monitoring.  
- 👥 Apply segmentation to identify loyal vs. one-time customers.  
--- 
🙋‍♀️ About Me  
**Shereen Wagdy**  
📩 Email: shereenwagdy214@gmail.com  
💼 Role: Junior Data & Product Analyst — SQL • Business Intelligence • Data Storytelling  

I’m passionate about transforming raw data into **business insights** that drive smarter decisions.  
This project was created to practice real SQL skills, including **data cleaning, exploration, CRUD operations, and business problem-solving**, on a **retail sales dataset**.  

✨ My goal is to bridge the gap between **technical analysis** and **business value**, using SQL as a foundation for data-driven decision making.  

































