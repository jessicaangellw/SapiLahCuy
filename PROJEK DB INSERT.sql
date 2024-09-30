USE SapiLahCuy

INSERT INTO Staff VALUES 
('ST001', 'Andika Putra', 'andikaputra23@gmail.com', 'Jl. Kemanggisan Jeruk', '08127416672', 'Male', '5500000'),
('ST002', 'Rayhan', 'Rayhannn@gmail.com', 'Jl. Jeruk Manis', '08145678956', 'Male', '7000000'),
('ST003', 'Cherry', 'Cherryboom@gmail.com','Jl. Cakra Anggrek','082174690127','Female','6250000'),
('ST004', 'Andri Saputra', 'andrisaputra@gmail.com', 'Jl. Kemang Jeruk', '08123452718', 'Male', '6500000'),
('ST005', 'Caca', 'cacacaca@yahoo.com', 'Jl. Syahdan kemanggisan', '081257908236','Female','5000000'),
('ST006', 'Febriyani Adriyani', 'febriyaniadriyani@yahoo.com', 'Jl. Kijang Kemanggisan', '08128756098', 'Female', '7000000'),
('ST007', 'Adam','adamm@yahoo.com', 'Jl. Kebon Manis', '081138476532', 'Male', '6000000'),
('ST008', 'Johan Iksam', 'johaniksam@gmail.com', 'Jl. Lembang Raya', '08126578793', 'Male', '7300000'),
('ST009', 'Myka', 'Myka@yahoo.com', 'Jl. Salam', '081445678053', 'Female', '8500000'),
('ST010', 'Yanti Maharani', 'yantimaharani@gmail.com', 'Jl. Kebun Salam', '08123573890', 'Female', '9800000');

INSERT INTO Customer VALUES 
('CU001', 'Maria Purnawa', 'mariapurnawa@gmail.com', '08125623108', 'Jl. Jendral Haji', 'Female'),
('CU002', 'Margareth', 'marmargareth@yahoo.com', '085687023981', 'Jl. Flamboyan', 'Female'),
('CU003', 'Neymar Putra', 'neymarputra@gmail.com', '08138293013', 'Jl. Sudirman', 'Male'),
('CU004', 'Nuzul Ronaldo', 'nuzulronaldo@gmail.com', '08137902982', 'Jl. Bukit Raya', 'Male'),
('CU005', 'Gracia Angel', 'graciaangel@yahoo.com', '09673462871', 'Jl. Bhakti', 'Female'),
('CU006', 'Gema Raldi', 'gemaraldi@yahoo.com', '0867980236872', 'Jl. Budi Raya', 'Male'),
('CU007', 'Randy Bimo', 'randybimo@gmail.com', '08123689723', 'Jl. Budi Daya', 'Male'),
('CU008', 'Agnes Mawlia', 'agnesmawlia@gmail.com', '08628926789', 'Jl. Gajah Mada', 'Female'),
('CU009', 'Budi', 'Budiii11@yahoo.com', '08346081923', 'Jl. Panjang Kemanggisan', 'Male'),
('CU010', 'Maryani Putri', 'maryaniputri@gmail.com', '08176789240', 'Jl. Kota Baru', 'Female');

INSERT INTO Cut VALUES
('CT001', 'Chunk'),
('CT002', 'Rib'),
('CT003', 'Shortloin'),
('CT004', 'Sirloin'),
('CT005', 'Round'),
('CT006', 'Flank'),
('CT007', 'Plate'),
('CT008', 'Shank'),
('CT009', 'Brisket'),
('CT010', 'Innards');

INSERT INTO Beef VALUES
('BE001','CT010', 'A4 Japanese Wagyu Beef', '650000'),
('BE002', 'CT009', 'A5 Wagyu Ground Beef', '500000'),
('BE003', 'CT008', 'Japanese A5 Wagyu Steak', '550000'),
('BE004', 'CT007', 'A5 Wagyu Beef', '600000'),
('BE005', 'CT006', 'A7 Japanese Wagyu Beef', '550000'),
('BE006', 'CT005', 'New Yorks Steak', '650000'),
('BE007', 'CT004', 'Chuck Eye Steak', '850000'),
('BE008', 'CT003', 'Korean Style Beef', '400000'),
('BE009', 'CT002', 'American Wagyu Beef', '500000'),
('BE010', 'CT001', 'A5 Wagyu Steak', '450000');


INSERT INTO Vendor VALUES
('VE001', 'Meat Store', 'meatstore@gmail.com', '08239876096', 'Jl. Anggur Raya'),
('VE002', 'Gaggle Meat', 'gagglemeat@gmail.com', '08145365738', 'Jl. Pancoran'), 
('VE003', 'Beefology', 'beefology@yahoo.com', '08239876096', 'Jl. Kebun Anggur'), 
('VE004', 'Jual Sapi', 'jualsapi@gmail.com', '08764356095', 'Jl. Anggrek Kemanggisan'), 
('VE005', 'Sapi Enak Banget', 'sapienakbanget@yahoo.com', '089635467601', 'Jl. Puri Indah'), 
('VE006', 'My Steak', 'mysteak@yahoo.com', '08267632560', 'Jl. Jeruk Merah'),
('VE007', 'Fresh Meat', 'freshmeat@gmail.com', '08765387369', 'Jl. Raya Salam'), 
('VE008', 'Fest Meat', 'festmeat@yahoo.com', '08747632670', 'Jl. Pangeran Salim'), 
('VE009', 'Fun Meat', 'funmeat@gmail.com', '08456736782', 'Jl. Majahpahit'), 
('VE010', 'Red Beef', 'redbeef@gmail.com', '08752373640', 'Jl. Diponegoro Putih'), 
('VE011', 'Nature Meat', 'naturemeat@yahoo.com', '08638724670', 'Jl. Kemang Raya'), 
('VE012', 'Tap Beef', 'tapbeef@gmail.com', '08728462982', 'Jl. Anggur Raya'); 

