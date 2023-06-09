-- 1. Display all contents of the Clients table --

-- This query selects all (The asterisk or star symbol ( * ) means all columns) from 'Clients' table. I added a auto increment in the 'ClientsID' column which lists the table data in ascending order.
-- I attached MySQL syntax as well:
-- SELECT select_list
-- FROM table_name;

	SELECT *
    FROM Clients;

-- 2. First names, last names, ages and occupations of all clients --

-- This query selects these specific columns: 'ClientFirstName, ClientLastName, ClientDoB, Occupation' from the 'Clients' table to list in the result-set. I used a YEAR() function which returns the year component for a given date and used a NOW() function to return the current date and time. I used that date information to subtract the current year from the Client DOB year which results in the current age of clients listed in the result-set. Used the AS command to rename the column 'ClientDOB' to the 'Age' column.
-- I attached MySQL syntax as well:
-- SELECT column1, column2, column 3 AS alias_name, column 4
-- FROM table_name;

    SELECT ClientFirstName, ClientLastName, (YEAR(NOW())-ClientDOB) AS Age, Occupation
    FROM Clients;

-- 3. First and last names of clients that borrowed books in March 2018 --

-- This query selects these specific columns: 'ClientFirstName' and 'ClientLastName' from the 'Clients' table to list in the result-set. I used a INNER JOIN to select records that help me find the matching values from the 'Clients' table and the selected 'Borrowers' table. I specified which tables and columns I wanted to access using the ON keyword. I used the 'ClientsID' column that the tables both share to finish the INNER JOIN. I used the WHERE clause to filter the records in order to extract only those records in the 'BorrowDate' column that are between the March 1st, 2018 and March 31st, 2018. I used a GROUP BY statement to group the result-set by the 'ClientsID' column from the 'Clients' table. I originally added a auto increment in the 'ClientsID' column which lists the table data in ascending order.
-- I attached MySQL syntax as well:
-- SELECT select_list
-- FROM table1
-- INNER JOIN table2
-- ON table1.column_name = table2.column_name;
-- WHERE search_condition
-- GROUP BY group_by_expression

    SELECT ClientFirstName,ClientLastName
    FROM Clients
    INNER JOIN Borrowers
    ON Clients.ClientID = Borrowers.ClientID
    WHERE BorrowDate BETWEEN '2018-03-01' AND '2018-03-31'
    GROUP BY Clients.ClientID;

-- 4. First and last names of the top 5 authors clients borrowed in 2017 --

-- This command selects these specific columns: 'AuthorFirstName', 'AuthorLastName' from the 'Authors' table to list in the result-set. I used a INNER JOIN to select records that help me find the matching values from the 'Authors' table and the selected 'Books' table. I specified which tables and columns I wanted to access using the ON keyword. I used the 'AuthorsID' column that the tables both share to finish the INNER JOIN. I used a second INNER JOIN to find the matching values from the 'Books' table and the selected 'Borrowers' table. I used the 'BooksID' column that the tables both share to finish the second INNER JOIN. I used the WHERE clause to filter the records in order to extract only those records in the 'BorrowDate' column that are between the January 1st, 2017 and December 31st, 2017. I used a GROUP BY statement to group the result-set by the 'BookID' column. I then used the ORDER BY keyword and the the COUNT() function to count how many times the number of books in the result-set was borrowed in the "Borrowed" table. I sorted the result-set in descending order (Included the DESC keyword) and used a LIMIT clause to specify the number of records to return, I used 5 to result in the top 5 authors.
-- I attached MySQL syntax as well:
-- SELECT column_name(s)
-- FROM table1
-- INNER JOIN table2
-- ON table1.column_name = table2.column_name;
-- INNER JOIN table2
-- ON table1.column_name = table2.column_name;
-- WHERE condition
-- GROUP BY column_name(s)
-- ORDER BY column_name COUNT(column_name) ASC|DESC LIMIT number;

    SELECT AuthorFirstName, AuthorLastName
    FROM Authors
    INNER JOIN Books
    ON Authors.AuthorID = Books.AuthorID
    INNER JOIN Borrowers
    ON Borrowers.BookID = Books.BookID
    WHERE BorrowDate BETWEEN '2017-01-01' AND '2017-12-31'
    GROUP BY Borrowers.BookID
    ORDER BY COUNT(Borrowers.BookID) DESC LIMIT 5;

