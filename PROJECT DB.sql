create database SapiLahCuy
go
use SapiLahCuy
go

use master
go
drop database SapiLahCuy
go

CREATE TABLE Staff(
	StaffID CHAR(5) PRIMARY KEY CHECK(StaffID LIKE 'ST[0-9][0-9][0-9]') NOT NULL,
	StaffName VARCHAR(30) NOT NULL,
	StaffEmail VARCHAR(100) CHECK (StaffEmail LIKE '%@gmail.com' OR StaffEmail LIKE '%@yahoo.com') NOT NULL,
	StaffAddress VARCHAR(100) NOT NULL,
	StaffPhoneNumber VARCHAR(15) CHECK (LEN(StaffPhoneNumber) > 9) NOT NULL,
	StaffGender VARCHAR(10) CHECK (StaffGender LIKE 'Male' OR StaffGender LIKE 'Female') NOT NULL,
	StaffSalary VARCHAR(255) CHECK (StaffSalary BETWEEN 5000000 AND 10000000) NOT NULL
)

CREATE TABLE Customer(
	CustomerID CHAR(5) PRIMARY KEY CHECK(CustomerID LIKE 'CU[0-9][0-9][0-9]') NOT NULL,
	CustomerName VARCHAR(30) NOT NULL,
	CustomerEmail VARCHAR(100) CHECK (CustomerEmail LIKE '%@gmail.com' OR CustomerEmail LIKE '%@yahoo.com') NOT NULL,
	CustomerPhoneNumber VARCHAR(15) CHECK (LEN(CustomerPhoneNumber) > 9) NOT NULL,
	CustomerAddress VARCHAR(100) NOT NULL,
	CustomerGender VARCHAR(10) CHECK (CustomerGender LIKE 'Male' OR CustomerGender LIKE 'Female')NOT NULL
)
CREATE TABLE Cut(
	CutID CHAR(5) PRIMARY KEY CHECK(CutID LIKE 'CT[0-9][0-9][0-9]') NOT NULL,
	CutName VARCHAR (10) NOT NULL
)
CREATE TABLE Beef(
	BeefID CHAR(5) PRIMARY KEY CHECK(BeefID LIKE 'BE[0-9][0-9][0-9]') NOT NULL,
	CutID CHAR(5) FOREIGN KEY REFERENCES Cut(CutID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	BeefName VARCHAR(30) NOT NULL,
	BeefPrice VARCHAR(50) CHECK (BeefPrice >= 50000) NOT NULL
)
CREATE TABLE Vendor(
	VendorID CHAR(5) PRIMARY KEY CHECK(VendorID LIKE 'VE[0-9][0-9][0-9]') NOT NULL,
	VendorName VARCHAR(30) NOT NULL,
	VendorEmail VARCHAR(100) CHECK (VendorEmail LIKE '%@gmail.com' OR VendorEmail LIKE '%@yahoo.com')NOT NULL, 
	VendorPhoneNumber VARCHAR(15) CHECK (LEN(VendorPhoneNumber) > 9) NOT NULL,
	VendorAddress VARCHAR(100) NOT NULL
)

CREATE TABLE PurchaseTransactionHeader(
PurchaseId CHAR(5) PRIMARY KEY CHECK (PurchaseID LIKE 'PU[0-9][0-9][0-9]')  NOT NULL,
StaffID CHAR(5) FOREIGN KEY REFERENCES Staff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
VendorID CHAR(5) FOREIGN KEY REFERENCES Vendor(VendorID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
PurchaseDate DATE NOT NULL

CONSTRAINT PurchaseDate_Check CHECK(DATEPART(DAY,PurchaseDate) <= GETDATE())
)

CREATE TABLE PurchaseTransactionDetail(
PurchaseId CHAR(5) FOREIGN KEY REFERENCES PurchaseTransactionHeader(PurchaseID) ON UPDATE CASCADE ON DELETE CASCADE  NOT NULL ,
BeefID CHAR (5) FOREIGN KEY REFERENCES Beef(BeefID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
PurchaseQuantity INT CHECK (PurchaseQuantity > 0)NOT NULL
)

CREATE TABLE SalesTransactionHeader(
SalesID CHAR(5) PRIMARY KEY CHECK(SalesID LIKE 'TR[0-9][0-9][0-9]') NOT NULL,
StaffID CHAR(5) FOREIGN KEY REFERENCES Staff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
CustomerID CHAR(5) FOREIGN KEY REFERENCES Customer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
SalesDate DATE NOT NULL 

CONSTRAINT SalesDate_Check CHECK(DATEPART(DAY,SalesDate) <= GETDATE())
)

CREATE TABLE SalesTransactionDetail(
SalesID CHAR(5) FOREIGN KEY REFERENCES SalesTransactionHeader(SalesID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL ,
BeefID CHAR (5) FOREIGN KEY REFERENCES Beef(BeefID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
SalesQuantity INT CHECK (SalesQuantity > 0)NOT NULL
)