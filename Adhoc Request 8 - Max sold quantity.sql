-- In which quarter of 2020, got the maximum total_sold_quantity? The final output contains these fields sorted by the
-- total_sold_quantity, Quarter and total_sold_quantity
USE gdb023
WITH month_quarter AS(
	SELECT
		sold_quantity,
		fiscal_year,
		CASE
			WHEN MONTH(date) IN (9,10,11) THEN "q1"
			WHEN MONTH(date) IN (12, 1, 2) THEN "q2"
			WHEN MONTH(date) IN (3, 4, 5) THEN "q3"
			ELSE "q4" END AS quarter
	FROM fact_sales_monthly)

SELECT
	quarter,
    SUM(sold_quantity) AS total_sold_quantity
FROM month_quarter
WHERE fiscal_year = 2020
GROUP BY quarter
ORDER BY total_sold_quantity DESC;
