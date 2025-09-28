
-- project sql 1 : Retails sales 

-- STEP 1 : Data cleaning 

--FOR EXPLORE DATA ROWS WITH LIMIT 10 
--SELECT *
FROM Retailsales as rs
LIMIT 10;

-- FOR NOW COUNT OF DATA 
SELECT COUNT (*) FROM Retailsales r ;  

-- CHECK FOR NULL VALUE  
-- TIP :(IF I IMPORT DATA AS CSV >> NULL >> "")

SELECT *
FROM Retailsales
WHERE customer_id IS NULL OR customer_id = ''
   OR age IS NULL OR age = ''
   OR category IS NULL OR category = ''
   OR sale_date IS NULL OR sale_date = ''
   OR cogs IS NULL OR cogs = ''
   OR gender IS NULL OR gender = ''
   OR price_per_unit IS NULL OR price_per_unit = ''
   OR quantiy  IS NULL OR quantiy = ''
   OR sale_time IS NULL OR sale_time = ''
   OR total_sale IS NULL OR total_sale = '';

-- DELET DATA HAVE NULL VALUE  

DELETE 
FROM Retailsales 
WHERE customer_id IS NULL OR customer_id = ''
   OR age IS NULL OR age = ''
   OR category IS NULL OR category = ''
   OR sale_date IS NULL OR sale_date = ''
   OR cogs IS NULL OR cogs = ''
   OR gender IS NULL OR gender = ''
   OR price_per_unit IS NULL OR price_per_unit = ''
   OR quantiy  IS NULL OR quantiy = ''
   OR sale_time IS NULL OR sale_time = ''
   OR total_sale IS NULL OR total_sale = '';  

-- STEP 2 :  Data exploration 

-- q1 : How many customers UNIQE VALUE ? 

SELECT  count( DISTINCT customer_id) FROM Retailsales r ;

-- how many catagory and view ? 

SELECT DISTINCT  r.category  from Retailsales r ; 

-- STEP 3 : analysis & business problems 
--req 1 ==>  q1 : retrieve all columns for sales made on '2022-11-05' ? 
SELECT * from Retailsales r 
WHERE r.sale_date = '2022-11-05';  

-- How many sales happened that day?
SELECT count(*) as total_sale 
from Retailsales r 
WHERE r.sale_date = '2022-11-05';  

-- answer 11 

--What was the total revenue? 
SELECT SUM(r.total_sale ) as total_revenue 
from Retailsales r 
WHERE r.sale_date = '2022-11-05'; 

-- answer = 6,830  

--What was the average order value?
SELECT AVG(r.total_sale ) as avg_order_value 
from Retailsales r 
WHERE r.sale_date = '2022-11-05'; 

--answer = 621 

--Which categories sold most on that day? 
SELECT category, SUM(total_sale) AS category_sales
FROM Retailsales
WHERE sale_date = '2022-11-05'
GROUP BY category
ORDER BY category_sales DESC;

--answer= (clothing , beauty , electronics )


-- Q2 : all transactions where the category is 'Clothing' 
-- and the quantity sold is more than 4 in the month of Nov-2022 

SELECT *  
FROM Retailsales r 
Where r.category ='Clothing' 
And r.quantiy >=4 
AND r.sale_date BETWEEN '2022-11-01' AND '2022-11-31';


-- FIND COUNT OF TOTAL TRANSICTION =>  answer = 17 
SELECT COUNT(*) AS total_transactions 
FROM Retailsales r 
Where r.category ='Clothing' 
And r.quantiy >=4 
AND r.sale_date BETWEEN '2022-11-01' AND '2022-11-31'; 

--What is the total revenue from these Clothing sales? 
SELECT SUM(r.total_sale ) AS total_transactions 
FROM Retailsales r 
Where r.category ='Clothing' 
And r.quantiy >=4 
AND r.sale_date BETWEEN '2022-11-01' AND '2022-11-31'; 

--What is the average order value (AOV) for these sales? 

SELECT AVG(r.total_sale )AS avg_order_value
FROM Retailsales r
Where r.category ='Clothing' 
And r.quantiy >=4 
AND r.sale_date BETWEEN '2022-11-01' AND '2022-11-31'; 

--Which gender bought the most Clothing items (>4 units) in November 2022?
SELECT r.gender , COUNT(*) AS transactions ,
SUM(r.total_sale ) AS revenue
FROM Retailsales r
Where r.category ='Clothing' 
And r.quantiy >=4 
AND r.sale_date BETWEEN '2022-11-01' AND '2022-11-31'; 

-- THE BEST day for sales by data and value 

SELECT MAX(R.total_sale) , R.sale_date  AS TOP_DAY 
FROM Retailsales r 
Where r.category ='Clothing' 
And r.quantiy >=4 
AND r.sale_date BETWEEN '2022-11-01' AND '2022-11-31'; 

--Q3: Write a SQL query to calculate the total sales (total_sale) for each category.:
SELECT  R.category  , SUM(r.total_sale )as net_sale,
    COUNT(*) as total_orders
FROM Retailsales r 
GROUP BY 1 ; 

-- Q4 : FIND AVG AGE FOR CUSTOMERS SALES 
SELECT  
    ROUND(AVG(r.age), 2) AS avg_age, 
    r.category, 
    SUM(r.total_sale) AS net_sale,
    COUNT(*) AS total_orders
FROM Retailsales r
GROUP BY r.category;

--  

--q5:find the top 5 customers based on the highest total sales 

SELECT R.customer_id ,r.category , r.sale_date ,SUM(r.total_sale) as total_sales 
FROM Retailsales r
GROUP BY 1
LIMIT 5 

-- q6 :find the number of unique customers who purchased items from each category. 

SELECT 
    r.category ,    
    COUNT(DISTINCT r.customer_id ) as unique_customer 
FROM Retailsales r 
GROUP BY category

-- SHOW ALL TRANSICTION DETAILS FOR ID VIEW ON UNIQE CUSTOMER 
select   * 
from Retailsales r 
WHERE r.customer_id = 141; 

-- 

 

