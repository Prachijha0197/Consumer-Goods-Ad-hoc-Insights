-- Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021? 
-- The final output contains these fields : division, product_code, product, total_sold_quantity, rank_order
WITH total_quantity AS(
	SELECT
		division,
		t1.product_code AS product_code,
		product,
		SUM(sold_quantity) AS total_sold_quantity,
        RANK() OVER(PARTITION BY division ORDER BY SUM(sold_quantity) DESC) AS rank_order
	FROM dim_product AS t1
	JOIN fact_sales_monthly AS t2
		ON t1.product_code = t2.product_code
	WHERE fiscal_year = 2021
	GROUP BY product)

SELECT
	division, product_code, product, total_sold_quantity, rank_order
FROM total_quantity
WHERE  rank_order <= 3;
