-- CREATE A NEW DATABASE

-- To create a new database
CREATE DATABASE record_company;


-- CREATE A 1ST TABLE = BANDS
/*To create a table called bands inside existing database*/
USE record_company;

/*To create 1st table called BANDS*/
CREATE TABLE bands (

/*For table to have a column called 'ID' containing intergers / numbers only and no NULL values allowed (as will thrown an error). The 'AUTO_INCREMENT' will automatically increase with each row addition.*/
-- Add ',' to state that this a seperate column 
  id INT NOT NULL AUTO_INCREMENT,

/*For table to have a column called 'name' containing variable characterters 255 max and no NULL values allowed (as will thrown an error).*/
  name VARCHAR (255) NOT NULL,
  
/*Creates and sets primary column for this table and sets the column "ID" as the primary key*/
  PRIMARY KEY (id)
);

-- CREATE A 2ND TABLE = ALBUM
/*To create 2nd table called ALBUMS*/
CREATE TABLE albums (
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
release_year INT,
band_id INT NOT NULL,
PRIMARY KEY (id),
/* To create foreign key called 'band_id' in albumn table. Then reference to 'band' table 'id' column primary key in 'band' table*/
FOREIGN KEY (band_id) REFERENCES bands(id)
);


-- INSERT COLUMNS INSIDE TABLE 
/* Insert column into bands table. Just 1 column*/
INSERT INTO bands (name)
VALUES ('Iron Maiden');

/* Insert column into bands table. More than 1 column*/
INSERT INTO bands (name)
VALUES ('Deucee'), ('Avenged Sevenfold'), ('Ankor');


-- VIEW DATA INSIDE TABLE
/*To query / get all data in the table. " * " selects all data rows in the table.*/
SELECT * FROM bands;

/*To query / get only 1st 2 data rows in the table, when you use 'LIMIT' + 2 command.*/
SELECT * FROM bands LIMIT 2;

/*To query / get only 1 column in the table,e.g. 'Name column'.*/
SELECT name FROM bands;


-- RENAME COLUMNS
/*To rename columns in a table, use the 'AS' function which is Alias.*/
SELECT id AS 'ID', name AS 'Band Name'
FROM bands;


-- TO REORDER COLUMNS 
/*To reorder a column in a table, e.g. order by Band name in alphabetical order from A -Z */
SELECT * FROM bands ORDER BY name;

/*Also To reorder a column in a table, e.g. order by Band name in alphabetical order from A -Z */
SELECT * FROM bands ORDER BY name ASC;

/*To reorder a column in a table, e.g. order by Band name in revered alphabetical order from Z - A*/
SELECT * FROM bands ORDER BY name DESC;


-- INSERT COLUMN INTO 2ND TABLE
/* Insert column into albums table. More than 1 column*/
INSERT INTO albums (name, release_year, band_id)

-- INSERT / ADD VALUES INTO COLUMN OF A TABLE 
VALUES ('The Number of the Beasts', 1985, 1),
	   ('Power Slave', 1984, 1),
       ('Nightmare', 2018, 2),
       ('Nightmare', 2010, 3),
       ('Test Album', NULL, 3);
       
       
-- VIEW TABLE
/*To view / select all data in albumns table*/
SELECT * FROM albums;


-- VIEW ALL DATA FROM ONE COLUMN IN TABLE IN A SPECIFIC COLUMN.
/*To view / select all data inside the column named 'name' from the 'albums' table.*/
SELECT name FROM albums;


-- REMOVE DUPLICATES SHOWING+ / VIEW UNIQUE VALUES IN A TABLE IN A SPECIFIC COLUMN.
/*To view only unique / distinct only unique data inside the column named 'name' from the 'albums' table.*/
SELECT DISTINCT name FROM albums;


-- TO UPDATE / CHANGE A PARTICULAR COLUMN CELL IN A TABLE
/*To update column 'release_year' in table 'album' from 1985 release year to 1982 using 'WHERE' statement. This is only changed where ID  is also 1*/
UPDATE albums -- Change albumn table 
SET release_year = 1982 -- Change 'release_year' column to 1982
WHERE id = 1; -- Where the 'id' column has a value of 1. 

/*To view / select all data in albumns table updated*/
SELECT * FROM albums;


-- FILTER THE TABLE BY A COLUMN AMOUNT
/*To filter table 'albumns' to show all release years before / less than 1983*/
SELECT * FROM albums
WHERE release_year <1983;

/*To filter table 'albumns' to show all release years before / less than 2000*/
SELECT * FROM albums
WHERE release_year <2000;


-- FILTER A TABLE BY A CHARACTER COTAINING CERTAIN LETTERS IN THE TABLE'S NAME COLUMN
/* In this example where 'he' in name column of any of the data rows. "%" and 'LIKE' is used to say any amount of character before or after the string %*/
SELECT * FROM albums
WHERE name LIKE '%he%';

/* In this example where 'er' in name column of any of the data rows. "%" and 'LIKE' is used to say any amount of character before or after the string %.*/
SELECT * FROM albums
WHERE name LIKE '%er%';


