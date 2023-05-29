-- Write the following queries to retrieve the information detailed below. --

-- Display all contents of the Clients table --
	SELECT * FROM Clients;

-- First names, last names, ages and occupations of all clients --
    SELECT ClientFirstName, ClientLastName, (YEAR(NOW())-ClientDoB) AS Age, Occupation
    FROM Clients;
    -- First and last names of clients that borrowed books in March 2018 --
    SELECT ClientID
    FROM Borrowers;
    WHERE BorrowDate Between '2018-03-01' AND '2018-03-31'

-- First and last names of the top 5 authors clients borrowed in 2017 --
    SELECT ClientFirstName,ClientLastName
    FROM Clients
    INNER JOIN Borrowers
    ON Clients.ClientId = Borrowers.ClientId
    WHERE MONTH(BorrowDate) = 3 AND YEAR(BorrowDate) = 2018
    GROUP BY Clients.ClientId;
-- Nationalities of the least 5 authors that clients borrowed during the years 2015-2017 --

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