INSERT INTO PurchaseTransactionHeader VALUES
('PU001', 'ST002', 'VE002', '2022-11-01'),
('PU002', 'ST006', 'VE003', '2022-12-22'),
('PU003', 'ST008', 'VE004', '2022-03-22'),
('PU004', 'ST007', 'VE005', '2022-03-11'),
('PU005', 'ST003', 'VE006', '2022-01-22'),
('PU006', 'ST004', 'VE007', '2022-02-03'),
('PU007', 'ST010', 'VE008', '2022-04-01'),
('PU008', 'ST009', 'VE009', '2022-02-11'),
('PU009', 'ST007', 'VE010', '2022-04-29'),
('PU010', 'ST006', 'VE002', '2022-02-28'),
('PU011', 'ST005', 'VE005', '2022-05-11'),
('PU012', 'ST004', 'VE007', '2022-10-01'),
('PU013', 'ST003', 'VE001', '2022-03-14'),
('PU014', 'ST002', 'VE009', '2022-04-15'),
('PU015', 'ST001', 'VE006', '2022-01-31'),
('PU016', 'ST001', 'VE008', '2022-03-27'),
('PU017', 'ST008', 'VE002', '2022-02-27'),
('PU018', 'ST010', 'VE010', '2022-01-29'),
('PU019', 'ST008', 'VE003', '2022-02-22'),
('PU020', 'ST005', 'VE002', '2022-06-11'),
('PU021', 'ST007', 'VE003', '2022-03-23'),
('PU022', 'ST001', 'VE007', '2022-04-19'),
('PU023', 'ST005', 'VE009', '2022-01-03'),
('PU024', 'ST010', 'VE001', '2022-03-03'),
('PU025', 'ST006', 'VE007', '2022-09-04');

INSERT INTO PurchaseTransactionDetail VALUES
('PU001', 'BE005', 60), 
('PU002', 'BE006', 100), 
('PU003', 'BE007', 20), 
('PU004', 'BE008', 250), 
('PU005', 'BE009', 500), 
('PU006', 'BE010', 50), 
('PU007', 'BE001', 80), 
('PU008', 'BE002', 150), 
('PU009', 'BE003', 280), 
('PU010', 'BE004', 270), 
('PU011', 'BE005', 60), 
('PU012', 'BE006', 200), 
('PU013', 'BE007', 80), 
('PU014', 'BE008', 75), 
('PU015', 'BE009', 60), 
('PU016', 'BE010', 20), 
('PU017', 'BE001', 40), 
('PU018', 'BE002', 900), 
('PU019', 'BE003', 450), 
('PU020', 'BE004', 650), 
('PU021', 'BE005', 750), 
('PU022', 'BE006', 400), 
('PU023', 'BE007', 300), 
('PU024', 'BE008', 35), 
('PU025', 'BE009', 100);

INSERT INTO SalesTransactionHeader VALUES
('TR001','ST005', 'CU002', '2022-12-04'),
('TR002','ST006', 'CU003', '2022-04-03'),
('TR003','ST007', 'CU004', '2022-03-15'),
('TR004','ST008', 'CU005', '2022-05-13'),
('TR005','ST009', 'CU006', '2022-09-08'),
('TR006','ST010', 'CU007', '2022-05-27'),
('TR007','ST001', 'CU008', '2022-08-12'),
('TR008','ST002', 'CU009', '2022-07-13'),
('TR009','ST003', 'CU010', '2022-01-03'),
('TR010','ST004', 'CU001', '2022-02-17'),
('TR011','ST005', 'CU002', '2022-08-21'),
('TR012','ST006', 'CU003', '2022-01-09'),
('TR013','ST007', 'CU004', '2022-02-13'),
('TR014','ST008', 'CU005', '2022-09-30'),
('TR015','ST009', 'CU006', '2022-03-04'),
('TR016','ST010', 'CU007', '2022-01-13'),
('TR017','ST001', 'CU008', '2022-02-26'),
('TR018','ST002', 'CU009', '2022-01-13'),
('TR019','ST003', 'CU010', '2022-04-30'),
('TR020','ST004', 'CU001', '2022-08-17'),
('TR021','ST005', 'CU002', '2022-03-14'),
('TR022','ST006', 'CU003', '2022-02-03'),
('TR023','ST007', 'CU004', '2022-11-12'),
('TR024','ST008', 'CU005', '2022-10-15'),
('TR025','ST009', 'CU006', '2022-02-14');

INSERT INTO SalesTransactionDetail VALUES 
('TR001', 'BE009', 100),
('TR002', 'BE010', 70),
('TR003', 'BE001', 200),
('TR004', 'BE002', 45),
('TR005', 'BE003', 10),
('TR006', 'BE004', 20),
('TR007', 'BE005', 25),
('TR008', 'BE006', 15),
('TR009', 'BE007', 50),
('TR010', 'BE008', 25),
('TR011', 'BE009', 70),
('TR012', 'BE010', 90),
('TR013', 'BE001', 35),
('TR014', 'BE002', 80),
('TR015', 'BE004', 90),
('TR016', 'BE005', 20),
('TR017', 'BE006', 10),
('TR018', 'BE007', 70),
('TR019', 'BE008', 80),
('TR020', 'BE009', 65),
('TR021', 'BE010', 75),
('TR022', 'BE001', 50),
('TR023', 'BE002', 25),
('TR024', 'BE003', 55),
('TR025', 'BE004', 10);