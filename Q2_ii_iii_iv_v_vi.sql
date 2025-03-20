-- Upload table (taken from the school web)

-- ii. Update with my information
UPDATE Staff 
SET fName = 'Quang Phu', lName = 'Nguyen', DOB = '12/04/2002'
WHERE fName = 'Julie'
and lName = 'Lee';

SELECT * FROM Staff;

-- iii. Name, position, gender, annual salary for those who earn 25000 per annum
SELECT fName, lName, position, sex, salary
FROM Staff
WHERE salary > 25000;

-- iv. propertyNo, postcode, name of the owner 
-- Sort owner name alphabetically
SELECT propertyNo, postcode, fName, lName
FROM PropertyForRent, PrivateOwner
WHERE PropertyForRent.ownerNo = PrivateOwner.ownerNo
ORDER BY lName ASC,
fName ASC;

-- v. List all the properties that have been viewed
-- postcode, propertyNo, street of property, 
-- last name of staff responsible for this property, 
-- client's last name, and the viewing date. 
-- Order the output by the postcode, then street 
SELECT postcode, v.propertyNo, street, 
    s.lName AS staffLastName, 
    c.lName AS clientLastName, viewDate
FROM PropertyForRent p, Staff s, Client c, Viewing v
WHERE PropertyForRent.staffNo = Staff.staffNo
and PropertyForRent.propertyNo = Viewing.propertyNo
and Client.clientNo = Viewing.clientNo
ORDER BY postcode ASC,
street ASC;

-- vi. List for all properties for rent the propertyNo, the city where the property is located,
-- the city of the branch which is contracted to the property,
-- the city of the branch that provides the individual staff who handles the actual renting of the property
SELECT propertyNo, p.city AS cityProperty, 
    bp.city AS cityBranchContracted,
    bs.city AS cityBranchStaff
FROM PropertyForRent p, Staff s,
    Branch bp, -- To join Branch with PropertyForRent
    Branch bs  -- To join Branch with Staff
WHERE p.branchNo = bp.branchNo
and s.branchNo = bs.branchNo;