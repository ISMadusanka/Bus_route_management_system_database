CREATE DATABASE BusHub6;

USE BusHub6;

-- creating tables

CREATE TABLE EMPLOYEE(
    EmployeeID VARCHAR(10) PRIMARY KEY,
    Salary DECIMAL(10, 2) NOT NULL,
    Position VARCHAR(50) NOT NULL,
    AddressNo VARCHAR(20),
    AddressStreet VARCHAR(100),
    AddressCity VARCHAR(100),
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100),
    Birthday DATE NOT NULL,
    ContactNo VARCHAR(15) NOT NULL UNIQUE    
);

CREATE TABLE MANAGER(
    EmployeeID VARCHAR(10) NOT NULL ,
    Area VARCHAR(50) NOT NULL ,
    Experience INT ,
    FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE(EmployeeID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE DRIVER(
    LicenceNo VARCHAR(20) PRIMARY KEY,
    EmployeeID VARCHAR(10) NOT NULL UNIQUE,    
    Experience INT,
    FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE(EmployeeID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE SUPERVISOR(
    SupervisorID VARCHAR(20) PRIMARY KEY,
    EmployeeID VARCHAR(10) NOT NULL UNIQUE ,   
    FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE(EmployeeID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE ROUTE(
    RouteNo INT PRIMARY KEY,
    SupervisorID VARCHAR(20) NOT NULL ,   
    Distance INT NOT NULL ,
    Duration INT ,
    Start VARCHAR(50) NOT NULL ,
    End VARCHAR(50) NOT NULL ,
    FOREIGN KEY (SupervisorID) REFERENCES SUPERVISOR(SupervisorID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE BUS_SCHEDULE(
    ScheduleID VARCHAR(10) PRIMARY KEY,
    RouteNo INT NOT NULL ,
    StartTime TIME NOT NULL ,
    EndTime TIME NOT NULL ,
    FOREIGN KEY (RouteNo) REFERENCES ROUTE(RouteNo)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

USE BusHub5;
CREATE TABLE DEPOT(
    DepotID VARCHAR(10) PRIMARY KEY,
    Capacity INT,
    ContactNo VARCHAR(15) NOT NULL UNIQUE 
);

CREATE TABLE BUS(
    BusID VARCHAR(10) PRIMARY KEY,
    ScheduleID VARCHAR(10),
    DepotID VARCHAR(10) NOT NULL ,
    Brand VARCHAR(20),
    Efficiency INT,
    Capacity INT,
    Year YEAR,
    Category VARCHAR(20) NOT NULL ,
    FOREIGN KEY (ScheduleID) REFERENCES BUS_SCHEDULE(ScheduleID)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
	FOREIGN KEY (DepotID) REFERENCES DEPOT(DepotID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);



CREATE TABLE FARE(
    FareID VARCHAR(20) PRIMARY KEY,
    RouteNo INT NOT NULL ,   
    PriceRate DECIMAL(10, 2) NOT NULL ,
    TicketType VARCHAR(50) NOT NULL ,
    FOREIGN KEY (RouteNo) REFERENCES ROUTE(RouteNo)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE MAINTENANCE(
    ServiceID VARCHAR(20) PRIMARY KEY,
    BusID VARCHAR(10) NOT NULL ,   
    LastTireChange DATE,
    LastTireBrand VARCHAR(50),
    LastBrakeChange DATE,
    LastOilChange DATE,
    LastOilBrand VARCHAR(50),
    LastService DATE,
    FOREIGN KEY (BusID) REFERENCES BUS(BusID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE SERVICE_COST(
    ServiceID VARCHAR(20),
    Amount DECIMAL(10, 2) NOT NULL ,
    Payment_method VARCHAR(20) NOT NULL ,
    FOREIGN KEY (ServiceID) REFERENCES MAINTENANCE(ServiceID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE FUEL(
    BillNo VARCHAR(20) PRIMARY KEY,
    BusID VARCHAR(10) NOT NULL ,
    FillDate DATE NOT NULL ,
    Volume FLOAT NOT NULL ,
    FOREIGN KEY (BusID) REFERENCES BUS(BusID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE FUEL_COST(
    BillNo VARCHAR(20) NOT NULL ,
    Amount DECIMAL(10, 2) NOT NULL ,
    Payment_method VARCHAR(20),
    FOREIGN KEY (BillNo) REFERENCES FUEL(BillNo)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

