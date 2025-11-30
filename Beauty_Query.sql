----------------------
-- Question 3(i) - Show table result
----------------------
SELECT * FROM Beauty_Staff;
SELECT * FROM Beauty_Client;
SELECT * FROM Beauty_Service;
SELECT * FROM Beauty_TimeService;
SELECT * FROM Beauty_Booking;
SELECT * FROM Beauty_Therapy;

----------------------
-- Question 3(ii) - SQL command to fulfill following tasks with screenshot
-- a. List all the timed services along with the therapists who can provide such services. 
-- The list should be sorted alphabetically in the service names.
----------------------
SELECT serviceName, (st.staffFname + ' ' + st.staffLname) AS staffFullName
FROM Beauty_Service s
LEFT JOIN Beauty_TimeService ts ON s.serviceID = ts.serviceID
LEFT JOIN Beauty_Staff st ON st.staffID = ts.qualifiedStaffID
WHERE type = 'Time-based'
ORDER BY serviceName ASC;

----------------------
-- Question 3(ii) - SQL command to fulfill following tasks with screenshot
-- b. For a given day, (2024-11-11) list all the names of the therapists who have/had 
-- at least one booking on that day. Don't repeat the names in the list.
----------------------
SELECT DISTINCT (s.staffFname + ' ' + s.staffLname) AS staffFullName
FROM Beauty_Booking b 
JOIN Beauty_Therapy t ON b.bookingID = t.bookingID
JOIN Beauty_Staff s ON t.performStaffID = s.staffID
WHERE bookedDate = '2024-11-11';

----------------------
-- Question 3(ii) - SQL command to fulfill following tasks with screenshot
-- c. List the names of all the clients along with the corresponding total number of bookings.
----------------------
SELECT (clientFname + ' ' + clientLname) AS clientName, 
	COUNT(clientFname + ' ' + clientLname)
FROM Beauty_Booking b
LEFT JOIN Beauty_Client c ON c.clientID = b.clientID
WHERE b.clientID != 'Walk-in' -- Excluding Walk-in clients
GROUP BY (clientFname + ' ' + clientLname);

----------------------
-- Question 3(ii) - SQL command to fulfill following tasks with screenshot
-- d. List all therapists and the corresponding therapeutic services they are registered to provide 
-- Sort the output according to their staff name, service type (timed or itemised), the name of the service.
----------------------
SELECT 
    DISTINCT staffFullName, type AS serviceType, serviceName
FROM 
    (SELECT staffID, (staffFName + ' ' + staffLName) AS staffFullName
	FROM Beauty_Staff
	WHERE position = 'Beauty Therapist') AS st -- Only Beauty Therapist can perform services
LEFT JOIN 
    Beauty_TimeService ts ON st.staffID = ts.qualifiedStaffID
LEFT JOIN 
    Beauty_Service s ON s.type = 'Item-based' OR ts.serviceID = s.serviceID 
ORDER BY 
    st.staffFullName, s.type, s.serviceName;

---------------------- 
-- Question 3(ii) - SQL command to fulfill following tasks with screenshot
-- e. For each timed service, list the names of the therapists whose hourly rates are the cheapest,
-- along with their actual hourly rates.
----------------------
SELECT serviceName, staffFName + ' ' + staffLName AS staffFullName, cheapestPrice
FROM Beauty_TimeService ts -- This only includes timed service
JOIN 
	Beauty_Service s ON ts.serviceID = s.serviceID
LEFT JOIN 
	Beauty_Staff st ON st.staffID = ts.qualifiedStaffID
LEFT JOIN ( -- This is a table that includes only services with their corresponding cheapest price
	SELECT ts2.serviceID, MIN(ts2.timePrice) AS cheapestPrice
	FROM Beauty_TimeService ts2
	GROUP BY ts2.serviceID
	) AS minPrice ON minPrice.serviceID = ts.serviceID
WHERE timePrice = cheapestPrice;

-- Extra: Calculate total price for each therapy
-- Base for later use
SELECT b.bookingID, type, duration, quantityItemUsed, itemPrice, timePrice,
	CASE 
        WHEN type = 'Item-based' THEN quantityItemUsed*itemPrice
        WHEN type = 'Time-based' THEN duration*timePrice/60
    END AS TotalCost
FROM Beauty_Booking b
JOIN Beauty_Therapy t ON b.bookingID = t.bookingID
LEFT JOIN Beauty_Service s ON b.serviceID = s.serviceID
LEFT JOIN Beauty_TimeService ts ON ts.qualifiedStaffID = t.performStaffID AND ts.serviceID = b.serviceID;

---------------------- 
-- Question 3(iii) - Indicate a scenario that business current database integrity is not ensured
-- SQL code and screenshot
----------------------
-- Scenario 1: Assigning �not� qualified therapist to perform a time-based service
INSERT INTO Beauty_Booking VALUES
('B027', 'ST004', 'C002', 'SV004', '2024-11-15', '10:10:00', '11:50:00');

INSERT INTO Beauty_Therapy VALUES 
('B027', 'ST007', 3);

/*
DELETE FROM Beauty_Booking WHERE bookingID = 'B027';
DELETE FROM Beauty_Therapy WHERE bookingID = 'B027';
*/

SELECT b.bookingID, type, duration, quantityItemUsed, itemPrice, timePrice,
	CASE 
        WHEN type = 'Item-based' THEN quantityItemUsed*itemPrice
        WHEN type = 'Time-based' THEN duration*timePrice/60
    END AS TotalCost
FROM Beauty_Booking b
JOIN Beauty_Therapy t ON b.bookingID = t.bookingID
LEFT JOIN Beauty_Service s ON b.serviceID = s.serviceID
LEFT JOIN Beauty_TimeService ts ON ts.qualifiedStaffID = t.performStaffID AND ts.serviceID = b.serviceID
WHERE b.bookingID = 'B027';

-- Scenario 2: Booking staff allow client to book overlapping timeslot
INSERT INTO Beauty_Booking VALUES
('B027', 'ST004', 'C002', 'SV004', '2024-11-15', '10:10:00', '11:50:00'),
('B028', 'ST004', 'C002', 'SV001', '2024-11-15', '10:30:00', '11:40:00');

/*
DELETE FROM Beauty_Booking WHERE bookingID = 'B027';
DELETE FROM Beauty_Booking WHERE bookingID = 'B028';
*/

SELECT * FROM Beauty_Booking
WHERE bookedDate = '2024-11-15';
