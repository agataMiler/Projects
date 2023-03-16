select * from Album; 

select * from Artist;

select * from Customer;

select * from Employee;

--- select everything
select * from Invoice;

--- only select certain columns
select InvoiceID, CustomerID, InvoiceDate
FROM Invoice;

--- we can create columns (follow our strandard naming procedure no spaces, special characters, etc.)
select InvoiceID + 1000 as InvoiceIDNew, CustomerID, InvoiceDate
FROM Invoice;

--- we can do mathematical operations
select *, Total * 1000 as TotalIn1000
FROM Invoice;

select *, Total + InvoiceID as nonesense_column
FROM Invoice;

select *, (Total + InvoiceID)/CustomerID as even_more_onesense_column
FROM Invoice;

--- There are also built in functions that we can apply
select *, strftime('%Y',InvoiceDate) as Yr, strftime('%m',InvoiceDate) as Month
from Invoice;

--- More with dates
select *, 2022 - strftime('%Y',InvoiceDate) as NofYears
from Invoice;

--- There are also built-in string functions

select *, LOWER(BillingAddress) as BillingAddressLower
from Invoice;


--- Selecting distinct records
select distinct BillingCountry
from Invoice;

--- Aggregate functions
select SUM(Total) as Total, MAX(Total) as TotalMax, MIN(Total) as TotalMin, AVG(Total) as TotalAvg,
count(*) as cnt -- or count(Total)
from invoice;

---- string concatenation
select *, BillingAddress || ", " || BillingCity as CityAddress
from Invoice;

---- can get weird results when doing so on integers. Let's look at CAST 
select CustomerID, InvoiceID, cast(CustomerID as varchar) || '-' || cast(InvoiceID as varchar) as CustomerInvoice
from Invoice


---- is NULL
select * 
from Invoice
where BillingState is NULL;

select * from Invoice i 
where BillingState is NOT NULL ;

--- TEMPORARY TABLES available during your session
CREATE TEMPORARY TABLE TEMP_TABLE1 AS
Select 
*
from Invoice;

select * from TEMP_TABLE1


--- Permanent TABLES available even after your session ended
CREATE TABLE NEW_TABLE1 AS
Select 
*
from Invoice;

select * from NEW_TABLE1

---- Create an empty table
CREATE TABLE new_table ( column1 int, column2 varchar(255));

select * from new_table;




--- 
select * from (
select *, cast(InvoiceID as varchar) as new
from invoice ) a WHERE new >=10
