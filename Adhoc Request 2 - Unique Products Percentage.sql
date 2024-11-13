-- What is the percentage of unique product increase in 2021 vs. 2020? The final output contains these fields, 
-- unique_products_2020
-- unique_products_2021
-- percentage_chg

USE gdb023
WITH products2020 AS(
	SELECT DISTINCT COUNT(product_code) AS unique_products_2020
	FROM fact_sales_monthly
	WHERE fiscal_year = 2020),
products2021 AS(
	SELECT DISTINCT COUNT(product_code) AS unique_products_2021
	FROM fact_sales_monthly
	WHERE fiscal_year = 2021)
SELECT
	unique_products_2020, 
    unique_products_2021,
    ROUND(100.0 * (unique_products_2021 - unique_products_2020) / unique_products_2020, 2) AS percentage_change
FROM products2020, products2021
