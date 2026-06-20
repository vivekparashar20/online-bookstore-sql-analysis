-- Create Database
CREATE DATABASE online_bookstore;

-- Switch to the database (Note: Run the below command in psql only. In pgAdmin, open a new query tool on the new database)
-- \c OnlineBookstore;

-- Create Tables
DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);

DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);

-- Select Data
SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

-- Import Data into Books Table
COPY Books(Book_ID, Title, Author, Genre, Published_Year, Price, Stock)
FROM 'C:\sql\excel files\Books.csv'
CSV HEADER;

-- Import Data into Customers Table
COPY Customers(Customer_ID, Name, Email, Phone, City, Country)
FROM 'C:\sql\excel files\Customers.csv'
CSV HEADER;

-- Import Data into Orders Table
COPY Orders(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount)
FROM 'C:\sql\excel files\Orders.csv'
CSV HEADER;



-- retrieve all book in the "Fiction" genre:

select * from Books 
where genre = 'Fiction';




--find books published after the year 1950:

select * from Books 
where published_year > 1950;





--list all customers from canada:

select * from Customers
where country = 'Canada';





--show orders placed in nov 2023:

select * from Orders 
where order_date between '2023-11-01' and '2023-11-30';




--retrieve the total stocks of books available

select sum(stock) as Total_books_stock
from Books; 





--find the details of most expensive book

select * from books order by price desc limit 1 ;





-- show all customers who ordered more than 1 quantity of book

select * from orders where quantity > 1;




--list all genre available in the book table

select distinct genre from books;


--find the books with lowest stock

select * from Books order by stock limit 1;




-- calculate the total revenue generated from all orders :

select sum(total_amount) as total_revenue from Orders;






-- ADVANCE QUESTIONS




-- retrieve the total no. of books from each genre :

select b.Genre, sum(o.Quantity) as total_books_sold from Books b join Orders o on b.book_id = o.book_id group by b.genre;




-- find the avg price of books in the 'fantasy' genre :

select avg(price) as avg_price from Books where genre = 'Fantasy';





-- list all customers who have placed atleast 2 orders :

select o.customer_id, c.name, count(o.order_id) as order_count
from Orders o
join Customers c on o.customer_id = c.customer_id
group by o.customer_id, c.name
having count(order_id) >= 2;






--find out the most frequently ordered book :

select o.book_id, b.title, count(o.order_id) as order_count
from Orders o join Books b on o.book_id = b.book_id
group by o.book_id, b.title
order by count(order_id) desc limit(1);




-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :

SELECT * FROM books
WHERE genre ='Fantasy'
ORDER BY price DESC LIMIT 3;






-- 6) Retrieve the total quantity of books sold by each author:

SELECT b.author, SUM(o.quantity) AS Total_Books_Sold
FROM orders o
JOIN books b ON o.book_id=b.book_id
GROUP BY b.Author;







-- 7) List the cities where customers who spent over $30 are located:

SELECT DISTINCT c.city, total_amount
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
WHERE o.total_amount > 30;









-- 8) Find the customer who spent the most on orders:

SELECT c.customer_id, c.name, SUM(o.total_amount) AS Total_Spent
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY Total_spent Desc LIMIT 1;








--calculate the stock remaining after fulfilling all orders :

select b.book_id, b.title, b.stock, coalesce(sum(o.quantity),0),
b.stock -  coalesce(sum(o.quantity),0)
from Books b
left join Orders o
on b.book_id = o.book_id
group by b.book_id, b.title
order by  b.book_id;
