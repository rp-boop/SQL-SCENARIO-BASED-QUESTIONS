create database Q1
Use Q1

SELECT*FROM customers
select * from products
select*from orders
select*from orderdetails

--/-Questions 
-- Joins
--1.	Write a query to retrieve the order details along with the customer names for all orders.
select *from customers
select*from orders
select C.firstName,o.orderDate,o.Orderstatus,o.shippingaddress ,o.totalAmount from customers C right join orders o 
on c.customerid=o.customerid

--show full name 
select CONCAT(C.firstName,'   ',c.lastname)[full name],o.orderDate,o.Orderstatus,o.shippingaddress ,o.totalAmount from customers C right join orders o 
on c.customerid=o.customerid


---2.	Write a query to list all customers and their orders, including customers who have not placed any orders.
select*from customers
select*from orders
select*from customers C full join orders O on c.customerid=o.customerid 
where o.orderstatus='processing'

---3.	Write a query to list all orders and their corresponding customer details, including orders that do not have customer information.
select *from orders o left join customers c on c.customerid=c.customerid

---4.	Write a query to list all customers and orders, including those customers who have not placed any orders and orders that do not have customer information.
select* from Customers
select * from orders 
SELECT * FROM OrderDetails
select*from customers C full join orders o on c.CustomerID=o.CustomerID 
order by c.CustomerID,o.OrderID
---5.	Write a query to generate a cartesian product of all customers and products.
    select*from customers
    select*from products 
   select c.FirstName,p.productname from Customers c INNER JOIN Orders O ON c.CustomerID= O.CustomerID
INNER JOIN Products P ON O.=C.CustomerID

--aggregate functions---
   --1.	Write a query to find the total number of orders placed
   select*from Orders
   select count(*) as total_orders from Orders
---2.	Write a query to find the average total amount of all orders.
    select AVG(totalAmount) as total_amount from Orders
---3.	Write a query to find the maximum price of products.
    select MAX(price) as maximum_price from Products
---4.	Write a query to find the sum of all quantities ordered in the OrderDetails table.
    select SUM(Quantity) as quantities from OrderDetails
---5.	Write a query to find the minimum stock quantity of products.
     select MIN(stockquantity) as stock_quantity from Products


	----Logical operators---

---1.	Write a query to find all orders where the total amount is greater than 100 and the order status is ‘Shipped’
   select*from Orders
   where TotalAmount>100 and
   OrderStatus='shipped'

---2.	Write a query to find all products that are either in the ‘Electronics’ category or have a stock quantity greater than 100.
   select*from Products
   where Category='electronics' and 
   StockQuantity>100

---3.	Write a query to find all customers who have registered in 2023 and have ‘example.com’ in their email
select * from Customers
select CONCAT(FirstName+' ',LastName) from Customers where YEAR(RegistrationDate)='2023'
and Email like '%example.com%'

---4.	Write a query to find all orders that are not ‘Delivered’ and have a total amount less than 200
    select*from Orders
	where OrderStatus<>'delivered'and
	TotalAmount<200

---5.	Write a query to find all products that are not in the ‘Furniture’ category and have a warranty period of more than 12 months.
    select*from Products
	where Category='furniture'and
	WarrantyPeriod>12


	--String functions---

---1.	Write a query to concatenate the first name and last name of customers.
   select CONCAT(firstname,'  ',lastname)as full_name from Customers

----2.	Write a query to find the length of the product names.
    select productname, LEN(productname) as product_name from Products

---3.	Write a query to convert the product names to uppercase.
    select productname,UPPER(productname) as product_name from Products

---4.	Write a query to extract the domain from the email addresses of customers.
select CONCAT(firstname,'  ',lastname)as full_name,Email from Customers

