-- Provide the list of markets in which customer "Atliq Exclusive" operates its business in the APAC region.
-- Use the database named gdb023
USE gdb023
SELECT 
	DISTINCT customer, 
	market AS markets
FROM dim_customer
WHERE customer = 'Atliq Exclusive' AND region = 'APAC';
