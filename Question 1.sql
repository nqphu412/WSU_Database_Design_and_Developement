-- Drop everything if wish to reset the data
-- DROP TABLE Author, Reviewer, Book, Report;

-- iii. Create 4 tables 
CREATE TABLE Author(
    authorID NUMERIC(10,0),
    name varchar(50),
    CONSTRAINT author_pk PRIMARY KEY (authorID),
);

CREATE TABLE Reviewer(
    reviewerID NUMERIC(10,0),
    name varchar(50),
    CONSTRAINT reviewer_pk PRIMARY KEY (reviewerID),
);

CREATE TABLE Book(
    bookID NUMERIC(10,0),
    title varchar(100),
    authorID NUMERIC(10,0),
    CONSTRAINT book_pk PRIMARY KEY (reviewerID),
    CONSTRAINT book_fk FOREIGN KEY (authorID) REFERENCES Author,
);

CREATE TABLE Report(
    bookID NUMERIC(10,0),
    reviewerID NUMERIC(10,0),
    rating INTEGER CHECK (rating BETWEEN 1 AND 5),
    postedDate DATE,
    CONSTRAINT report_pk PRIMARY KEY (bookID, reviewerID),
    CONSTRAINT report_fk1 FOREIGN KEY (bookID) REFERENCES Book,
    CONSTRAINT report_fk2 FOREIGN KEY (reviewerID) REFERENCES Reviewer,
);

-- See (blank) table creation
SELECT * FROM Author;
SELECT * FROM Reviewer;
SELECT * FROM Book;
SELECT * FROM Report;

-- iv. Insert values
INSERT INTO Author VALUES 
(1, 'JK Rowling'),
(2, 'George RR Martin'),
(3, 'JRR Tolkien'),
(4, 'CS Lewis'),
(5, 'Elio Nguyen'),
(6, 'Du Nguyen'),
(7, 'Lan Kim');

INSERT INTO Reviewer VALUES 
(11, 'Charlie Nguyen'),
(12, 'Rosy Ta'),
(13, 'Ken Lin'),
(14, 'Celine Tran'),
(15, 'BaHoa Truong'),
(16, 'BaThuy Nguyen'),
(17, 'QuinQuen Nguyen');

INSERT INTO Book VALUES
(1, 'Harry Potter and the Deathly Hallows', 1),
(2, 'Harry Potter and the Chamber of Secrets', 1),
(3, 'Harry Potter and the Prisoner of Azkaban', 1),
(4, 'A Game of Thrones', 2),
(5, 'The Fellowship of the Ring', 3),
(6, 'The Two Towers', 3),
(7, 'My life from nqphu_412', 5),
(8, 'Kieu Story', 6),
(9, 'Picked Wife - The Future Hunter', 7),
(10, 'Village', 7);

INSERT INTO Report VALUES
(7, 11, 5, '2002-12-04'),
(8, 15, 4, '2002-12-04'),
(9, 15, 5, '2002-12-04'),
(1, 17, 3, '2002-12-04'),
(10, 15, 5, '2002-12-04'),
(5, 5, 2, '2002-12-04'),
(8, 16, 4, '2002-12-04'),
(9, 16, 3, '2002-12-04'),
(9, 5, 2, '2002-12-04');

-- See table after inserting value
SELECT * FROM Author;
SELECT * FROM Reviewer;
SELECT * FROM Book;
SELECT * FROM Report;

