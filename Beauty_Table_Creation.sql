/*
In case want to reset
DROP TABLE Beauty_Therapy;
DROP TABLE Beauty_Booking;
DROP TABLE Beauty_TimeService;
DROP TABLE Beauty_Staff;
DROP TABLE Beauty_Client;
DROP TABLE Beauty_Service;
*/

CREATE TABLE Beauty_Staff (
	staffID varchar(8) PRIMARY KEY,
	staffFname varchar(20) NOT NULL,
	staffLname varchar(20) NOT NULL,
	position varchar(17) 
		CHECK (position IN ('Licensee', 'Manager', 'Receptionist', 'Beauty Therapist')),
	levelExpertise INT, -- year performing service
);

CREATE TABLE Beauty_Client (
	clientID varchar(8) PRIMARY KEY,
	clientFname varchar(20),
	clientLname varchar(20),

	CHECK ( -- Only 1 entry 'Walk-in' for all Walk-in client
        (clientID = 'Walk-in' AND clientFname IS NULL AND clientLname IS NULL) OR 
        (clientID != 'Walk-in' AND clientFname IS NOT NULL AND clientLname IS NOT NULL)
    ));

CREATE TABLE Beauty_Service (
	serviceID varchar(8) PRIMARY KEY,
	serviceName varchar(20) NOT NULL,
	type CHAR(10) CHECK (type IN ('Item-based', 'Time-based')),
	itemPrice numeric(2) NOT NULL, 
	
	CHECK ((type = 'Time-based' AND itemPrice = 0.00) OR type = 'Item-based') -- 0 when it is time-based
);

CREATE TABLE Beauty_TimeService ( -- LEFT JOIN with table Service for overall information
	qualifiedStaffID varchar(8),
	serviceID varchar(8),
	timePrice numeric(3), -- Price per hour
	
	PRIMARY KEY (qualifiedStaffID, serviceID),
	FOREIGN KEY (serviceID) REFERENCES Beauty_Service,
	FOREIGN KEY (qualifiedStaffID) REFERENCES Beauty_Staff
);

CREATE TABLE Beauty_Booking (
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
	
	FOREIGN KEY (bookingStaffID) REFERENCES Beauty_Staff,
	FOREIGN KEY (clientID) REFERENCES Beauty_Client,
	FOREIGN KEY (serviceID) REFERENCES Beauty_Service
);

CREATE TABLE Beauty_Therapy (
	bookingID varchar(8),
	performStaffID varchar(8),
	quantityItemUsed INT,
	
	PRIMARY KEY (bookingID),
	FOREIGN KEY (bookingID) REFERENCES Beauty_Booking,
	FOREIGN KEY (performStaffID) REFERENCES Beauty_Staff,
);
