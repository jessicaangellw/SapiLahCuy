USE SapiLahCuy
GO


--1.	Display Beef Number (obtained from three last digits of BeefId), BeefName, CutName, and Total of Beef That Has Been Sold (obtained from the total quantity of the beef that has been sold) for every BeefName contains 'Beef' and BeefPrice more than 200000.

SELECT 
	[Beef Number] = RIGHT(b.BeefID, 3), 
	BeefName, 
	CutName, 
	[Total of Beef That Has Been Sold] = SUM(SalesQuantity)
FROM Beef b
JOIN Cut c
ON b.CutID = c.CutID
JOIN SalesTransactionDetail std
ON b.BeefID = std.BeefID
WHERE BeefName LIKE '%Beef%' 
AND BeefPrice > 200000
GROUP BY RIGHT(b.BeefID, 3), BeefName, CutName

--2.	Display CutName and Maximum Quantity (obtained from maximum quantity in one purchase) for every BeefName contains 'Steak' and three last digits of CutId is an even number.

SELECT 
	CutName, 
	[Maximum Quantity] =  MAX(PurchaseQuantity)
FROM Cut c
JOIN Beef b
ON c.CutID = b.CutID
JOIN PurchaseTransactionDetail ptd
ON b.BeefID = ptd.BeefID
WHERE BeefName LIKE '%Steak%' 
AND RIGHT(c.CutID,3) % 2 = 0
GROUP BY CutName


