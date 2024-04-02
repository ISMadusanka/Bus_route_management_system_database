-- insert data 

USE BusHub6;

-- Inserting data into EMPLOYEE
INSERT INTO EMPLOYEE (EmployeeID, Salary, Position, AddressNo, AddressStreet, AddressCity, FirstName, LastName, Birthday, ContactNo)
VALUES 
('EMP001', 60000.00, 'Manager', '123', 'Galle Road', 'Colombo', 'Saman', 'Perera', '1980-05-15', '0711234567'),
('EMP002', 62000.00, 'Manager', '456', 'Mahaweli Mawatha', 'Kandy', 'Malini', 'Silva', '1978-09-20', '0722345678'),
('EMP003', 48000.00, 'Driver', '789', 'Dutch Hospital Street', 'Galle', 'Nimal', 'Fernando', '1985-03-10', '0743456789'),
('EMP004', 48000.00, 'Driver', '1011', 'Nupe Junction', 'Matara', 'Kumari', 'Ratnayake', '1987-07-08', '0774567890'),
('EMP005', 48000.00, 'Driver', '1213', 'Hospital Road', 'Jaffna', 'Lalith', 'Bandara', '1989-12-25', '0765678901'),
('EMP006', 48000.00, 'Driver', '1415', 'Temple Street', 'Trincomalee', 'Kusum', 'Fernando', '1986-08-30', '0786789012'),
('EMP007', 48000.00, 'Driver', '1617', 'Main Street', 'Negombo', 'Sujatha', 'Silva', '1984-04-05', '0717890123'),
('EMP008', 48000.00, 'Driver', '1819', 'Police Station Road', 'Anuradhapura', 'Sunil', 'Perera', '1990-06-12', '0728901234'),
('EMP009', 48000.00, 'Driver', '2021', 'Bazar Street', 'Polonnaruwa', 'Nilmini', 'Fernando', '1992-02-18', '0749012345'),
('EMP010', 48000.00, 'Driver', '2223', 'Railway Avenue', 'Batticaloa', 'Ranjan', 'Silva', '1983-10-07', '0770123456'),
('EMP011', 55000.00, 'Supervisor', '2425', 'Church Road', 'Kalutara', 'Chandrika', 'Perera', '1982-06-25', '0761234567'),
('EMP012', 57000.00, 'Supervisor', '2627', 'Station Road', 'Ratnapura', 'Sarath', 'Fernando', '1981-11-12', '0782345678'),
('EMP013', 56000.00, 'Supervisor', '2829', 'Market Street', 'Kegalle', 'Malini', 'Silva', '1980-08-20', '0713456789'),
('EMP014', 49000.00, 'Driver', '3031', 'Court Road', 'Hambantota', 'Nalaka', 'Ranasinghe', '1984-04-15', '0724567890'),
('EMP015', 49000.00, 'Driver', '3233', 'Lake Road', 'Badulla', 'Saman', 'Jayawardena', '1986-09-30', '0745678901') ,
('EMP016', 63000.00, 'Manager', '363', 'Victoria Gardens', 'Colombo', 'Nishantha', 'Fernando', '1975-08-10', '0777890123');

INSERT INTO MANAGER (EmployeeID, Area, Experience)
VALUES 
('EMP001', 'Operations', 5),
('EMP002', 'Finance', 6),
('EMP016', 'Human Resources', 5);

-- Inserting records into the DRIVER table
INSERT INTO DRIVER (LicenceNo, EmployeeID, Experience)
VALUES 
('DL-001', 'EMP003', 3),
('DL-002', 'EMP004', 5),
('DL-003', 'EMP005', 2),
('DL-004', 'EMP006', 4),
('DL-005', 'EMP007', 6),
('DL-006', 'EMP008', 7),
('DL-007', 'EMP009', 7),
('DL-008', 'EMP010', 7),
('DL-009', 'EMP014', 7),
('DL-010', 'EMP015', 8);



