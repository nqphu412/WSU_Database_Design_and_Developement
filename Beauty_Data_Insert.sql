INSERT INTO Staff2 VALUES -- staffID, staffFname, staffLname, position,	levelExpertise
('ST001', 'Jules', 'Le', 'Licensee', NULL), -- Non- Beauty Therapist
('ST002', 'Ba', 'Thuy', 'Manager', NULL),
('ST003', 'Quin', 'Quen', 'Receptionist', NULL),
('ST004', 'Gang', 'Yang', 'Receptionist', NULL),
('ST005', 'Ba', 'Hoa', 'Beauty Therapist', 5), -- Beauty Therapist from this line
('ST006', 'Juju', 'David', 'Beauty Therapist', 3),
('ST007', 'Ali', 'Mustafa', 'Beauty Therapist', 7),
('ST008', 'Thao', 'Nguyen', 'Beauty Therapist', 1),
('ST009', 'Brian', 'Banh', 'Beauty Therapist', 2),
('ST010', 'Angie', 'Pham', 'Beauty Therapist', 2),
('ST011', 'Sarah', 'Gray', 'Beauty Therapist', 6),
('ST012', 'Jasmine', 'Le', 'Beauty Therapist', 10);

INSERT INTO Client2 VALUES -- clientID, clientFname, clientLname
('C001', 'Charlie', 'Nguyen'),
('C002', 'Rosy', 'Ta'),
('C003', 'Ken', 'Lin'),
('C004', 'Hung', 'Pham'),
('C005', 'Lu', 'Nguyen'),
('C006', 'Lucy', 'Nguyen'),
('C007', 'Hoa', 'Kim'),
('C008', 'Vy', 'Ta'),
('C009', 'Thao', 'Cam'),
('C010', 'Man', 'Quan'),
('C011', 'Vy', 'Dang'),
('C012', 'Sue', 'Nguyen'),
('C013', 'Ginny', 'Pham'),
('C014', 'Cuong', 'Nguyen'),
('C015', 'Thien', 'Da'),
('C016', 'Uyen', 'Thai'),
('C017', 'Truc', 'Bui');

INSERT INTO Service VALUES -- serviceID, serviceName, type, itemPrice
('SV001', 'Manicure', 'Item-based', 25.00),  
('SV002', 'Pedicure', 'Item-based', 30.00),  
('SV003', 'Waxing', 'Item-based', 15.00),  
('SV004', 'Massage', 'Time-based', 0.00), -- LEFT JOIN with TimeService For more information price
('SV005', 'Facial', 'Time-based', 0.00),
('SV006', 'Threading', 'Time-based', 0.00);  

INSERT INTO TimeService VALUES -- qualifiedStaffID, serviceID, timePrice
('ST011', 'SV004', 50.00), -- Service 004
('ST012', 'SV004', 70.00),
('ST005', 'SV006', 69.00), -- Service 006
('ST007', 'SV006', 62.00),
('ST012', 'SV006', 85.00),
('ST005', 'SV005', 36.00), -- Service 005
('ST007', 'SV005', 34.00),
('ST006', 'SV005', 20.00),
('ST011', 'SV005', 28.00),
('ST012', 'SV005', 40.00);

INSERT INTO Booking VALUES
-- bookingID, bookingStaffID, clientID, serviceID, bookedDate, startTime, finishTime, duration
-- but duration is automatically calculated
('B001', 'ST004', 'C001', 'SV004', '2024-10-08', '10:00:00', '11:20:00'),  -- 2024-10-08
('B002', 'ST003', 'C006', 'SV003', '2024-10-08', '11:30:00', '11:50:00'), 
('B003', 'ST002', 'C008', 'SV002', '2024-10-08', '10:45:00', '12:15:00'),  
('B004', 'ST004', 'C001', 'SV002', '2024-10-08', '11:30:00', '13:00:00'), 
('B005', 'ST012', 'C017', 'SV006', '2024-10-09', '09:00:00', '09:45:00'),  -- 2024-10-09
('B006', 'ST009', 'C013', 'SV002', '2024-10-09', '10:00:00', '11:30:00'),  
('B007', 'ST012', 'C017', 'SV005', '2024-10-09', '10:45:00', '11:15:00'), 
('B008', 'ST004', 'C009', 'SV001', '2024-10-09', '12:30:00', '14:00:00'), 
('B009', 'ST003', 'C010', 'SV003', '2024-10-10', '10:00:00', '10:20:00'),  -- 2024-10-10
('B010', 'ST003', 'C011', 'SV003', '2024-10-10', '11:00:00', '11:20:00'),
('B011', 'ST004', 'C014', 'SV004', '2024-10-15', '10:00:00', '11:00:00'),  -- 2024-10-15
('B012', 'ST004', 'C014', 'SV006', '2024-10-15', '11:15:00', '12:00:00'),
('B013', 'ST004', 'C008', 'SV004', '2024-10-16', '10:45:00', '11:45:00'),  -- 2024-10-16
('B014', 'ST003', 'C004', 'SV003', '2024-10-20', '11:30:00', '11:50:00'),  -- 2024-10-20
('B015', 'ST003', 'C007', 'SV003', '2024-10-20', '10:00:00', '10:20:00'),
('B016', 'ST005', 'C015', 'SV005', '2024-10-29', '11:30:00', '12:00:00'),  -- 2024-10-29
('B017', 'ST006', 'C003', 'SV006', '2024-10-29', '10:45:00', '11:30:00'),  
('B018', 'ST001', 'C001', 'SV001', '2024-10-29', '11:30:00', '13:00:00'), 
('B019', 'ST008', 'C002', 'SV003', '2024-11-03', '10:00:00', '10:45:00'),  -- 2024-11-03
('B020', 'ST010', 'C017', 'SV001', '2024-11-11', '11:30:00', '13:00:00'),  -- 2024-11-11
('B021', 'ST010', 'C017', 'SV003', '2024-11-11', '13:10:00', '11:30:00'),  
('B022', 'ST003', 'C014', 'SV001', '2024-11-11', '10:30:00', '12:00:00'),
('B023', 'ST003', 'C014', 'SV002', '2024-11-11', '12:30:00', '14:00:00'),  
('B024', 'ST003', 'C013', 'SV004', '2024-11-11', '11:30:00', '12:50:00'),
('B025', 'ST003', 'C012', 'SV006', '2024-11-14', '10:45:00', '11:30:00'),  -- 2024-11-14
('B026', 'ST003', 'C012', 'SV005', '2024-11-14', '11:30:00', '12:45:00');

INSERT INTO Therapy VALUES -- bookingID, performStaffID, quantityItemUsed
('B001', 'ST011', 0),  
('B002', 'ST005', 8), 
('B003', 'ST010', 5),  
('B004', 'ST006', 10), 
('B005', 'ST007', 0),  
('B006', 'ST008', 7),  
('B007', 'ST007', 0), 
('B008', 'ST009', 9), 
('B009', 'ST008', 3), 
('B010', 'ST008', 4),
('B011', 'ST012', 0),  
('B012', 'ST012', 0),
('B013', 'ST011', 0),  
('B014', 'ST005', 8), 
('B015', 'ST009', 9),  
('B016', 'ST011', 0),  
('B017', 'ST005', 0), 
('B018', 'ST010', 3), 
('B019', 'ST009', 4), 
('B020', 'ST008', 2),
('B021', 'ST008', 4),  
('B022', 'ST009', 1), 
('B023', 'ST009', 2),  
('B024', 'ST011', 0), 
('B025', 'ST012', 0),  
('B026', 'ST012', 0);
