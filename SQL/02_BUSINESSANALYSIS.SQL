-----QUERY----------
select*
from superstore_sales
limit 10;

--------Total Records-------
 select count (*) as total_records
 from superstore_sales;
 
----------TOTAL SALES------ 
 SELECT SUM(SALES) AS total_sales
FROM SUPERSTORE_SALES;
-----------Total Profit------
SELECT SUM(PROFIT) AS total_profit
FROM SUPERSTORE_SALES;

--------Top 10 Customers-----
SELECT CUSTOMER_NAME,
SUM(SALES) AS total_sales
FROM SUPERSTORE_SALES
GROUP BY CUSTOMER_NAME
ORDER BY total_sales DESC
LIMIT 10;
----------Sales by Category------
SELECT CATEGORY,
SUM(SALES) AS total_sales
FROM SUPERSTORE_SALES
GROUP BY CATEGORY
ORDER BY total_sales DESC;
-------Sales by Region-------
SELECT REGION,
SUM(SALES) AS total_sales
FROM SUPERSTORE_SALES
GROUP BY REGION;
-------Identify the products generating the highest revenue---------
SELECT PRODUCT_NAME,
       SUM(SALES) AS TOTAL_SALES
FROM SUPERSTORE_SALES
GROUP BY PRODUCT_NAME
ORDER BY TOTAL_SALES DESC
LIMIT 10;


------------Find the products contributing the most profit.------------
SELECT PRODUCT_NAME,
       SUM(PROFIT) AS TOTAL_PROFIT
FROM SUPERSTORE_SALES
GROUP BY PRODUCT_NAME
ORDER BY TOTAL_PROFIT DESC
LIMIT 10;

---------Top 5 Customers in Each Region-------------
SELECT *
FROM (
    SELECT
        REGION,
        CUSTOMER_NAME,
        SUM(SALES) AS TOTAL_SALES,
        RANK() OVER(PARTITION BY REGION ORDER BY SUM(SALES) DESC) AS RANKING
    FROM SUPERSTORE_SALES
    GROUP BY REGION, CUSTOMER_NAME
)
WHERE RANKING <= 5;


-----------Products Making a Loss---------
SELECT
    PRODUCT_NAME,
    SUM(PROFIT) AS TOTAL_PROFIT
FROM SUPERSTORE_SALES
GROUP BY PRODUCT_NAME
HAVING SUM(PROFIT) < 0
ORDER BY TOTAL_PROFIT;