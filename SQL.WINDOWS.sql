create database windows;
use windows;
select new_id, new_cat, sum(new_id) over(partition by new_cat order by new_id) as total from table1;
select new_id, new_cat, avg(new_id) over(partition by new_cat order by new_id) as avrage from table1;
select new_id, new_cat, count(new_id) over(partition by new_cat order by new_id) as count from table1;
select new_id, new_cat, min(new_id) over(partition by new_cat order by new_id) as min from table1;
select new_id, new_cat, max(new_id) over(partition by new_cat order by new_id) as max from table1;

select new_id, row_number() over(order by new_id) as "row_number" from table1; 
select new_id,rank() over(order by new_id) as "rank" from table1;
select new_id,dense_rank() over(order by new_id) as "dense_rank" from table1;
select new_id,percent_rank()over(order by new_id) as "percent_rank" from table1;

select new_id, first_value(new_id) over(order by new_id) as "first_value" from table1;
select new_id, last_value(new_id) over(order by new_id) as "last_value" from table1;
select new_id, lead(new_id) over(order by new_id) as "lead" from table1;
select new_id, lag(new_id) over(order by new_id) as "lag" from table1;
select new_id,row_number() over(order by new_id) as "row_number",rank() over(order by new_id) as "rank",dense_rank() over(order by new_id) as "dense_rank",
percent_rank() over(order by new_id) as "percent_rank"
from table1;
use windows;
CREATE TABLE Sales (
    SaleID INT,
    SaleDate DATE,
    CustomerID INT,
    ProductID INT,
    Amount DECIMAL(10, 2)
);

INSERT INTO Sales (SaleID, SaleDate, CustomerID, ProductID, Amount) VALUES
(1, '2024-01-01', 101, 1001, 150.00),
(2, '2024-01-02', 102, 1002, 200.00),
(3, '2024-01-03', 101, 1001, 100.00),
(4, '2024-01-04', 103, 1003, 300.00),
(5, '2024-01-05', 102, 1002, 250.00),
(6, '2024-01-06', 101, 1001, 175.00),
(7, '2024-01-07', 104, 1004, 400.00),
(8, '2024-01-08', 105, 1005, 350.00),
(9, '2024-01-09', 102, 1002, 225.00),
(10, '2024-01-10', 101, 1001, 125.00);

#1: Calculate the running total of sales amount.
select saleID,Amount,
sum(amount)over(order by saleID) as "total amount" from sales;

select saleID,saleDate,Amount,
sum(amount)over(order by saledate) as "running total" from sales;

#2: Calculate the average sales amount over the last 3 sales.
select saleID,Amount,
avg(amount)over(order by saleID rows 2 preceding) as "avg sales" from sales;

#3: Rank the sales by amount for each customer.
select saleID,customerid,amount,
rank()over(partition by customerid order by amount desc) as "rank sales" from sales;

#5. calculate the difference in sales amount between the current sale and previous sale.
select saleID,amount,avg(amount)over(order by Amount rows between 1 preceding and current row) as "avg" from sales;











