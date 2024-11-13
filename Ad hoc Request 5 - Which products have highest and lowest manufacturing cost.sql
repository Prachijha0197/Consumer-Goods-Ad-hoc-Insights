-- Get the products that have the highest and lowest manufacturing costs. The final output should contain these fields,
-- product_code
-- product
-- manufacturing_cost
USE gdb023

-- Get the Highest manufacturing cost
(SELECT
	t1.product_code,
    product,
    manufacturing_cost
FROM dim_product AS t1
INNER JOIN fact_manufacturing_cost AS t2
	ON t1.product_code = t2.product_code
GROUP BY product
ORDER BY manufacturing_cost DESC
LIMIT 1)

-- Join both queries without duplicates
UNION ALL

-- Get the lowest manufacturing cost
(SELECT
	t1.product_code,
    product,
    manufacturing_cost
FROM dim_product AS t1
INNER JOIN fact_manufacturing_cost AS t2
	ON t1.product_code = t2.product_code
GROUP BY product
ORDER BY manufacturing_cost
LIMIT 1);
