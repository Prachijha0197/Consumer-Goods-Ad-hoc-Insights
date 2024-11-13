-- Provide a report with all the unique product counts for each segment and sort them in descending order of product counts. 
-- The final output contains 2 fields segment and product_count
USE gdb023
SELECT
	segment,
    COUNT(product) AS product_count
FROM dim_product
GROUP BY segment
ORDER BY product_count DESC;