-- 5. Nationalities of the least 5 authors that clients borrowed during the years 2015-2017 --

-- This query selects this specific column: 'AuthorNationality' from the 'Authors' table to list in the result-set. I used a INNER JOIN to select records that help me find the matching values from the 'Authors' table and the selected 'Books' table. I specified which tables and columns I wanted to access using the ON keyword. I used the 'AuthorsID' column that the tables both share to finish the INNER JOIN. I used a second INNER JOIN to find the matching values from the 'Books' table and the selected 'Borrowers' table. I used the 'BooksID' column that the tables both share to finish the second INNER JOIN. I used the WHERE clause to filter the records in order to extract only those records in the 'BorrowDate' column that are between the January 1st, 2015 and December 31st, 2017. I used a GROUP BY statement to group the result-set by the 'AuthorNationality' column. I then used the ORDER BY keyword and the The COUNT() function to count how many times the number of books in the result-set was borrowed in the "Borrowed" table. I originally added a auto increment in the Book ID column which lists the table data in ascending order. I sorted the result-set and used a LIMIT clause to specify the number of records to return, I used 5 to list the least 5 nationalities in the result-set.
-- I attached MySQL syntax as well:
-- SELECT select_list
-- FROM table1
-- INNER JOIN table2
-- ON table1.column_name = table2.column_name;
-- INNER JOIN table2
-- ON table1.column_name = table2.column_name;
-- WHERE condition
-- GROUP BY group_by_expression
-- ORDER BY column_name COUNT(column_name) ASC|DESC LIMIT number;

    SELECT AuthorNationality
    FROM Authors
    INNER JOIN Books
    ON Authors.AuthorID = Books.AuthorID
    INNER JOIN Borrowers
    ON Books.BookID = Borrowers.BookID
    WHERE BorrowDate BETWEEN '2015-01-01' AND '2017-12-31'
    GROUP BY AuthorNationality
    ORDER BY COUNT(Borrowers.BookID) LIMIT 5;

-- 6. The book that was most borrowed during the years 2015-2017 --

-- This query selects this specific column: 'AuthorNationality' from the 'Books' table to list in the result-set. I used a INNER JOIN to select records that help me find the matching values from the 'Books' table and the selected 'Borrowers' table. I specified which tables and columns I wanted to access using the ON keyword. I used the 'BookID' column that the tables both share to finish the INNER JOIN. I used the WHERE clause to filter the records in order to extract only those records in the 'BorrowDate' column that are between the January 1st, 2015 and December 31st, 2017. I used a GROUP BY statement to group the result-set by the 'BookID' column. I then used the ORDER BY keyword and the The COUNT() function to count how many times the number of books in the result-set was borrowed in the "Borrowed" table. I sorted the result-set in descending order (Included the DESC keyword) and used a LIMIT clause to specify the number of records to return, I used 1 to result in the book that was the most borrowed thoughout 2015-2017.
-- I attached MySQL syntax as well:
-- SELECT select_list
-- FROM table1
-- INNER JOIN table2
-- ON table1.column_name = table2.column_name;
-- WHERE group_by_expression
-- GROUP BY column_name(s)
-- ORDER BY COUNT(column_name) ASC|DESC LIMIT number;

SELECT BookTitle
FROM Books
INNER JOIN Borrowers
ON Books.BookID = Borrowers.BookID
WHERE BorrowDate BETWEEN '2015-01-01' AND '2017-12-31'
GROUP BY Borrowers.BookID
ORDER BY COUNT(Borrowers.BookID) DESC LIMIT 1;


-- 7. Top borrowed genres for client born in years 1970-1980 --

