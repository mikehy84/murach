SELECT select_list
FROM table_source
[WHERE search_condition]
[ORDER BY order_by_list]




SELECT *
FROM Invoices;



SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
FROM Invoices



-- The Need to Filter

--1 You want to retrieve just the relevant data
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
FROM Invoices

--2 In the right order
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
FROM Invoices
ORDER BY InvoiceTotal;


--3 In readable format



--1 We can state which columns you want to select, you list them on the SELECT clause
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
FROM Invoices

--2 We can also calculate a column from existing columns, put calculation expression in the SELECT list
SELECT InvoiceID, InvoiceTotal, CreditTotal + PaymentTotal AS TotalCredits
FROM Invoices

--3 We can pick which rows to select by providing a WHERE clause with a condition
--- Only rows that satisfy the condition will be retrieved
SELECT InvoiceID, InvoiceTotal, CreditTotal + PaymentTotal AS TotalCredits
FROM Invoices
WHERE InvoiceID = 110;



-- A SELECT statement that returns an empty result set
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal 
FROM Invoices
WHERE InvoiceTotal > 5000;




-- SELECT statement that retrieves all invoices between given dates
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
FROM Invoices
WHERE InvoiceDate BETWEEN '2020-01-01' AND '2020-01-10'
ORDER BY InvoiceDate;



-- An arithmetic expression is used to calculate BalanceDue
SELECT InvoiceNumber, (InvoiceTotal - PaymentTotal - CreditTotal) AS BalanceDue
FROM Invoices
WHERE VendorId = 123 AND (InvoiceTotal - PaymentTotal - CreditTotal) > 50



-- A SELECT statement that doesn’t name a calculated column
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal,
    InvoiceTotal - PaymentTotal - CreditTotal 
FROM Invoices;



-- A string expression is used to calculate FullName
SELECT (VendorContactFName + ' ' + VendorContactLName) AS FullName
FROM Vendors



-- concatenate string data
SELECT VendorCity, VendorState, VendorCity + VendorState
FROM Vendors;



-- format string data using literal values
SELECT VendorName,
    VendorCity + ', ' + VendorState + ' ' + VendorZipCode
    AS Address
FROM Vendors;



-- include apostrophes in literal values
SELECT VendorName + ' ''s Address: ',
    VendorCity + ', ' + VendorState + ' ' + VendorZipCode
FROM Vendors;
