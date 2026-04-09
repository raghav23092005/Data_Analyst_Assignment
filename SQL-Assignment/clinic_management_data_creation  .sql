CREATE TABLE clinics(
cid VARCHAR(20) PRIMARY KEY,
clinic_name VARCHAR(50),
city VARCHAR(50),
state VARCHAR(50),
country VARCHAR(50)
);

CREATE TABLE customer(
uid VARCHAR(20) PRIMARY KEY,
name VARCHAR(50),
mobile VARCHAR(15)
);

CREATE TABLE clinic_sales(
oid VARCHAR(20) PRIMARY KEY,
uid VARCHAR(20),
cid VARCHAR(20),
amount INT,
datetime DATETIME,
sales_channel VARCHAR(30)
);

CREATE TABLE expenses(
eid VARCHAR(20) PRIMARY KEY,
cid VARCHAR(20),
description VARCHAR(100),
amount INT,
datetime DATETIME
);

INSERT INTO clinics VALUES
('C1','Apollo Clinic','Chennai','Tamil Nadu','India'),
('C2','City Health','Madurai','Tamil Nadu','India'),
('C3','Metro Care','Bangalore','Karnataka','India'),
('C4','LifeLine','Hyderabad','Telangana','India'),
('C5','Care Plus','Mumbai','Maharashtra','India'),
('C6','Green Clinic','Pune','Maharashtra','India'),
('C7','Sunrise Clinic','Delhi','Delhi','India'),
('C8','Hope Clinic','Kolkata','West Bengal','India'),
('C9','Health First','Coimbatore','Tamil Nadu','India'),
('C10','Wellness Center','Trichy','Tamil Nadu','India');

INSERT INTO customer VALUES
('U1','Arun','9876543210'),
('U2','Rahul','9876543211'),
('U3','Meena','9876543212'),
('U4','Priya','9876543213'),
('U5','Karthik','9876543214'),
('U6','Divya','9876543215'),
('U7','Ajay','9876543216'),
('U8','Sneha','9876543217'),
('U9','Vijay','9876543218'),
('U10','Anita','9876543219');

INSERT INTO clinic_sales VALUES
('O1','U1','C1',5000,'2021-01-10 10:00:00','online'),
('O2','U2','C2',3000,'2021-02-12 11:00:00','offline'),
('O3','U3','C3',7000,'2021-03-15 12:00:00','app'),
('O4','U4','C4',6500,'2021-04-20 13:00:00','online'),
('O5','U5','C5',8000,'2021-05-05 14:00:00','offline'),
('O6','U6','C6',2000,'2021-06-11 15:00:00','app'),
('O7','U7','C7',4500,'2021-07-18 16:00:00','online'),
('O8','U8','C8',9000,'2021-08-22 17:00:00','offline'),
('O9','U9','C9',5500,'2021-09-09 18:00:00','app'),
('O10','U10','C10',7500,'2021-10-30 19:00:00','online');

INSERT INTO expenses VALUES
('E1','C1','Medical supplies',1000,'2021-01-11'),
('E2','C2','Equipment maintenance',800,'2021-02-13'),
('E3','C3','Staff salary',2500,'2021-03-16'),
('E4','C4','Electricity bill',1200,'2021-04-21'),
('E5','C5','Medical supplies',1500,'2021-05-06'),
('E6','C6','Cleaning',600,'2021-06-12'),
('E7','C7','Internet',400,'2021-07-19'),
('E8','C8','Equipment repair',1800,'2021-08-23'),
('E9','C9','Medical supplies',900,'2021-09-10'),
('E10','C10','Maintenance',1100,'2021-10-31');