-- FILTER A TABLE BY 'OR'  MORE THAN 1 CHARACTER / NUMBER IN A TABLES MANY COLUMNS
/* In this example where 'er' in name column or Band ID is 2 of any of the data rows. "%" and 'LIKE' is used to say any amount of character before or after the string %.*/
SELECT * FROM albums
WHERE name LIKE '%er%' OR band_id = 2;


-- FILTER A TABLE BY 'AND'  MORE THAN 1 CHARACTER / NUMBER IN A TABLES MANY COLUMNS
/* In this example where '1984' is in release name column AND Band ID is 1 of any of the data rows. "%" and 'LIKE' is used to say any amount of character before or after the string %.*/
SELECT * FROM albums
WHERE release_year = 1984 AND band_id = 1;

/*For the below example no combination of the below where query exists so results will be blank.*/
/* In this example where '1984' is in release name column AND Band ID is 1 of any of the data rows. "%" and 'LIKE' is used to say any amount of character before or after the string %.*/
SELECT * FROM albums
WHERE release_year = 1984 AND band_id = 2;


-- FILTER A TABLE BY 'BETWEEN'  A NUMBER RANGE IN A TABLE WITH MANY COLUMNS
/* In this example where '1984' is in release name column AND Band ID is 1 of any of the data rows. "%" and 'LIKE' is used to say any amount of character before or after the string %.*/
SELECT * FROM albums 
WHERE release_year BETWEEN 2000 AND 2018;


-- FILTER A TABLE BY WITH 'NULL' NULL VALUES IN A TABLE WITH MANY COLUMNS
/* In this example where '1984' is in release name column AND Band ID is 1 of any of the data rows. "%" and 'LIKE' is used to say any amount of character before or after the string %.*/
SELECT * FROM albums 
WHERE release_year IS NULL;


-- REMOVE DATA from 1 row in the table, specifically row / id 5. 
DELETE FROM albums WHERE  id = 5;

SELECT * FROM albums;


-- JOIN Tables
/*Join tables. Joins to different tables together. 
1. Create Band ID column in albumn table */
/* Select everything on bands table */
SELECT * FROM bands 

/*Then Join bands table data moving directly on top to the albums table, where the bands.id (bands table, id column) equals 
the album.band id column in the (albumn table, id column)*/
JOIN albums ON bands.id = albums.band_id;


-- INNER JOIN Tables (Works same as Join -- Useful when data in both table)
/*Inner Join tables. Joins to different tables together. 
1. Create Band ID column in albumn table */
/* Select everything on bands table */
SELECT * FROM bands -- right table = bands
/*Then Join bands table data moving directly on top to the albums table, where the bands.id (bands table, id column) equals 
the album.band id column in the (albumn table, id column)*/
INNER JOIN albums ON bands.id = albums.band_id; -- Left table = album 


-- LEFT JOIN Tables 
/*Left Join tables. Joins 2 different tables together, with the left table data being kept & the right table data being added.*/
SELECT * FROM bands -- right table = bands
/*Then Join bands table data where the bands.id (bands table, id column) equals 
the album.band id column in the (albumn table, id column)*/
LEFT JOIN albums ON bands.id = albums.band_id; -- Left table = album 



-- RIGHT JOIN Tables 
/*Right Join tables. Joins 2 different tables together, with the right table data being kept & the left table data being added.*/
SELECT * FROM bands -- left table = bands
/*Then Join bands table data where the bands.id (bands table, id column) equals 
the album.band id column in the (albumn table, id column)*/
RIGHT JOIN albums ON bands.id = albums.band_id; -- Right table = album 


-- Aggregate / Average all data
/*Aggregate / Average. In this example gets the average of all data in release year column.*/
SELECT AVG(release_year) FROM albums;



-- Sum / Add all data
/*Sum all data. In this example add up of all data in release year column.*/
SELECT SUM(release_year) FROM albums;



-- Count all data rows
/*Count data. In this example add up of all data in release year column.*/
SELECT COUNT(release_year) FROM albums;


-- Group by function
/*Group by band id. In this example in the albums table, group data by 1 column here the band_id and 
count number of times each band.id occurs.*/
SELECT band_id, COUNT(band_id) FROM albums
GROUP BY band_id;

-- Group by Function by number of albums
/*Group by band name. In this example in the bands table, group data by 1 column here the band_name and 
count number of times each album release occurs.
-- Also used Alias */ 
SELECT b.name AS band_name, COUNT(a.id) AS num_albums -- Made Alias names
FROM bands AS b -- Left table is Band Table 
LEFT JOIN albums AS a ON b.id = a.band_id -- Right table is Album
GROUP BY b.id -- group by band id for unique rows for band ID.
HAVING num_albums = 1; -- Used after group by, similiar to where statement. Groups albums with 1. 



-- Group by Function by name Deucee and number of albums
/*Group by band name. In this example in the bands table, group data by 1 column here the band_name and 
count number of times each album release occurs.
-- Also used Alias */ 
SELECT b.name AS band_name, COUNT(a.id) AS num_albums -- Made Alias names
FROM bands AS b -- Left table is Band Table 
LEFT JOIN albums AS a ON b.id = a.band_id -- Right table is Album
WHERE b.name = 'Deucee'
GROUP BY b.id -- group by band id for unique rows for band ID.
HAVING num_albums = 1; -- Used after group by, similiar to where statement. Groups albums with 1. 