-- Inserting records into the SUPERVISOR table
INSERT INTO SUPERVISOR (SupervisorID, EmployeeID)
VALUES 
('SV-001', 'EMP011'),
('SV-002', 'EMP012'),
('SV-003', 'EMP013');

-- Inserting records into the ROUTE table
INSERT INTO ROUTE (RouteNo, SupervisorID, Distance, Duration, Start, End)
VALUES 
(1, 'SV-001', 100, 120, 'Colombo', 'Kandy'),
(2, 'SV-002', 150, 150, 'Colombo', 'Matara'),
(3, 'SV-003', 80, 90, 'Gampaha', 'Polonnaruwa'),
(4, 'SV-001', 200, 180, 'Kadawatha', 'Jaffna'),
(5, 'SV-002', 120, 130, 'Colombo', 'Ratnapura'),
(6, 'SV-003', 140, 120, 'Colombo', 'Galle');

-- Inserting records into the BUS_SCHEDULE table
INSERT INTO BUS_SCHEDULE (ScheduleID, RouteNo, StartTime, EndTime)
VALUES 
('SCH-001', 1, '08:00:00', '10:00:00'),
('SCH-002', 2, '09:00:00', '12:00:00'),
('SCH-003', 3, '10:00:00', '12:30:00'),
('SCH-004', 4, '11:00:00', '14:30:00'),
('SCH-005', 5, '12:00:00', '14:00:00'),
('SCH-006', 1, '13:00:00', '15:00:00'),
('SCH-007', 2, '14:00:00', '17:00:00'),
('SCH-008', 3, '15:00:00', '17:30:00'),
('SCH-009', 4, '16:00:00', '19:30:00'),
('SCH-010', 5, '17:00:00', '19:00:00');

-- Insert records into the DEPOT table
INSERT INTO DEPOT (DepotID, Capacity, ContactNo)
VALUES 
('DEP001', 10, '0711234567'),
('DEP002', 5, '0712345678'),
('DEP003', 5, '0762345678'),
('DEP004', 3, '0722345678'),
('DEP005', 4, '0742345678'),
('DEP006', 10, '0773456789');


-- Insert records into the BUS table
INSERT INTO BUS (BusID, ScheduleID, DepotID, Brand, Efficiency, Capacity, Year, Category)
VALUES 
('BUS-001', 'SCH-001','DEP001', 'TATA', 90, 50, 2018, 'Express'),
('BUS-002', 'SCH-002','DEP003', 'TATA', 85, 45, 2017, 'Standard'),
('BUS-003', 'SCH-003','DEP002', 'Leyland', 92, 55, 2019, 'Luxury'),
('BUS-004', 'SCH-004','DEP001', 'Leyland', 88, 40, 2016, 'Express'),
('BUS-005', 'SCH-005','DEP002', 'HINO', 85, 50, 2015, 'Standard'),
('BUS-006', 'SCH-006','DEP003', 'HINO', 90, 60, 2020, 'Luxury'),
('BUS-007', 'SCH-007','DEP002', 'TATA', 92, 45, 2017, 'Express'),
('BUS-008', 'SCH-008','DEP001', 'TATA', 89, 55, 2018, 'Standard'),
('BUS-009', 'SCH-009','DEP002', 'Leyland', 86, 40, 2019, 'Luxury'),
('BUS-010', 'SCH-010','DEP001', 'HINO', 87, 50, 2016, 'Express');



-- Insert records into the FARE table with varying price rates
INSERT INTO FARE (FareID, RouteNo, PriceRate, TicketType)
VALUES 
('F1T1', 1, 250.00, 'full'),
('F1T2', 1, 150.00, 'half'),
('F2T1', 2, 300.00, 'full'),
('F2T2', 2, 180.00, 'half'),
('F3T1', 3, 280.00, 'full'),
('F3T2', 3, 160.00, 'half'),
('F4T1', 4, 220.00, 'full'),
('F4T2', 4, 130.00, 'half'),
('F5T1', 5, 270.00, 'full'),
('F5T2', 5, 160.00, 'half');

