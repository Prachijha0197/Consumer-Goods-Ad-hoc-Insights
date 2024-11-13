-- Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month. This analysis helps to get
-- an idea of low and high-performing months and take strategic decisions.
-- The final report contains these columns: Month, Year, Gross sales Amount

USE gdb023;
SELECT
	MONTHNAME(date) AS Month,
	YEAR(date) AS Year,
	ROUND(SUM(gross_price * sold_quantity)) AS Gross_sales_amount
FROM fact_sales_monthly AS t1
JOIN dim_customer AS t2
	ON t1.customer_code = t2.customer_code
JOIN fact_gross_price AS t3
	ON t1.product_code = t3.product_code
WHERE customer = 'Atliq Exclusive'
GROUP BY Month
ORDER BY Year;
