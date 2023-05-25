-- Creates the "library_db" database --
CREATE DATABASE library_db;

-- Makes it so all of the following code will affect library_db --
USE library_db;

-- Creates the table "Authors" within library_db --
CREATE TABLE Authors (
    -- Makes a numeric column called "AuthorID" which will automatically increment its default value as we create new rows, which also cannot contain null --
    AuthorID int AUTO_INCREMENT NOT NULL,
    -- Makes a string column called "AuthorFirstName" which cannot contain null --
    AuthorFirstName varchar(255) NOT NULL,
    -- Makes a string column called "AuthorLastName" which cannot contain null --
    AuthorLastName varchar(255) NOT NULL,
    -- Makes a string column called "AuthorNationality" which cannot contain null --
    AuthorNationality varchar(255) NOT NULL,
    -- SQL creates a PRIMARY KEY on the "AuthorID" column when the "Author" table is created --
    PRIMARY KEY (AuthorID)

);

CREATE TABLE Books (
    -- Makes a numeric column called "BookID" which cannot contain null --
    BookID int AUTO_INCREMEN NOT NULL,
    -- Makes a string column called "BookTitle" which cannot contain null --
    BookTitle varchar(255) NOT NULL,
    -- Makes a numeric column called "AuthorID" which cannot contain null --
    AuthorID int FOREIGN KEY NOT NULL,
    -- Makes a string column called "Genre" which cannot contain null --
    Genre varchar(255),
    -- SQL creates a PRIMARY KEY on the "BookID" column when the "Books" table is created --
    PRIMARY KEY (BookID),
    -- SQL creates a FOREIGN KEY on the "AuthorID" column when the "Books" table is created--
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

