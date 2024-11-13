-- Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution? The final output 
-- contains these fields : channel, gross_sales_mln, percentage
USE gdb023
WITH sales_product AS(
	SELECT
		channel,
		ROUND(SUM(gross_price * sold_quantity)) AS gross_sales
	FROM fact_gross_price AS t1
	JOIN fact_sales_monthly AS t2
		ON t1.product_code = t2.product_code
	JOIN dim_customer AS t3
		ON t2.customer_code = t3.customer_code
	WHERE t2.fiscal_year = 2021
	GROUP BY channel)
SELECT
	channel,
    gross_sales,
    ROUND(gross_sales/SUM(gross_sales)  OVER() * 100.0, 2) AS percentage
FROM sales_product
ORDER BY gross_sales DESC
LIMIT 1;
