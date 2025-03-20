-- Insert table
INSERT INTO medic VALUES -- ID, name
('M01', 'Ai Nu Pham'),
('M02', 'David Juju'),
('M03', 'Ari Nguyen'),
('M04', 'Namnam Nguyen'),
('M05', 'Tuyet Sam Tran'),
('M06', 'Swuzz Ba');

INSERT INTO patient VALUES -- ID, name
('P01', 'BaThuy Nguyen'),
('P02', 'QuinQuen Nguyen'),
('P03', 'BaHoa Truong'),
('P04', 'Minki Kim'),
('P05', 'GeonHee Oh'),
('P06', 'Elio Nguyen'),
('P07', 'Sakura Miyawaki'),
('P08', 'Francis Nguyen'),
('P09', 'Lucy Hy'),
('P10', 'Robbie Hilder');

INSERT INTO herb VALUES -- ID, name, unit, price
('H001', 'Echinacea', 'capsule', 15.00),     
('H012', 'Ginseng', 'gram', 30.00),          
('H014', 'Lavender', 'bunch', 10.00),        
('H016', 'Peppermint', 'bottle', 25.00),     
('H020', 'Ginger', 'piece', 5.00),            
('H028', 'Chamomile', 'box', 20.00),          
('H032', 'Turmeric', 'gram', 12.00),           
('H049', 'Valerian Root', 'capsule', 18.00);

INSERT INTO diagnosis VALUES -- ID, description, date, medicID, patientID
('D001', 'Flu and fever', '2024-07-01', 'M03', 'P02'),
('D003', 'Tired', '2024-07-02', 'M04', 'P03'),
('D005', 'Narcissistic Personality Disorder', '2024-08-03',  'M06', 'P06'),
('D006', 'Depression and anxiety', '2024-08-04', 'M05', 'P07'),
('D009', 'Diarrhea', '2024-09-02', 'M02', 'P01'),
('D011', 'Allergic reaction', '2024-09-04', 'M06', 'P08'),
('D014', 'Flu, fever and headaches', '2024-09-05', 'M03', 'P02'),
('D027', 'Lack of sleep', '2024-09-06', 'M01', 'P08');

INSERT INTO prescription VALUES -- prescriptionID, date, medicID, patientID
('PCT001', '2024-07-03', 'M03', 'P02'), 
('PCT002', '2024-07-03', 'M04', 'P03'),
('PCT003', '2024-08-04', 'M06', 'P06'),
('PCT004', '2024-08-04', 'M05', 'P07'),
('PCT005', '2024-09-05', 'M02', 'P01'),
('PCT006', '2024-09-05', 'M06', 'P08'),
('PCT007', '2024-09-06', 'M03', 'P02'),
('PCT008', '2024-09-06', 'M01', 'P08');

INSERT INTO prescriptionHerb VALUES -- prescriptionID, herbID, quantity
('PCT002', 'H012', 3),
('PCT001', 'H001', 2), 
('PCT001', 'H016', 1),  
('PCT002', 'H049', 1), 
('PCT003', 'H028', 2), 
('PCT004', 'H014', 2), 
('PCT004', 'H032', 1), 
('PCT004', 'H049', 1),
('PCT003', 'H014', 1),  
('PCT005', 'H016', 3), 
('PCT005', 'H020', 2), 
('PCT006', 'H012', 1), 
('PCT007', 'H012', 2), 
('PCT008', 'H028', 3), 
('PCT007', 'H014', 1), 
('PCT008', 'H049', 2); 

-- See the table
SELECT * FROM medic;
SELECT * FROM patient;
SELECT * FROM herb;
SELECT * FROM diagnosis;
SELECT * FROM prescription;
SELECT * FROM prescriptionHerb;

-- iii. For a given prescription (number), List all the herbs,
-- corresponding price per unit, and the number of units prescribed (screenshot required).
SELECT 
FROM prescription pct, prescriptionHerb ph, herb h
WHERE pct.prescriptionID = ph.prescriptionID
and h.herbID = ph.herbID
and p.prescriptionID = 'PCT008';