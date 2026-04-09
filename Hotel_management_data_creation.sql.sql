CREATE TABLE users(
user_id VARCHAR(20) PRIMARY KEY,
name VARCHAR(50),
phone_number VARCHAR(15),
mail_id VARCHAR(50),
billing_address VARCHAR(100)
);

CREATE TABLE bookings(
booking_id VARCHAR(20) PRIMARY KEY,
booking_date DATETIME,
room_no VARCHAR(20),
user_id VARCHAR(20)
);

CREATE TABLE items(
item_id VARCHAR(20) PRIMARY KEY,
item_name VARCHAR(50),
item_rate INT
);

CREATE TABLE booking_commercials(
id VARCHAR(20) PRIMARY KEY,
booking_id VARCHAR(20),
bill_id VARCHAR(20),
bill_date DATETIME,
item_id VARCHAR(20),
item_quantity INT
);

INSERT INTO users VALUES
('U1','John','9876543210','john@mail.com','Chennai'),
('U2','Arun','9876543211','arun@mail.com','Madurai'),
('U3','Rahul','9876543212','rahul@mail.com','Delhi'),
('U4','Priya','9876543213','priya@mail.com','Mumbai'),
('U5','Meena','9876543214','meena@mail.com','Bangalore'),
('U6','Karthik','9876543215','karthik@mail.com','Chennai'),
('U7','Divya','9876543216','divya@mail.com','Hyderabad'),
('U8','Ajay','9876543217','ajay@mail.com','Pune'),
('U9','Sneha','9876543218','sneha@mail.com','Kolkata'),
('U10','Vijay','9876543219','vijay@mail.com','Coimbatore');

INSERT INTO bookings VALUES
('B1','2021-10-05 10:00:00','R101','U1'),
('B2','2021-10-10 11:00:00','R102','U2'),
('B3','2021-11-12 09:00:00','R103','U3'),
('B4','2021-11-15 14:00:00','R104','U4'),
('B5','2021-11-20 18:00:00','R105','U5'),
('B6','2021-12-01 12:00:00','R106','U6'),
('B7','2021-12-02 13:00:00','R107','U7'),
('B8','2021-09-15 15:00:00','R108','U8'),
('B9','2021-09-20 17:00:00','R109','U9'),
('B10','2021-11-25 16:00:00','R110','U10');

INSERT INTO items VALUES
('I1','Paratha',20),
('I2','Fried Rice',80),
('I3','Veg Curry',90),
('I4','Paneer Butter',120),
('I5','Tea',15),
('I6','Coffee',20),
('I7','Sandwich',50),
('I8','Juice',40),
('I9','Noodles',70),
('I10','Pizza',150);

INSERT INTO booking_commercials VALUES
('C1','B1','BL1','2021-10-05','I1',3),
('C2','B2','BL2','2021-10-10','I3',2),
('C3','B3','BL3','2021-11-12','I2',4),
('C4','B4','BL4','2021-11-15','I4',2),
('C5','B5','BL5','2021-11-20','I5',10),
('C6','B6','BL6','2021-12-01','I6',5),
('C7','B7','BL7','2021-12-02','I7',3),
('C8','B8','BL8','2021-09-15','I8',6),
('C9','B9','BL9','2021-09-20','I9',2),
('C10','B10','BL10','2021-11-25','I10',1);

