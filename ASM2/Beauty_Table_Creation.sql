/*
DROP TABLE Therapy;
DROP TABLE Booking;
DROP TABLE TimeService;
DROP TABLE Staff, Client, Service;
*/

CREATE TABLE Staff (
	staffID varchar(8) PRIMARY KEY,
	staffFname varchar(20) NOT NULL,
	staffLname varchar(20) NOT NULL,
	position varchar(15) 
		CHECK (position IN ('Licensee', 'Manager', 'Receptionist', 'Beauty Therapist')),
	levelExpertise INT, -- year performing service
);

CREATE TABLE Client (
	clientID varchar(8) PRIMARY KEY,
	clientFname varchar(20) NOT NULL,
	clientLname varchar(20) NOT NULL,
);

CREATE TABLE Service (
	serviceID varchar(8) PRIMARY KEY,
	serviceName varchar(20) NOT NULL,
	type CHAR(10) CHECK (type IN ('Item-based', 'Time-based')),
	itemPrice numeric(2) NOT NULL, 
	
	CHECK (type = 'Time-based' AND itemPrice = 0) -- 0 when it is time-based
);

CREATE TABLE TimeService ( -- LEFT JOIN with table Service for overall information
	qualifiedStaffID varchar(8),
	serviceID varchar(8),
	timePrice numeric(2), -- Price per hour
	
	PRIMARY KEY (qualifiedStaffID, serviceID),
	FOREIGN KEY (serviceID) REFERENCES Service,
	FOREIGN KEY (qualifiedStaffID) REFERENCES Staff
);

CREATE TABLE Booking (
	bookingID varchar(8) PRIMARY KEY,
	bookingStaffID varchar(8) NOT NULL,
	clientID varchar(8) NOT NULL,
	serviceID varchar(8) NOT NULL,
	bookedDate DATE NOT NULL,
	startTime TIME NOT NULL,
	finishTime TIME NOT NULL,
	duration AS DATEDIFF(MINUTE, startTime, finishTime), -- calculate the duration
	
	CHECK (startTime < finishTime),
	UNIQUE (clientID, bookedDate, startTime, finishTime),
	
	FOREIGN KEY (bookingStaffID) REFERENCES Staff,
	FOREIGN KEY (clientID) REFERENCES Client,
	FOREIGN KEY (serviceID) REFERENCES Service
);

CREATE TABLE Therapy (
	bookingID varchar(8),
	performStaffID varchar(8),
	quantityItemUsed INT,
	
	PRIMARY KEY (bookingID),
	FOREIGN KEY (bookingID) REFERENCES Booking,
	FOREIGN KEY (performStaffID) REFERENCES Staff,
);
