-- Question 1 : Revenue from each sales channel for year 2021

SELECT 
    sales_channel,
    SUM(amount) AS total_revenue
FROM clinic_sales
WHERE YEAR(datetime) = 2021
GROUP BY sales_channel;

-- Question 2 : Top 10 most valuable customers for 2021

SELECT 
    uid,
    SUM(amount) AS total_spent
FROM clinic_sales
WHERE YEAR(datetime)=2021
GROUP BY uid
ORDER BY total_spent DESC
LIMIT 10;

-- Question 3 : Month-wise revenue, expense, profit and status

SELECT 
    MONTH(cs.datetime) AS month,
    SUM(cs.amount) AS revenue,
    SUM(e.amount) AS expense,
    SUM(cs.amount) - SUM(e.amount) AS profit,
    CASE 
        WHEN SUM(cs.amount) - SUM(e.amount) > 0 
        THEN 'Profitable'
        ELSE 'Not Profitable'
    END AS status
FROM clinic_sales cs
JOIN expenses e ON cs.cid = e.cid
GROUP BY MONTH(cs.datetime)
ORDER BY month;

-- Question 4 : Most profitable clinic in each city for a given month

SELECT *
FROM
(
SELECT 
    c.city,
    c.clinic_name,
    SUM(cs.amount) - SUM(e.amount) AS profit,
    RANK() OVER(PARTITION BY c.city 
    ORDER BY SUM(cs.amount) - SUM(e.amount) DESC) AS r
FROM clinics c
JOIN clinic_sales cs ON c.cid = cs.cid
JOIN expenses e ON c.cid = e.cid
WHERE MONTH(cs.datetime) = 5
GROUP BY c.city, c.clinic_name
) t
WHERE r = 1;

-- Question 5 : Second least profitable clinic per state for a given month

SELECT *
FROM
(
SELECT 
    c.state,
    c.clinic_name,
    SUM(cs.amount) - SUM(e.amount) AS profit,
    DENSE_RANK() OVER(
        PARTITION BY c.state
        ORDER BY SUM(cs.amount) - SUM(e.amount)
    ) AS r
FROM clinics c
JOIN clinic_sales cs ON c.cid = cs.cid
JOIN expenses e ON c.cid = e.cid
WHERE MONTH(cs.datetime) = 10
GROUP BY c.state, c.clinic_name
) x
WHERE r = 2;