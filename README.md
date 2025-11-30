# Salon Booking System — Database Design & Development

## Table of Contents
- [Overview](#overview)
- [Database-Planning](#database-planning)
- [Tasks](#tasks)
  - [Schema-Design](#schema-design)
  - [Example-Queries](#example-queries)
- [Results-Summary](#results-summary)

---

## Overview
This project implements a complete SQL-based relational database for a **Salon Booking System**.  
It models customers, staff, services, availability schedules, and appointment bookings using a normalized schema.  
This project was submitted as the final assessment for the Database Design & Development unit and received a **score of 100/100**.

---

## Database Planning
1. Identify required business entities.  
2. Define relational structure, primary keys, and foreign keys.  
3. Normalize schema to **3NF**.  
4. Produce two diagram files:  
   - **Enhanced_RelationDiagram.pdf**  
   - **RelationDiagram.pdf**  
5. Prepare three SQL files:  
   - **Beauty_Table_Creation.sql**  
   - **Beauty_Data_Insert.sql**  
   - **Beauty_Query.sql**

---

## Tasks

### Schema Design
- **Tables**
  - Staff (including both non-therapist, for example, manager and receptionist; and therapist staffs)
  - Client  
  - Service (with price with type of service, for example, time-based and item-based)
  - TimeService (containing both qualified staff ID and the service ID with duration time)
  - Booking (save client information with their prefered timeslot)
  - Therapy (table assigning booking ID to staff ID)  

- **Key Result**
  - Normalized relational schema supporting booking and scheduling operations
  - Limitation: Assigning non-qualified therapist to perform a time-based service or Booking-staff allow client to book overlapping timeslot (shown in the code snippet)

---

### Example Queries
- **Query Types**
  - Check available staff for a service/time  
  - Retrieve service price list  
  - View upcoming appointments  
  - Customer booking history   
  - Staff specialization lookup  

- **Example**
```sql
-- Extra: Calculate total price for each therapy booking
SELECT b.bookingID, type, duration, quantityItemUsed, itemPrice, timePrice,
	CASE 
        WHEN type = 'Item-based' THEN quantityItemUsed*itemPrice
        WHEN type = 'Time-based' THEN duration*timePrice/60
    END AS TotalCost
FROM Beauty_Booking b
JOIN Beauty_Therapy t ON b.bookingID = t.bookingID
LEFT JOIN Beauty_Service s ON b.serviceID = s.serviceID
LEFT JOIN Beauty_TimeService ts ON ts.qualifiedStaffID = t.performStaffID AND ts.serviceID = b.serviceID;
```

---

## Results Summary

| Component | Status |
|----------|--------|
| Schema Design | ✔ Completed |
| Table Creation (DDL) | ✔ Completed |
| Data Insertion | ✔ Completed |
| Example Queries | ✔ Completed |
| ER Diagrams | ✔ Completed |
| Final Unit Score | **100/100** |
