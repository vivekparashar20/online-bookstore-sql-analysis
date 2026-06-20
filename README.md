# Online Bookstore Data Analysis (SQL)

## Project Overview
This project demonstrates a complete end-to-end data analysis workflow using PostgreSQL. I designed a relational database for a simulated online bookstore, imported raw data from CSV files, and executed a series of analytical queries to extract actionable business insights regarding inventory management, customer behavior, and sales performance.

## Technical Skills Demonstrated
* **Database Management:** DDL (Data Definition Language) to create schemas and define primary/foreign key relationships.
* **Data Ingestion:** Utilizing the `COPY` command to bulk-import data from flat files.
* **Advanced Querying:** Multi-table `JOIN` operations, subqueries, and common table expressions.
* **Data Aggregation:** Utilizing `GROUP BY`, `HAVING`, and aggregate functions (`SUM`, `AVG`, `COUNT`) to calculate revenue and sales volume.
* **Data Cleaning & Transformation:** Using `COALESCE` to handle `NULL` values during inventory calculations.

## Key Business Questions Answered
1. **Revenue Tracking:** What is the total revenue generated across all orders?
2. **Customer Segmentation:** Who are the most valuable customers based on total spending, and which cities are driving high-ticket orders (over $30)?
3. **Inventory Management:** What is the current stock level for each book after accounting for fulfilled orders, and which books require immediate restocking?
4. **Product Performance:** Which genres drive the most volume, and who are the top-performing authors based on total books sold?

## Repository Contents
* `bookstore_analysis.sql`: Contains all database creation, data import, and analysis queries.
* `Books.csv`, `Customers.csv`, `Orders.csv`: The datasets used for this analysis.

## How to Run This Project
1. Open pgAdmin 4 or your preferred PostgreSQL client.
2. Execute the DDL statements in the `.sql` file to create the database and tables.
3. Update the file paths in the `COPY` statements to match your local directory.
4. Run the analytical queries to view the insights.
