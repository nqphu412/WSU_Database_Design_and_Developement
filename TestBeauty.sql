CREATE TABLE Client2 (
    clientID varchar (20) PRIMARY KEY,
    clientName varchar(20),
    phone varchar(20)
);

INSERT INTO Client2
VALUES ('C001', 'Charlie Nguyen', '0111111110'),
VALUES ('C002', 'Rosy Ta', '0111111131'),
VALUES ('C003', 'Ken Lin', '0111111153'),
VALUES ('C004', 'Hung Pham', '0111111189')
VALUES ('C005', 'Lu Nguyen', '0111231110'),
VALUES ('C006', 'Lucy Ng', '0132111131'),
VALUES ('C007', 'Hoa Kim', '0381111153'),
VALUES ('C008', 'Vy Ta', '0111111760'),
VALUES ('C009', 'Thao Cam', '0111281131'),
VALUES ('C010', 'Man Quan', '0193511153'),;

CREATE TABLE Service2 (
    serviceID varchar(20) PRIMARY KEY,
    serviceName varchar(30),
    serviceType varchar(20) CHECK (serviceType IN ('Item-based', 'Time-based')),
    duration INT, -- minute unit
    unitPrice numeric(2),
);

INSERT INTO Service2
VALUES ('S001', 'Manicure', 'Item-based', NULL, 25.00),  
VALUES ('S002', 'Pedicure', 'Item-based', NULL, 30.00),  
VALUES ('S003', 'Waxing', 'Item-based', NULL, 15.00),  
VALUES ('S004', 'Massage', 'Time-based', 60, NULL),    
VALUES ('S005', 'Facial', 'Time-based', 30, NULL);  

CREATE TABLE Staff2 (
    staffID varchar(20) PRIMARY KEY,
    staffName varchar(30),
    position varchar(20),
    beautyExpertise INT -- year unit
)

INSERT INTO Staff2 
VALUES ('ST001', 'Ba Hoa', 'Beauty Therapist', 5),
VALUES ('ST002', 'Juju David', 'Beauty Therapist', 3),
VALUES ('ST003', 'Ba Thuy', 'Manager', NULL),
VALUES ('ST004', 'Quin Quen', 'Receptionist', NULL),
VALUES ('ST005', 'Ali Mus', 'Beauty Therapist', 7);

CREATE TABLE TimeServicePrice2 (
    staffID varchar(20),
    serviceID varchar(20),
    price numeric(2),
    CONSTRAINT fk1 FOREIGN KEY (staffID) REFERENCES Staff2,
    CONSTRAINT fk2 FOREIGN KEY (serviceID) REFERENCES Service2,
    PRIMARY KEY (staffID, serviceID) 
)

INSERT INTO TimeServicePrice2
VALUES ('ST001', 'S004', 50.00), 
VALUES ('ST005', 'S004', 45.00),  
VALUES ('ST001', 'S005', 40.00);

CREATE TABLE Booking2 (
    bookingID varchar(20) PRIMARY KEY,
    staffID varchar(20),
    clientID varchar(20),
    serviceID varchar(20),
    dayBooking DATE,
    startTime TIME,
    endTime TIME,
    CONSTRAINT fk_booking1 FOREIGN KEY (staffID) REFERENCES Staff2,
    CONSTRAINT fk_booking2 FOREIGN KEY (clientID) REFERENCES Client2,
    CONSTRAINT fk_booking3 FOREIGN KEY (serviceID) REFERENCES Service2   
);

INSERT INTO Booking2
VALUES ('B001', 'ST001', 'C001', 'S004', '2024-10-08', '10:00:00', '11:00:00'),  
VALUES ('B002', 'ST002', 'C006', 'S005', '2024-10-08', '11:30:00', '12:00:00'), 
VALUES ('B003', 'ST003', 'C008', 'S004', '2024-10-08', '10:45:00', '11:45:00'),  
VALUES ('B004', 'ST004', 'C001', 'S002', '2024-10-08', '11:30:00', '13:00:00'), 

VALUES ('B005', 'ST002', 'C004', 'S001', '2024-10-09', '09:00:00', '10:30:00'),  
VALUES ('B006', 'ST003', 'C002', 'S003', '2024-10-09', '10:00:00', '10:30:00'),  
VALUES ('B007', 'ST001', 'C002', 'S004', '2024-10-09', '10:45:00', '11:45:00'), 
VALUES ('B008', 'ST004', 'C003', 'S005', '2024-10-09', '12:30:00', '13:00:00'), 

VALUES ('B009', 'ST002', 'C002', 'S002', '2024-10-10', '10:00:00', '10:30:00'), 
VALUES ('B010', 'ST005', 'C005', 'S001', '2024-10-10', '11:00:00', '11:30:00');

CREATE TABLE Therapy2 (
    bookingID varchar(20) PRIMARY KEY,
    staffID varchar(20) NOT NULL,
    quantity numeric(2), -- 1 if time-based service
    CONSTRAINT fk_therapy FOREIGN KEY (staffID) REFERENCES Staff2
);

INSERT INTO Therapy2
VALUES ('B001', 'ST001', 1),  
VALUES ('B002', 'ST001', 1), 
VALUES ('B003', 'ST005', 1),  
VALUES ('B004', 'ST002', 3), 
VALUES ('B005', 'ST002', 5),  
VALUES ('B006', 'ST001', 7),  
VALUES ('B007', 'ST005', 1), 
VALUES ('B008', 'ST001', 1), 
VALUES ('B009', 'ST002', 8), 
VALUES ('B010', 'ST002', 8);