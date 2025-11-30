----------------------
-- Question 3(i) - Create the database tables in SQL with relevant constraints
-- Fill the tables with sufficient data
-- List the content of your tables with screenshots.
----------------------
SELECT * FROM Staff;
SELECT * FROM Client;
SELECT * FROM Service;
SELECT * FROM TimeService;
SELECT * FROM Booking;
SELECT * FROM Therapy;

----------------------
-- Question 3(ii) - SQL command to fulfill following tasks with screenshot
-- a. List all the timed services along with the therapists who can provide such services. 
-- The list should be sorted alphabetically in the service names.
----------------------
SELECT serviceName, (st.staffFname + ' ' + st.staffLname) AS staffFullName
FROM Service s
LEFT JOIN TimeService ts ON s.serviceID = ts.serviceID
LEFT JOIN Staff st ON st.staffID = ts.staffID
WHERE type = 'Time-based'
ORDER BY serviceName ASC;

----------------------
-- Question 3(ii) - SQL command to fulfill following tasks with screenshot
-- b. For a given day, (2024-11-11) list all the names of the therapists who have/had 
-- at least one booking on that day. Don't repeat the names in the list.
----------------------
SELECT DISTINCT (s.staffFname + ' ' + s.staffLname) AS staffFullName
FROM Booking b 
JOIN Therapy t ON b.bookingID = t.bookingID
JOIN Staff s ON t.performStaffID = s.staffID
WHERE bookedDate = '2024-11-11';

SELECT (s.staffFname + ' ' + s.staffLname) AS staffFullName
FROM Booking b 
JOIN Therapy t ON b.bookingID = t.bookingID
JOIN Staff s ON t.performStaffID = s.staffID
WHERE b.bookedDate = '2024-11-11'
GROUP BY (s.staffFname + ' ' + s.staffLname) ;

----------------------
-- Question 3(ii) - SQL command to fulfill following tasks with screenshot
-- c. List the names of all the clients along with the corresponding total number of bookings.
----------------------
SELECT (clientFname + ' ' + clientLname) AS clientName, COUNT(b.clientID)
FROM Booking b
JOIN Client c ON b.clientID = c.clientID
GROUP BY b.clientID;

----------------------
-- Question 3(ii) - SQL command to fulfill following tasks with screenshot
-- d. List all therapists and the corresponding therapeutic services they are registered to provide 
-- Sort the output according to their staff name, service type (timed or itemised), the name of the service.
----------------------
SELECT 
    (st.staffFname + ' ' + st.staffLname) AS staffFullName,
    s.serviceName,
    s.type AS serviceType
FROM 
    Staff st
LEFT JOIN 
    TimeService ts ON st.staffID = ts.qualifiedStaffID
LEFT JOIN 
    Service s ON ts.serviceID = s.serviceID OR s.type = 'Item-based'
ORDER BY 
    (st.staffFname + ' ' + st.staffLname),
    s.type,
    s.serviceName;

----------------------
-- Question 3(ii) - SQL command to fulfill following tasks with screenshot
-- e. For each timed service, list the names of the therapists whose hourly rates are the cheapest,
-- along with their actual hourly rates.
----------------------
