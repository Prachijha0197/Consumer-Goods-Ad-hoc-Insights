-- Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? The final output contains these fields, 
-- segment
-- product_count_2020
-- product_count_2021
-- difference

USE gdb023
WITH products2020 AS(
	SELECT DISTINCT segment, COUNT(product) AS product_count_2020
	FROM dim_product t1
	INNER JOIN  fact_sales_monthly t2
		ON t1.product_code = t2.product_code
	WHERE fiscal_year = '2020'
	GROUP BY segment
    ORDER BY product_count_2020 DESC),
products2021 AS(
	SELECT DISTINCT segment, COUNT(product) AS product_count_2021
	FROM dim_product t1
	INNER JOIN  fact_sales_monthly t2
		ON t1.product_code = t2.product_code
	WHERE fiscal_year = '2021'
	GROUP BY segment
    ORDER BY product_count_2021 DESC)
SELECT
	products2020.segment, 
    product_count_2020, 
    product_count_2021, 
    (product_count_2021 - product_count_2020) AS difference
FROM products2020
JOIN products2021 
	ON products2020.segment = products2021.segment
ORDER BY difference DESC;
