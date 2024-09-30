USE SapiLahCuy
GO

INSERT INTO PurchaseTransactionHeader VALUES
('PU026', 'ST004', 'VE002', '2022-03-23'),
('PU027', 'ST009', 'VE001', '2022-05-11'),
('PU028', 'ST008', 'VE005', '2022-02-18');

INSERT INTO PurchaseTransactionDetail VALUES
('PU026', 'BE005', 10),
('PU027', 'BE010', 25),
('PU028', 'BE008', 30);


INSERT INTO SalesTransactionHeader VALUES
('TR026', 'ST010', 'CU008', '2022-03-22'),
('TR027', 'ST003', 'CU001', '2022-10-17'),
('TR028', 'ST009', 'CU009', '2022-04-30');

INSERT INTO SalesTransactionDetail VALUES
('TR026', 'BE006', 25),
('TR027', 'BE003', 15),
('TR028', 'BE009', 35);
