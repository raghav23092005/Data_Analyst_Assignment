-- Question 1 : Last booked room for each user
 
 SELECT user_id, room_no
FROM bookings b1
WHERE booking_date =
(
SELECT MAX(booking_date)
FROM bookings b2
WHERE b1.user_id = b2.user_id
);

-- Question 2 : Booking ID and total billing amount in November 2021

SELECT bc.booking_id,
SUM(i.item_rate * bc.item_quantity) AS total_bill
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE MONTH(bc.bill_date)=11
AND YEAR(bc.bill_date)=2021
GROUP BY bc.booking_id;

-- Question 3 : Bills raised in October 2021 having amount > 1000

SELECT bill_id,
SUM(i.item_rate * bc.item_quantity) AS bill_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id=i.item_id
WHERE MONTH(bc.bill_date)=10
AND YEAR(bc.bill_date)=2021
GROUP BY bill_id
HAVING bill_amount > 1000;

-- Question 4 : Most ordered and least ordered item each month of 2021

SELECT month, item_id, total_qty
FROM
(
SELECT
MONTH(bill_date) AS month,
item_id,
SUM(item_quantity) AS total_qty,
RANK() OVER (PARTITION BY MONTH(bill_date) ORDER BY SUM(item_quantity) DESC) r1,
RANK() OVER (PARTITION BY MONTH(bill_date) ORDER BY SUM(item_quantity) ASC) r2
FROM booking_commercials
WHERE YEAR(bill_date)=2021
GROUP BY MONTH(bill_date), item_id
) t
WHERE r1=1 OR r2=1;

-- Question 5 : Customers with second highest bill value each month

SELECT *
FROM
(
SELECT
MONTH(bc.bill_date) month,
b.user_id,
SUM(i.item_rate*bc.item_quantity) bill_value,
DENSE_RANK() OVER
(PARTITION BY MONTH(bc.bill_date)
ORDER BY SUM(i.item_rate*bc.item_quantity) DESC) r
FROM booking_commercials bc
JOIN bookings b ON bc.booking_id=b.booking_id
JOIN items i ON bc.item_id=i.item_id
WHERE YEAR(bc.bill_date)=2021
GROUP BY MONTH(bc.bill_date),b.user_id
) x
WHERE r=2;