-- Insert records into the MAINTENANCE table
INSERT INTO MAINTENANCE (ServiceID, BusID, LastTireChange, LastTireBrand, LastBrakeChange, LastOilChange, LastOilBrand, LastService)
VALUES 
('SERV001', 'BUS-001', '2023-05-20', 'Michelin', '2023-04-15', '2023-03-10', 'Shell', '2023-05-25'),
('SERV002', 'BUS-002', '2023-04-18', 'Bridgestone', '2023-03-12', '2023-02-20', 'Castrol', '2023-05-28'),
('SERV003', 'BUS-003', '2023-06-05', 'Goodyear', '2023-05-02', '2023-04-10', 'Mobil', '2023-05-30'),
('SERV004', 'BUS-004', '2023-05-25', 'Continental', '2023-04-20', '2023-03-15', 'Total', '2023-06-01'),
('SERV005', 'BUS-005', '2023-04-30', 'Pirelli', '2023-03-25', '2023-02-28', 'BP', '2023-06-02'),
('SERV006', 'BUS-006', '2023-06-10', 'Firestone', '2023-05-05', '2023-04-20', 'ExxonMobil', '2023-06-03'),
('SERV007', 'BUS-007', '2023-05-15', 'Yokohama', '2023-04-10', '2023-03-05', 'Chevron', '2023-06-05'),
('SERV008', 'BUS-008', '2023-06-20', 'Hankook', '2023-05-15', '2023-04-10', 'Shell', '2023-06-07'),
('SERV009', 'BUS-009', '2023-05-28', 'Dunlop', '2023-04-25', '2023-03-20', 'Castrol', '2023-06-10'),
('SERV010', 'BUS-010', '2023-06-02', 'Michelin', '2023-05-30', '2023-04-25', 'Mobil', '2023-06-12');

-- Insert records into the SERVICE_COST table
INSERT INTO SERVICE_COST (ServiceID, Amount, Payment_method)
VALUES 
('SERV001', 1500.00, 'Credit Card'),
('SERV002', 1800.00, 'Cash'),
('SERV003', 2000.00, 'Bank Transfer'),
('SERV004', 1700.00, 'Cash'),
('SERV005', 1900.00, 'Credit Card'),
('SERV006', 1600.00, 'Cash'),
('SERV007', 1750.00, 'Credit Card'),
('SERV008', 1950.00, 'Bank Transfer'),
('SERV009', 1850.00, 'Cash'),
('SERV010', 2100.00, 'Credit Card');

-- Insert records into the FUEL table
INSERT INTO FUEL (BillNo, BusID, FillDate, Volume)
VALUES 
('BILL001', 'BUS-001', '2023-05-10', 100.5),
('BILL002', 'BUS-002', '2023-05-11', 98.2),
('BILL003', 'BUS-003', '2023-05-12', 105.8),
('BILL004', 'BUS-004', '2023-05-13', 102.3),
('BILL005', 'BUS-005', '2023-05-14', 97.6),
('BILL006', 'BUS-006', '2023-05-15', 101.1),
('BILL007', 'BUS-007', '2023-05-16', 99.9),
('BILL008', 'BUS-008', '2023-05-17', 103.5),
('BILL009', 'BUS-009', '2023-05-18', 96.8),
('BILL010', 'BUS-010', '2023-05-19', 104.7);

-- Insert records into the FUEL_COST table
INSERT INTO FUEL_COST (BillNo, Amount, Payment_method)
VALUES 
('BILL001', 25000.00, 'Cash'),
('BILL002', 24000.00, 'Credit Card'),
('BILL003', 26400.00, 'Cash'),
('BILL004', 25500.00, 'Cash'),
('BILL005', 24400.00, 'Credit Card'),
('BILL006', 25200.00, 'Cash'),
('BILL007', 24900.00, 'Credit Card'),
('BILL008', 25800.00, 'Cash'),
('BILL009', 24200.00, 'Credit Card'),
('BILL010', 26100.00, 'Cash');