--3.	Display CustomerName, Total Purchase (obtained from the total customer's purchase and ends with ' Purchase(s)'), and Total Quantity (obtained from the total of beef that has been purchased by customer) for every transaction that occurs on odd dates and CustomerGender is 'Male'.

SELECT 
	CustomerName, 
	[Total Purchase] = CONVERT(VARCHAR, COUNT(sth.SalesID)) + ' Purchase(s)', 
	[Total Quantity] = COUNT(BeefID)
FROM Customer c 
JOIN SalesTransactionHeader sth
ON c.CustomerID = sth.CustomerID
JOIN SalesTransactionDetail std
on sth.SalesID = std.SalesID
WHERE datename(day,SalesDate)  % 2 = 1
AND CustomerGender LIKE 'Male'
GROUP BY CustomerName

--4.	Display StaffName, Total Sale (obtained from the total staff's sale and ends with ' Sale(s)'), and Total Quantity (obtained from the total of beef that has been saled by staff) for every StaffSalary more than 7000000.

SELECT 
	StaffName , 
	[Total Sale] = CONVERT (VARCHAR, COUNT (sth.SalesID )) + ' Sale(s)', 
	[Total Quantity] = COUNT(BeefID)
FROM Staff s
JOIN SalesTransactionHeader sth
ON s.StaffID = sth.StaffID 
JOIN SalesTransactionDetail std
on sth.SalesID = std.SalesID
WHERE StaffSalary > 7000000
GROUP BY StaffName 

--5.	Display VendorName, BeefId , Quantity, and Purchase Date (obtained from PurchaseDate with Mon dd, yyyy format) for every Quantity more than average quantity in all transaction and transaction occurs before Mar 15, 2022 and Quantity order by Quantity from smallest to the largest.
--(alias subquery)

SELECT 
	VendorName, 
	BeefID , 
	PurchaseQuantity, 
	[Purchase Date] = CONVERT(VARCHAR, PurchaseDate , 107)
FROM Vendor v
JOIN PurchaseTransactionHeader pth
ON v.VendorID = pth.VendorID 
JOIN PurchaseTransactionDetail ptd
ON pth.PurchaseId = ptd.PurchaseId,
( SELECT [AVG QTY] = AVG(PurchaseQuantity)
FROM PurchaseTransactionDetail
) AS X
WHERE PurchaseDate < '2022-03-15' 
AND PurchaseQuantity > X.[AVG QTY]
GROUP BY VendorName, BeefID , PurchaseQuantity, CONVERT(VARCHAR, PurchaseDate , 107)
ORDER BY PurchaseQuantity ASC



--6.	Display distinctly CustomerName and Gender (obtained from the first character of CustomerGender) for every Quantity more than average quantity in all sale transactions and CustomerEmail ends with '@gmail.com'.
--(alias subquery)

SELECT DISTINCT 
	CustomerName, 
	[Gender] = LEFT(CustomerGender, 1)
FROM Customer c 
JOIN SalesTransactionHeader sth
ON c.CustomerID = sth.CustomerID
JOIN SalesTransactionDetail std
ON sth.SalesID = std.SalesID,
( SELECT [AVG QTY] = AVG(SalesQuantity)
FROM SalesTransactionDetail
) AS Y
WHERE CustomerEmail LIKE '%@gmail.com' 
AND SalesQuantity > Y.[AVG QTY]
GROUP BY CustomerName, LEFT(CustomerGender, 1)

--7.	Display Customer Id (obtained from last three character of CustomerId), Name (obtained from CustomerName), Gender (obtained from first character of CustomerGender), Total Quantity (obtained from total quantity of beef that has been purchased by the customer), and Average Quantity (obtained from average quantity of beef that has been purchased by the customer) for every CustomerName has more than or equals to one space and Average Quantity more than 15.
--(alias subquery)
SELECT 
	[CustomerID] = RIGHT(c.CustomerID, 3), 
	[Name] = CustomerName, 
	[Gender] = LEFT(CustomerGender, 1), 
	[Total Quantity] = COUNT(BeefID)
FROM Customer c
JOIN SalesTransactionHeader sth
ON c.CustomerID = sth.CustomerID
JOIN SalesTransactionDetail std
ON sth.SalesID = std.SalesID,
(
SELECT [AVG QTY] = AVG(SalesQuantity)
FROM SalesTransactionDetail
HAVING AVG(SalesQuantity) > 15
) AS S
WHERE CustomerName LIKE '% %'
GROUP BY RIGHT(c.CustomerID, 3), CustomerName, LEFT(CustomerGender, 1)

--8.	Display Staff Id (obtained from StaffId replacing 'ST' with 'Staff '), Email (obtained StaffEmail with uppercase format), Phone Number (obtained from StaffPhoneNumber replacing first character with '+62'), Total Quantity (obtained from total quantity of beef that has been purchased by the staff), and Average Quantity (obtained from average quantity of beef that has been purchased by the staff) for every StaffGender is 'Male' and Average Quantity more than 200.
--(alias subquery)

SELECT 
	[Staff Id] = REPLACE(s.StaffID, 'ST', 'Staff'), 
	[Email] = UPPER(StaffEmail), 
	[Phone Number] = REPLACE(StaffPhoneNumber, LEFT(StaffPhoneNumber,1), '+62'), 
	[Total Quantity] = COUNT(BeefID) 
FROM Staff s 
JOIN PurchaseTransactionHeader pth
ON s.StaffID = pth.StaffID 
JOIN PurchaseTransactionDetail ptd
on pth.PurchaseId = ptd.PurchaseId,
(SELECT [AVG QTY] = AVG(PurchaseQuantity)
FROM PurchaseTransactionDetail
HAVING AVG(PurchaseQuantity) > 200
) AS R
WHERE StaffGender LIKE 'Male'
GROUP BY REPLACE(s.StaffID, 'ST', 'Staff'),  UPPER(StaffEmail), REPLACE(StaffPhoneNumber, LEFT(StaffPhoneNumber,1), '+62') 

--9.	Create a view named ‘VendorTotalTransactionView to display VendorName, VendorEmail, Total Transaction (obtained from total transaction that has been handled by the vendor), and Total Quantity (obtained from total quantity of the beef that has been sold) for every VendorName contains 'a' and VendorEmail ends with '@gmail.com'.
GO
CREATE VIEW VendorTotalTransactionView
AS
SELECT 
	VendorName, 
	VendorEmail, 
	[Total Transaction] = COUNT(pth.PurchaseId), 
	[Total Quantity] = COUNT(BeefID)
FROM Vendor v
JOIN PurchaseTransactionHeader pth
ON v.VendorID = pth.VendorID
JOIN PurchaseTransactionDetail ptd
ON pth.PurchaseId = ptd.PurchaseId
WHERE VendorName LIKE '%a%' AND VendorEmail LIKE '%@gmail.com'
GROUP BY VendorName, VendorEmail
GO

SELECT * 
FROM VendorTotalTransactionView

--10.	Create a view named ‘StaffMinMaxTransactionView’ to display StaffName, PurchaseId, Minimum Beef (obtained from minimum beef purchase in one transaction), and Maximum Beef (obtained from maximum beef purchase in one transaction) for every StaffEmail ends with '@gmail.com' and Minimum Beef more than 50
GO
CREATE VIEW StaffMinMaxTransactionView
AS 
SELECT 
	StaffName, 
	pth.PurchaseId, 
	[Minimum  Beef] = MIN(PurchaseQuantity), 
	[Maximum Beef] = MAX(PurchaseQuantity)
FROM Staff s
JOIN PurchaseTransactionHeader pth
ON s.StaffID = pth.StaffID
JOIN PurchaseTransactionDetail ptd
ON pth.PurchaseId = ptd.PurchaseId
WHERE StaffEmail LIKE '%@gmail.com' 
GROUP BY StaffName, pth.PurchaseId
HAVING MIN(PurchaseQuantity) > 50
GO

SELECT *
FROM  StaffMinMaxTransactionView