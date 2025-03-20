-- v. List authors whose name contain my family name
SELECT fullName
FROM Author
WHERE name LIKE '%Nguyen%';

-- vi. List reviewer's name and rating for a book
SELECT Reviewer.fullName, rating
FROM Report, Reviewer
WHERE Report.reviewerID = Reviewer.reviewerID
and Report.bookID = 9; -- Replace this if wish to see rating for different books

-- vii. List book's title, reviewer's name and rating
SELECT title, Reviewer.fullName, rating, postedDate
FROM Report, Reviewer, Book
WHERE Report.bookID = Book.bookID
and Report.reviewerID = Reviewer.reviewerID
ORDER BY title ASC,
Reviewer.fullName ASC,
postedDate ASC;