-- This query selects this specific column: 'Genre' column from the 'Books' table to list in the result-set. I used a INNER JOIN to select records that help me find the matching values from the 'Books' table and the selected 'Borrowers' table. I specified which tables and columns I wanted to access using the ON keyword. I used the 'BookID' column that the tables both share to finish the INNER JOIN. I used a second INNER JOIN to find the matching values from the 'Borrowers' table and the selected 'Clients' table. I used the 'ClientID' column that the tables both share to finish the second INNER JOIN. I used the WHERE clause to filter the records in order to extract only those records in the 'ClientDOB' column that are between the years 1970 and 1980. I used a GROUP BY statement to group the result-set by the 'Genre' column, I then used the ORDER BY keyword to list the result set of the top borrowed genres in Ascending order.
-- I attached MySQL syntax as well:
-- SELECT select_list
-- FROM table1
-- INNER JOIN table2
-- ON table1.column_name = table2.column_name;
-- INNER JOIN table2
-- ON table1.column_name = table2.column_name;
-- WHERE search_condition
-- GROUP BY group_by_expression
-- ORDER BY column_name ASC|DESC;

SELECT Genre
FROM Books
INNER JOIN Borrowers
ON Books.BookID = Borrowers.BookID
INNER JOIN Clients
ON Borrowers.ClientID = Clients.ClientID
WHERE ClientDOB BETWEEN 1970 AND 1980
GROUP BY Genre
ORDER BY Books.Genre;


-- 8. Top 5 occupations that borrowed the most in 2016 --

-- This query selects this specific column: 'Occupation' from the 'Clients' table to list in the result-set. I used a INNER JOIN to select records that help me find the matching values from the 'Clients' table and the selected 'Borrowers' table. I specified which tables and columns I wanted to access using the ON keyword. I used the 'ClientID' column that the tables both share to finish the INNER JOIN. I used the WHERE clause to filter the records in order to extract only those records in the 'BorrowDate' column. I used a YEAR() function with the variable inside the function being the BorrowDate and I set that equal to the year '2016'. I used a GROUP BY statement to group the result-set by the 'Occupation' column. I then used the ORDER BY keyword and the COUNT() function to count how many times a client borrows a book. I sorted the result-set in descending order (Included the DESC keyword) and used a LIMIT clause to specify the number of records to return, I used 5 to result in the occupations that borrowed the most books thoughout year 2016.
-- I attached MySQL syntax as well:
-- SELECT select_list
-- FROM table1
-- INNER JOIN table2
-- ON table1.column_name = table2.column_name;
-- WHERE search_condition
-- GROUP BY group_by_expression
-- ORDER BY COUNT(column_name) ASC|DESC LIMIT number;

SELECT Occupation
FROM Clients
INNER JOIN Borrowers
ON Clients.ClientID = Borrowers.ClientID
WHERE YEAR(BorrowDate) = 2016
GROUP BY Occupation
ORDER BY COUNT(Borrowers.ClientID) DESC LIMIT 5;


-- 9. Average number of borrowed books by job title -- 

-- This query selects this specific column: 'Occupation' from the 'Clients' table to list in the result-set. Using the COUNT() function I counted how many clients worked that occupation(accessing their Occupation column). I then divided and used the COUNT function again, alongside the DISTINCT clause to make sure I only count the different (distinct values), of how many books were borrowed by these people (accessing their ClientID) who worked those occupations and rounded the resulting value. Used the AS command to rename the column to a different alias name "Average_Number_Borrowed". I used a INNER JOIN to selects records that help me find the matching values from the 'Clients' table and the selected 'Borrowers' table. I specified which tables and columns I wanted to access using the ON keyword. I used the 'ClientID' column that the tables both share to finish the INNER JOIN. I used a GROUP BY statement to group the result-set by the 'Occupation' column. 
-- I attached MySQL syntax as well:
-- SELECT column_name, ROUND(COUNT(column_name)) / COUNT(DISTINCT column_name)) AS alias_name
-- FROM table1
-- INNER JOIN table2
-- ON table1.column_name = table2.column_name;
-- GROUP BY group_by_expression

