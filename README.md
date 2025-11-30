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
  - Staff
  - Client  
  - Service  
  - TimeService (containing both qualified staff ID and the service ID with duration time)
  - Booking (save client information with their prefered timeslot)
  - Therapy (table assigning booking ID to staff ID)  

- **Key Result**
  - Fully normalized relational schema supporting booking and scheduling operations

---

### Example Queries
- **Query Types**
  - Check available staff for a service/time  
  - Retrieve service price list  
  - View upcoming appointments  
  - Customer booking history  
  - Conflict detection  
  - Staff specialization lookup  

- **Example**
```sql
SELECT s.name, a.appointment_time
FROM Staff s
JOIN Appointments a ON s.staff_id = a.staff_id
WHERE a.appointment_date = '2025-01-15'
  AND s.staff_id = 4;
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
