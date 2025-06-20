create database assignment44;
use assignment44;
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT not null,
    CustomerID INT not null,
    SaleDate DATE,
    Quantity INT not null,
    UnitPrice int not null,
    Region VARCHAR(20)
);

iNSERT into Sales values(1, 101, 1001, '2024-01-05', 5, 200, 'North');
insert into Sales values(2, 102, 1002, '2024-01-10', 10, 150, 'East');
insert into Sales values(3, 103, 1003, '2024-02-15', 2, 300, 'North');
insert into Sales values(4, 104, 1001, '2024-02-20', 7, 250, 'West');
insert into Sales values(5,101,1004,'2024-03-05',1,200,'east');
#1. Write a query to calculate the total sales (Quantity * UnitPrice) for each product.
select SUM(Quantity*UnitPrice) AS totalSales from sales;

#2. Write a query to find the total number of products sold in each region.
select Region,sum(Quantity) as totalprocuctsale from Sales group by Region;

#3. Write a query to get the average sales amount per product.
select ProductID,avg(Quantity*UnitPrice) as averagesalesamount from Sales group by  ProductID;

#4. Find the regions where total sales are more than 3000.
SELECT Region,SUM(Quantity * UnitPrice) AS TotalSales FROM Sales GROUP BY Region HAVING SUM(Quantity * UnitPrice)>3000;

#5. Write a query to get the maximum quantity sold for each product.
select ProductID, max(Quantity) as maxquantity from Sales group by ProductID;

#6. Write a query to calculate the average quantity of products sold per region.
select ProductID, avg(Quantity) as maxquantity from Sales group by ProductID;


#7. Find the product IDs that have generated a total sales amount of more than 1000.
select ProductID, sum(Quantity*UnitPrice) as totalsales from Sales group by ProductID having sum(Quantity*UnitPrice)>1000;

#8. Write a query to get the total number of sales (rows) made for each customer.
select CustomerID, count(*) as totalsalerows from Sales group by CustomerID;

#9. Find the products for which the average quantity sold is less than 5.
select ProductID, avg(Quantity) As averagequantity from Sales group by ProductID having avg(Quantity)<5;

#10. Write a query to find the sum of total sales for each customer in each region.
select CustomerID,Region, sum(Quantity * UnitPrice) as totalsales from Sales group by CustomerID, Region;

#11. Write a query to calculate the total sales for each month.
sELECT DATE_FORMAT(SaleDate, '%Y-%m') AS SaleMonth,SUM(Quantity * UnitPrice) AS TotalSales FROM Sales GROUP BY DATE_FORMAT(SaleDate, '%Y-%m') ORDER BY SaleMonth;

#12. Find the regions where the average unit price is more than 200.
select Region, avg(UnitPrice) as avregeunitprice from Sales group by Region having avg(UnitPrice)>200;

#13. Write a query to get the minimum and maximum quantity sold per region.
sELECT Region,MIN(Quantity) AS MinQuantitySold,MAX(Quantity) AS MaxQuantitySold FROM Sales group by Region;