SELECT Clients.Occupation, ROUND(COUNT(Clients.Occupation) / COUNT(DISTINCT Borrowers.ClientID)) AS Average_Number_Borrowed
FROM Clients
INNER JOIN Borrowers
ON Clients.ClientID = Borrowers.ClientID
GROUP BY Clients.Occupation;

-- 10. Create a VIEW and display the titles that were borrowed by at least 20% of clients --

-- Creating a view in SQL allows the user to easily find relevant information in large datasets. I created a view with the CREATE VIEW statement and gave it the name 'books borrowed by 20% of the clients' to preserve the importance of this view table. I use SELECT to identify the existing column I wish to pull into the view, which is 'BookTitle' column from the 'Books' table. I used a INNER JOIN to selects records that help me find the matching values from the 'Books' table and the selected 'Borrowers' table. I specified which tables and columns I wanted to access using the ON keyword. I used the 'BookID' column that the tables both share to finish the INNER JOIN. I used a GROUP BY statement to group the result-set by the 'BookTitle' column. I then used the HAVING clause to specify filter conditions for a group of rows or aggregates. This condition is applied after the GROUP BY clause in the SQL query. It compares the count of Borrowers' client IDs with 20% of the total count of Borrowers' client IDs.
-- I attached MySQL syntax as well:
-- CREATE VIEW view_name AS
-- SELECT select_list
-- FROM table1
-- INNER JOIN table2
-- ON table1.column_name = table2.column_name;
-- GROUP BY group_by_expression
-- HAVING group_condition;

CREATE VIEW `books borrowed by 20% of the clients` AS 
SELECT BookTitle
FROM Books
INNER JOIN Borrowers
ON Books.BookID = Borrowers.BookID
GROUP BY BookTitle
HAVING COUNT(Borrowers.ClientID) >= (COUNT(Borrowers.ClientID)*0.2)

-- Query to prove the view table was created

SELECT *
FROM `books borrowed by 20% of the clients`;


-- 11. The top month of borrows in 2017 --

-- I used the MONTH() function to return the month component of the 'BorrowDate' column from the 'Borrowers' table and used the AS command to rename it to 'Top_Month' column. I then used the COUNT function in combination with the MONTH function to count how many books were borrowed. I then used the YEAR() function return the year component of the 'BorrowDate' column and set that equal to 2017 for search condition in the WHERE clause. I used a GROUP BY statement to group the result-set by the 'Genre' column, I then used the ORDER BY keyword to list the result set by the amount of books borrowed (Included the DESC keyword) and used a LIMIT clause to specify the number of records to return, I used 5 to result in the top months that the most books were borrowed.
-- I attached MySQL syntax as well:
-- SELECT select_list
-- FROM table1
-- WHERE search_condition
-- GROUP BY group_by_expression
-- ORDER BY column_name ASC|DESC LIMIT number;

 SELECT MONTH(BorrowDate) AS Top_Month, COUNT(MONTH(BorrowDate)) AS Amount_of_books_borrowed
 FROM Borrowers
 WHERE YEAR(BorrowDate) = 2017
 GROUP BY MONTH(BorrowDate)
 ORDER BY Amount_of_books_borrowed DESC LIMIT 5;

-- 12. Average number of borrows by age --
-- I used the DISTINCT clause to retrieve unique values from the result set, it ensures that each age value appears only once in the output. I used the YEAR() function to return the year component for a given date and used a NOW() function to return the current date and time. I used that date information to subtract the current year from the Client DOB year which results in the current age of the result-set clients. Using the COUNT() function, I counted how many clients (accessing their 'ClientID' column through the 'Clients' table). I then divided and used the COUNT function again, alongside the DISTINCT clause to make sure I only count the different (distinct values), of how many books were borrowed by these people (accessing their ClientID through the 'Borrowers' table) and rounded the resulting value. Used the AS command to rename the column to a different column name "Average_Number_Borrowed". I used a INNER JOIN to selects records that help me find the matching values from the 'Clients' table and the selected 'Borrowers' table. I specified which tables and columns I wanted to access using the ON keyword. I used the 'ClientID' column that the tables both share to finish the INNER JOIN. I used a GROUP BY statement to group the result-set by the 'Age' column.
-- I attached MySQL syntax as well:
-- SELECT DISTINCT (YEAR(NOW())-column_name) AS alias_name , ROUND(COUNT(column_name)) / COUNT(DISTINCT column_name)) AS alias_name
-- FROM table1
-- INNER JOIN table2
-- ON table1.column_name = table2.column_name;
-- GROUP BY group_by_expression

