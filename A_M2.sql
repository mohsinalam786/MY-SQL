 create database library1;
 use library1;
 create table books(
 id int not null primary key auto_increment,
 title varchar(255) not null,
 author varchar(100) not null,
 year varchar(20) not null,
 genre varchar(100) not null
 );
 insert into  books values(1,"The Great Gatsby", "F. Scott Fitzgerald", "1925", "Fiction");
 insert into  books values(2,"pride and prejudice","jane austen","1813","romance");
 insert into  books values(3,"To Kill a Mockingbird", "Harper Lee", "1960", "Fiction");
insert into  books values(4,"1984", "George Orwell", "1949", "Dystopian");
insert into  books values(5,"Moby Dick", "Herman Melville", 1851, "Adventure");
  #1.Write a query to select all books where the title starts with the letter 'T' using the LIKE operator.
SELECT * FROM books WHERE title LIKE 'T%';
#2Write a query to find all books where the author's last name ends with 'son' using the LIKE operator.
SELECT * FROM books WHERE author LIKE '%son';
#3Write a query to find all books where the title contains the word 'and' using the LIKE operator.
SELECT *FROM books WHERE title LIKE '% and %';
#4Write a query to find all books where the title has exactly 3 characters using the REGEXP operator.
SELECT *FROM books WHERE title REGEXP '^.{3}$';
#5Write a query to select all books where the title contains a number using the REGEXP operator
SELECT * FROM books WHERE title REGEXP '[0-9]';
#5Write a query to retrieve all books where the author's name starts with any letter between 'A' and 'J' 
SELECT *FROM books WHERE author>= 'A' AND author < 'j';
#6Write a query to select all books where the genre is either 'Fiction' or 'Adventure' using the REGEXP operator
SELECT *FROM books WHERE genre REGEXP '^(Fiction|Adventure)$';
#7Write a query to find all books where the title contains at least one uppercase letter using the REGEXP operator.
SELECT *FROM books WHERE title REGEXP '[A-Z]';
#8Write a query to find all books where the year of publication is between 1800 and 1950 using the LIKE operator.
SELECT *FROM books WHERE year LIKE '18%' OR year LIKE '19[0-4]%' OR year LIKE '1950';
#9Write a query to find all books where the year of publication is between 1800 and 1950 using the LIKE operator.
SELECT *FROM books WHERE author REGEXP '^[A-Za-z]+ [A-Za-z]+$';
#10Write a query to find all books where the title starts with the letter 'P' and contains exactly two words using the REGEXP operator.
SELECT * FROM books WHERE title REGEXP '^P[a-zA-Z]* [a-zA-Z]+$';
SELECT *
FROM books
WHERE title REGEXP '[^a-zA-Z0-9 ]';









