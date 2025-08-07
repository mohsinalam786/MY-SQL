use aaft;

create table sales(
SaleID int not null primary key,
ProductID int not null,
CustomerID int not null,
SaleDate date not null,
Quantity int not null,
UnitPrice int not null,
Region varchar(20) not null
);

insert into sales(SaleID,ProductID,CustomerID,SaleDate,Quantity,UnitPrice,Region) values(1,101,1001,"2024-01-05",5,200,"north"),
(2,102,1002,"2024-01-10",10,150,"east"),(3,103,1003,"2024-02-15",2,300,"north"),(4,104,1001,"2024-02-20",7,250,"west"),
(5,101,1004,"2024-03-05",1,200,"east");

#1.Write a query to calculate the total sales (Quantity * UnitPrice) for each product.
select ProductID,(Quantity*UnitPrice)as total_sales from Sales;

#2.	Write a query to find the total number of products sold in each region.
select Region, SUM(Quantity) AS TotalProductsSold from Sales GROUP BY Region;

#3.	Write a query to get the average sales amount per product. 
select ProductID, avg(UnitPrice) as average_sales_amount from Sales group by ProductID;

#4.Find the regions where total sales are more than 3000.
select Region from Sales where (Quantity*UnitPrice)> 3000;

#5.	Write a query to get the maximum quantity sold for each product.
select ProductID,sum(Quantity) as total_quan from Sales group by ProductID;

#6.	Write a query to calculate the average quantity of products sold per region.
select SaleID,Region,ProductID,avg(Quantity)as average_product_sold from Sales group by SaleID,Region,ProductID;

#7.	Find the product IDs that have generated a total sales amount of more than 1000.
select ProductID,sum(Quantity*UnitPrice) as total_sale from sales group by ProductID having total_sale>1000;

#8.	Write a query to get the total number of sales (rows) made for each customer.
 select CustomerID, count(SaleID) AS total_sales from Sales group by CustomerID;
 
#9.	Find the products for which the average quantity sold is less than 5.
select ProductID,avg(Quantity) as avg_quantity_sold from Sales  group by ProductID having avg(Quantity)<5;

#10.Write a query to find the sum of total sales for each customer in each region.
select CustomerID,Region,sum(Quantity*UnitPrice)as total_sales from Sales group by CustomerID,Region;

#11.Write a query to calculate the total sales for each month. 
select DATE_FORMAT(SaleDate, "%Y-%m") as month, SUM(Quantity*UnitPrice) AS total_sales from sales group by DATE_FORMAT(SaleDate, "%Y-%m") order by month;

#12.Find the regions where the average unit price is more than 200. 
select Region,avg(UnitPrice) as average_unit_price from Sales group by Region having avg(UnitPrice)>200;

#13.Write a query to get the minimum and maximum quantity sold per region. 
select Region,max(Quantity) as max_quantity,min(Quantity)as min_quantity from Sales group by Region;

#14.Find the customers who have made more than 2 purchases.
select CustomerID,count(ProductID)as purchases from Sales group by CustomerID;

#15.Write a query to find the total sales for each product and filter only those products where the total sales exceed 1500.
select ProductID,(Quantity*UnitPrice)as total_sales from Sales where (Quantity*UnitPrice)>1500;