SELECT DISTINCT (YEAR(NOW())-Clients.ClientDOB) AS Age, ROUND(COUNT(Clients.ClientID)/ COUNT(DISTINCT Borrowers.ClientID)) AS Average_Number_Borrowed
FROM Clients
INNER JOIN Borrowers
ON Clients.ClientID = Borrowers.ClientID
GROUP BY Age;

-- 13. The oldest and the youngest clients of the library --

--  I used the MAX() function to calculate the age of the oldest client in terms of the maximum age. I used the YEAR() function to return the year component for a given date and used a NOW() function to return the current date and time. I used that date information to subtract the current year from the Client DOB year which results in the current age of the result-set clients. Used the AS command to rename the column to a different column name "Oldest_Client". I then used the MIN() function to calculate the age of the youngest client in terms of the minimum age. I used the YEAR() function again to return the year component for a given date and used a NOW() function to return the current date and time. I used that date information to subtract the current year from the Client DOB year which results in the current age of the result-set clients. Used the AS command to rename the column to a different column name "Youngest_Client". I used a INNER JOIN to selects records that help me find the matching values from the 'Clients' table and the selected 'Borrowers' table. I specified which tables and columns I wanted to access using the ON keyword. I used the 'ClientID' column that the tables both share to finish the INNER JOIN. 
-- I attached MySQL syntax as well:
-- SELECT DISTINCT(YEAR(NOW())-column_name) AS alias_name , ROUND(COUNT(column_name)) / COUNT(DISTINCT column_name)) AS alias_name
-- FROM table1
-- INNER JOIN table2
-- ON table1.column_name = table2.column_name;

SELECT MAX(YEAR(NOW())-Clients.ClientDOB) AS Oldest_Client, MIN(YEAR(NOW())-Clients.ClientDOB) AS Youngest_Client
FROM Clients
INNER JOIN Borrowers
ON Clients.ClientID = Borrowers.ClientID;

-- 14. First and last names of authors that wrote books in more than one genre --
-- This query selects the 'AuthorFirstName' from the 'Authors' table and I used the AS command to rename the column to a different column name "First_Name" also from the 'Authors' table. I also selected the AuthorLastName and used the AS command to rename the column to a different column name "Last_Name". I used a INNER JOIN to selects records that help me find the matching values from the 'Authors' table and the selected 'Books' table. I specified which tables and columns I wanted to access using the ON keyword. I used the 'AuthorID' column that the tables both share to finish the INNER JOIN. I used a GROUP BY statement to group the result-set by the 'AuthorID' column. I then used the HAVING clause to specify filter conditions for a group of rows or aggregates. This condition is applied after the GROUP BY clause in the SQL query. It checks if the count of distinct genres of books is greater than 1.
-- I attached MySQL syntax as well:
-- SELECT select_list
-- FROM table1
-- INNER JOIN table2
-- ON table1.column_name = table2.column_name;
-- GROUP BY group_by_expression
-- HAVING group_condition;

SELECT Authors.AuthorFirstName AS First_Name, Authors.AuthorLastName AS Last_Name 
FROM Authors
INNER JOIN Books
ON Authors.AuthorID = Books.AuthorID
GROUP BY Authors.AuthorID
HAVING (COUNT(DISTINCT Books.Genre) > 1);

-- As you work on these queries, create indexes that will increase your queries' performance. You must include comments in your code that address the purpose of your query and explains each step. Save your queries and results in a plain-text file that you will submit as your assignment. --