----5.	Write a query to replace ‘Street’ with ‘St.’ in the addresses of customers
    select address,REPLACE(address,'street','st.') as updated_address from Customers`


---1.	Write a query to calculate the running total of order amounts for each customer.
select SUM(stockquantity)over (order by  productname)from products


   ---- Arithmetic Operators----

---1.	Write a query to calculate the total price for each order detail (Quantity * Price).
Select orderid,sum(quantity*price) as total_price from OrderDetails group by OrderID

---2.	Write a query to find the discounted price for each product in the OrderDetails table (Price - Discount).
select orderid,productid,price,discount,(price-discount) as discounted_price from OrderDetails

---3.	Write a query to calculate the total amount after applying a 10% discount on each order.
select orderid,sum(quantity*price*0.90) as total_amount_after_discount from OrderDetails group by OrderID

---4.	Write a query to find the total stock value for each product (Price * StockQuantity).
select productid,productname,price,stockquantity,(price*stockquantity)as total_stock_value from Products 

---5.	Write a query to calculate the average price per unit for each order detail (Price / Quantity).
select orderid,productid,price,quantity,(price/quantity) as average_price_per_unit from OrderDetails


-----Conditional operator---
----1.	Write a query to categorize orders as ‘High’, ‘Medium’, or ‘Low’ based on the total amount.
select orderid,sum(quantity*price) as total_amount,
case 
      WHEN SUM(Quantity * Price) >= 1000 THEN 'High'
        WHEN SUM(Quantity * Price) BETWEEN 500 AND 999 THEN 'Medium'
        ELSE 'Low'
    END AS OrderCategory
	from OrderDetails
	group by OrderID

----2.	Write a query to assign a discount percentage based on the product category.
SELECT 
    ProductID, 
    ProductName, 
    Category, 
    Price, 
    CASE 
        WHEN Category = 'Electronics' THEN 10
        WHEN Category = 'Clothing' THEN 15
        WHEN Category = 'Home Appliances' THEN 5
        ELSE 0
    END AS DiscountPercentage
FROM 
    Products;
----3.	Write a query to label orders as ‘Recent’ or ‘Old’ based on the order date.
SELECT 
    OrderID, 
    OrderDate, 
    CASE 
        WHEN DATEDIFF(CURRENT_DATE, OrderDate) <= 30 THEN 'Recent'
        ELSE 'Old'
    END AS OrderLabel
FROM 
    Orders;

----4.	Write a query to determine the stock status of products based on their stock quantity.
SELECT 
    ProductID, 
    ProductName, 
    StockQuantity, 
    CASE 
        WHEN StockQuantity = 0 THEN 'Out of Stock'
        WHEN StockQuantity <= 10 THEN 'Low Stock'
        ELSE 'In Stock'
    END AS StockStatus
FROM 
    Products;


------- Like, Between, In Operators---

---1.	Write a query to find all customers whose first name starts with ‘J’.
SELECT 
    CustomerID, 
    FirstName, 
    LastName, 
    Email
FROM 
    Customers
WHERE 
    FirstName LIKE 'J%';

----2.	Write a query to find all orders placed between ‘2024-09-01’ and ‘2024-09-10’.
SELECT 
    OrderID, 
    CustomerID, 
    OrderDate, 
    TotalAmount
FROM 
    Orders
WHERE 
    OrderDate BETWEEN '2024-09-01' AND '2024-09-10';

---3.	Write a query to find all products that belong to the ‘Electronics’ or ‘Furniture’ category.
SELECT 
    ProductID, 
    ProductName, 
    Category, 
    Price
FROM 
    Products
WHERE 
    Category IN ('Electronics', 'Furniture');

---4.	Write a query to find all customers who live on ‘Street’ in their address.
SELECT 
    CustomerID, 
    FirstName, 
    LastName, 
    Address
FROM 
    Customers
WHERE 
    Address LIKE '%Street%';

---5.	Write a query to find all orders with a total amount between 50 and 200.
SELECT 
    OrderID, 
    CustomerID, 
    OrderDate, 
    TotalAmount
FROM 
    Orders
WHERE 
    TotalAmount BETWEEN 50 AND 200;


	------Date And Time Functions--
	
---1.	Write a query to extract the year from the order date.
SELECT 
    OrderID, 
    CustomerID, 
    OrderDate, 
    YEAR(OrderDate) AS OrderYear
FROM 
    Orders;

----2.	Write a query to format the order date as ‘DD-MM-YYYY'.

SELECT 
    OrderID, 
    CustomerID, 
	orderdate,
    ( '%d-%m-%Y') AS FormattedOrderDate
FROM 
    Orders;

----3.	Write a query to find all orders placed in the last 30 days.
select*from Orders
SELECT 
    OrderID, 
    CustomerID, 
    OrderDate, 
    TotalAmount
   from 
    Orders
WHERE 
    OrderDate >= DATEADD(DAY, -30, GETDATE())
	



SQL
CREATE TABLE Customers (
CustomerID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(100),
Phone VARCHAR(15),
Address VARCHAR(255),
DateOfBirth DATE,
RegistrationDate DATE)



SQL

CREATE TABLE Products (
ProductID INT PRIMARY KEY,
ProductName VARCHAR(100),
Category VARCHAR(50),
Price DECIMAL(10, 2),
StockQuantity INT,
Supplier VARCHAR(100),
WarrantyPeriod INT)

SQL
CREATE TABLE Orders (
OrderID INT PRIMARY KEY,
CustomerID INT,
OrderDate DATE,
TotalAmount DECIMAL(10, 2),
ShippingAddress VARCHAR(255),
OrderStatus VARCHAR(50),
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID))



SQL
CREATE TABLE OrderDetails (
OrderDetailID INT PRIMARY KEY,
OrderID INT,
ProductID INT,
Quantity INT,
Price DECIMAL(10, 2),
Discount DECIMAL(5, 2),
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
FOREIGN KEY (ProductID) REFERENCES Products(ProductID))


INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address, DateOfBirth, RegistrationDate) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '1234567890', '123 Elm Street', '1985-01-15', '2023-01-01'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '0987654321', '456 Oak Avenue', '1990-02-20', '2023-02-01'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', '5551234567', '789 Pine Road', '1988-03-25', '2023-03-01'),
(4, 'Bob', 'Brown', 'bob.brown@example.com', '5559876543', '321 Maple Lane', '1975-04-30', '2023-04-01'),
(5, 'Charlie', 'Davis', 'charlie.davis@example.com', '5556781234', '654 Cedar Street', '1995-05-05', '2023-05-01'),
(6, 'Diana', 'Evans', 'diana.evans@example.com', '5554321987', '987 Birch Boulevard', '1982-06-10', '2023-06-01'),
(7, 'Eve', 'Foster', 'eve.foster@example.com', '5553219876', '159 Spruce Drive', '1993-07-15', '2023-07-01'),
(8, 'Frank', 'Green', 'frank.green@example.com', '5556543210', '753 Willow Way', '1987-08-20', '2023-08-01'),
(9, 'Grace', 'Harris', 'grace.harris@example.com', '5557896543', '852 Fir Avenue', '1991-09-25', '2023-09-01'),
(10, 'Hank', 'Ivy', 'hank.ivy@example.com', '5551230987', '951 Pinecone Path', '1984-10-30', '2023-10-01'),
(11, 'Ivy', 'Jones', 'ivy.jones@example.com', '5554567890', '147 Oakwood Court', '1992-11-05', '2023-11-01'),
(12, 'Jack', 'King', 'jack.king@example.com', '5557891234', '258 Redwood Road', '1989-12-10', '2023-12-01'),
(13, 'Karen', 'Lewis', 'karen.lewis@example.com', '5553216549', '369 Cypress Circle', '1986-01-15', '2024-01-01'),
(14, 'Leo', 'Morris', 'leo.morris@example.com', '5556549871', '741 Aspen Alley', '1994-02-20', '2024-02-01'),
(15, 'Mia', 'Nelson', 'mia.nelson@example.com', '5559873214', '852 Maplewood Lane', '1990-03-25', '2024-03-01'),
(16, 'Nina', 'Owens', 'nina.owens@example.com', '5551234567', '963 Birchwood Drive', '1988-04-30', '2024-04-01'),
(17, 'Oscar', 'Parker', 'oscar.parker@example.com', '5557896543', '147 Pinehurst Street', '1985-05-05', '2024-05-01'),
(18, 'Paul', 'Quinn', 'paul.quinn@example.com', '5554561230', '258 Cedarwood Avenue', '1993-06-10', '2024-06-01'),
(19, 'Quincy', 'Reed', 'quincy.reed@example.com', '5553217896', '369 Sprucewood Boulevard', '1987-07-15', '2024-07-01'),
(20, 'Rachel', 'Smith', 'rachel.smith@example.com', '5556541239', '741 Willowwood Way', '1991-08-20', '2024-08-01');

INSERT INTO Products (ProductID, ProductName, Category, Price, StockQuantity, Supplier, WarrantyPeriod) VALUES
(1, 'Laptop', 'Electronics', 999.99, 50, 'TechSupplier Inc.', 24),
(2, 'Smartphone', 'Electronics', 499.99, 100, 'MobileWorld Ltd.', 12),
(3, 'Desk Chair', 'Furniture', 89.99, 200, 'FurnitureCo', 36),
(4, 'Monitor', 'Electronics', 199.99, 75, 'DisplayTech', 24),
(5, 'Keyboard', 'Electronics', 49.99, 150, 'KeyMasters', 12),
(6, 'Mouse', 'Electronics', 29.99, 180, 'MouseHouse', 12),
(7, 'Printer', 'Electronics', 149.99, 60, 'PrintWorks', 24),
(8, 'Desk', 'Furniture', 129.99, 80, 'OfficeFurnishings', 36),
(9, 'Bookshelf', 'Furniture', 79.99, 90, 'ShelfMakers', 36),
(10, 'Headphones', 'Electronics', 99.99, 120, 'SoundWave', 12),
(11, 'Webcam', 'Electronics', 59.99, 110, 'CamTech', 12),
(12, 'Tablet', 'Electronics', 299.99, 70, 'GadgetWorld', 12),
(13, 'Smartwatch', 'Electronics', 199.99, 85, 'TimeTech', 12),
(14, 'Router', 'Electronics', 89.99, 95, 'NetConnect', 24),
(15, 'External Hard Drive', 'Electronics', 79.99, 130, 'StorageSolutions', 24),
(16, 'USB Flash Drive', 'Electronics', 19.99, 200, 'FlashDriveCo', 12),
(17, 'Office Chair', 'Furniture', 149.99, 50, 'ComfortSeating', 36),
(18, 'Standing Desk', 'Furniture', 299.99, 40, 'ErgoDesks', 36),
(19, 'Gaming Chair', 'Furniture', 199.99, 60, 'GamerGear', 36),
(20, 'Bluetooth Speaker', 'Electronics', 49.99, 140, 'SoundBlast', 12);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount, ShippingAddress, OrderStatus) VALUES
(1, 1, '2024-09-01', 1089.98, '123 Elm Street', 'Shipped'),
(2, 2, '2024-09-02', 499.99, '456 Oak Avenue', 'Delivered'),
(3, 3, '2024-09-03', 89.99, '789 Pine Road', 'Processing'),
(4, 4, '2024-09-04', 129.98, '321 Maple Lane', 'Shipped'),
(5, 5, '2024-09-05', 149.99, '654 Cedar Street', 'Delivered'),
(6, 6, '2024-09-06', 199.99, '987 Birch Boulevard', 'Processing'),
(7, 7, '2024-09-07', 299.99, '159 Spruce Drive', 'Shipped'),
(8, 8, '2024-09-08', 79.99, '753 Willow Way', 'Delivered'),
(9, 9, '2024-09-09', 99.99, '852 Fir Avenue', 'Processing'),
(10, 10, '2024-09-10', 59.99, '951 Pinecone Path', 'Shipped'),
(11, 11, '2024-09-11', 299.99, '147 Oakwood Court', 'Delivered'),
(12, 12, '2024-09-12', 199.99, '258 Redwood Road', 'Processing'),
(13, 13, '2024-09-13', 89.99, '369 Cypress Circle', 'Shipped'),
(14, 14, '2024-09-14', 79.99, '741 Aspen Alley', 'Delivered'),
(15, 15, '2024-09-15', 49.99, '852 Maplewood Lane', 'Processing'),
(16, 16, '2024-09-16', 19.99, '963 Birchwood Drive', 'Shipped'),
(17, 17, '2024-09-17', 149.99, '147 Pinehurst Street', 'Delivered'),
(18, 18, '2024-09-18', 299.99, '258 Cedarwood Avenue', 'Processing'),
(19, 19, '2024-09-19', 199.99, '369 Sprucewood Boulevard', 'Shipped'),
(20, 20, '2024-09-20', 49.99, '741 Willowwood Way', 'Delivered');


INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, Price, Discount) VALUES
(1, 1, 1, 1, 999.99, 10.00),
(2, 1, 3, 1, 89.99, 5.00),
(3, 2, 2, 1, 499.99, 0.00),
(4, 3, 3, 1, 89.99, 0.00),
(5, 4, 8, 1, 129.99, 10.00),
(6, 5, 7, 1, 149.99, 0.00),
(7, 6, 4, 1, 199.99, 15.00),
(8, 7, 12, 1, 299.99, 20.00),
(9, 8, 9, 1, 79.99, 5.00),
(10, 9, 10, 1, 99.99, 10.00),
(11, 10, 11, 1, 59.99, 0.00),
(12, 11, 13, 1, 199.99, 15.00),
(13, 11, 14, 1, 89.99, 5.00),
(14, 12, 15, 1, 79.99, 10.00),
(15, 13, 16, 1, 19.99, 0.00),
(16, 14, 17, 1, 149.99, 10.00),
(17, 15, 18, 1, 299.99, 20.00),
(18, 16, 19, 1, 199.99, 15.00),
(19, 17, 20, 1, 49.99, 5.00),
(20, 18, 1, 1, 999.99, 10.00);
