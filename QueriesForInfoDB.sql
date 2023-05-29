-- 1. Display all contents of the Clients table --

-- This command below selects all (The asterisk or star symbol ( * ) means all columns.) from Clients table.
-- I added a auto increment in the ClientsID column which lists the table data in ascending order.
-- I attached MySQL syntax as well:
-- SELECT * ...
-- FROM table_name;

	SELECT * 
    FROM Clients;

-- 2. First names, last names, ages and occupations of all clients --

-- This command selects these specific columns: 'ClientFirstName, ClientLastName, ClientDoB, Occupation' from the Clients table
-- I used a YEAR() functon which returns the year part for a given date and used a NOW() function to return the current date and time. I used that date data to subtract the current year from the Client DoB year which results in the current age of the client. Used the AS command to rename the column 'ClientDoB' as the 'Age' column.
-- I attached MySQL syntax as well:
-- SELECT column1, column2, column 3 AS alias_name, column 4
-- FROM table_name;

     SELECT ClientFirstName, ClientLastName, (YEAR(NOW())-ClientDoB) AS Age, Occupation
    FROM Clients;

-- 3. First and last names of clients that borrowed books in March 2018 --

-- This commands selects these specific columns: ClientFirstName and ClientLastName from the Clients table.
-- I used a INNER JOIN to selects records that help me find the matching values from the Clients table and the selected Borrowers table. I specified which tables and columns I wanted to access using the ON keyword. I used the 'ClientsID' column that the tables both share to finish the INNER JOIN. I used the WHERE clause to filter the records in order to extract only those records in the 'BorrowDate' column that are between the March 1st, 2018 and March 31st, 2018. I used a GROUP BY statement to group the result-set by the 'ClientsID' column. I originally added a auto increment in the ClientsID column which lists the table data in ascending order.

-- SELECT column_name(s)
-- FROM table1
-- INNER JOIN table2
-- ON table1.column_name = table2.column_name;
-- WHERE condition
-- GROUP BY column_name(s)

    SELECT ClientFirstName,ClientLastName
    FROM Clients
    INNER JOIN Borrowers
    ON Clients.ClientID = Borrowers.ClientID
    WHERE BorrowDate Between '2018-03-01' AND '2018-03-31'
    GROUP BY Clients.ClientID;

-- 4. First and last names of the top 5 authors clients borrowed in 2017 --
    SELECT AuthorFirstName, AuthorLastName
    FROM Authors
    INNER JOIN Books
    ON Books.AuthorID = Authors.AuthorID
    INNER JOIN Borrowers
    ON Books.BookID = Borrowers.BookID
    WHERE BorrowDate Between '2017-01-01' AND '2017-12-31'
    GROUP BY Borrowers.BookID
    ORDER BY COUNT(Borrowers.BookID) DESC LIMIT 5;
-- 5. Nationalities of the least 5 authors that clients borrowed during the years 2015-2017 --
    SELECT AuthorNationality
    FROM Authors
    INNER JOIN Books
    ON Books.AuthorID = Authors.AuthorId
    INNER JOIN Borrowers
    ON Books.BookID = Borrowers.BookID
    WHERE BorrowDate Between '2015-01-01' AND '2017-01-01'
    GROUP BY AuthorNationality
    ORDER BY COUNT(Borrowers.BookID) LIMIT 5;

-- The book that was most borrowed during the years 2015-2017 --

-- Top borrowed genres for client born in years 1970-1980 --

-- Top 5 occupations that borrowed the most in 2016 --

-- Average number of borrowed books by job title -- 

-- Create a VIEW and display the titles that were borrowed by at least 20% of clients --

-- The top month of borrows in 2017 --

-- Average number of borrows by age --

-- The oldest and the youngest clients of the library --

-- First and last names of authors that wrote books in more than one genre --


-- As you work on these queries, create indexes that will increase your queries' performance.You must include comments in your code that address the purpose of your query and explains each step. Save your queries and results in a plain-text file that you will submit as your assignment. --