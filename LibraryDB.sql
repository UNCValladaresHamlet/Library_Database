-- Creates the "library_db" database --
CREATE DATABASE library_db;

-- Makes it so all of the following code will affect library_db --
USE library_db;

-- Creates the table "author" within library_db --
CREATE TABLE author (
    -- Makes a numeric column called "AuthorID" which cannot contain null --
    AuthorID int PRIMARY KEY NOT NULL,
    -- Makes a sting column called "AuthorFirstName" which cannot contain null --
    AuthorFirstName varchar(255) NOT NULL,
    -- Makes a sting column called "AuthorLastName" which cannot contain null --
    AuthorLastName varchar(255) NOT NULL,
    -- Makes a sting column called "AuthorNationality" which cannot contain null --
    AuthorNationality varchar(255) NOT NULL,
);
