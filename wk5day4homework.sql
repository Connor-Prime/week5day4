ALTER TABLE customer
ADD Platinum_Member BOOLEAN

UPDATE customer
SET Platinum_Member = TRUE

UPDATE customer
SET Platinum_Member = TRUE
WHERE customer_id IN
	(SELECT  customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(AMount) > 200)

UPDATE customer
SET Platinum_Member = FALSE
WHERE customer_id NOT IN
	(SELECT  customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(AMount) > 200)
	
SELECT * FROM customer