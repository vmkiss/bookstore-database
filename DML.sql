-- Group 25 Data Manipulation Queries
-- : used to denote values that will contain variables readable by NodeJS

-- Books table CRUD operations
SELECT Books.bookId, Publishers.publisherName as Publisher, Authors.authorName as Author, Books.title, Books.genre, 
Books.price, Books.inventoryQty
	FROM Books
    INNER JOIN Authors ON Authors.authorID = Books.authorID
    INNER JOIN Publishers ON Publishers.publisherID = Books.publisherID;

INSERT INTO Books (title, authorID, publisherID, genre, price, inventoryQty)
VALUES (:titleInput, (SELECT authorID FROM Authors WHERE :authorInput = Authors.authorName), 
	   (SELECT publisherID FROM Publishers WHERE :publisherInput = Publishers.publisherName), 
       :genreInput, :priceInput, :inventoryQtyInput);
    
UPDATE Books 
SET Books.title = :titleInput, Books.authorID = (SELECT authorID FROM Authors WHERE :authorInput = Authors.authorName),
	Books.publisherID = (SELECT publisherID FROM Publishers WHERE :publisherInput = Publishers.publisherName),
    Books.genre = :genreInput, Books.price = :priceInput, Books.inventoryQty = :inventoryQtyInput;
    
DELETE FROM Books WHERE Books.title = :titleInput;

--Authors table CRUD operations
SELECT authors.authorID, authors.authorName, Publishers.publisherName as Publisher
    FROM Authors
    INNER JOIN Publishers ON Publishers.publisherID = Authors.publisherID;

INSERT INTO Authors (authorName, publisherID)
VALUES (:authorInput, (SELECT publisherID FROM Publishers WHERE :publisherInput = Publishers.publisherName));

-- Purchases table CRUD operations
SELECT Purchases.purchaseID, Customers.customerName as Customer, Purchases.datePlaced, Purchases.totalPrice, 
Purchases.purchaseStatus
	FROM Customers
    INNER JOIN Purchases ON Customers.customerID = Purchases.customerID;

INSERT INTO Purchases (purchaseID, datePlaced, totalPrice, purchaseStatus)
VALUES :purchaseIDInput, :datePlacedInput, :totalPriceInput, :purchaseStatusInput;
    
UPDATE Purchases
SET Purchases.purchaseID = :purchaseIDInput, Purchases.datePlaced = :datePlacedInput, Purchases.totalPrice = :totalPriceInput, 
Purchases.purchaseStatus = purchaseStatusInput;
    
DELETE FROM Purchases WHERE purchaseID = :purchaseIDInput;

    
-- Book_purchases (intersection) table CRUD operations
SELECT Book_purchases.bookPurchasesID, Books.title as Book, Purchases.purchaseID as PurchaseID, 
Book_purchases.invoiceDate, Book_purchases.orderQty, Book_purchases.unitPrice, Book_purchases.lineTotal
	FROM Book_purchases
    INNER JOIN Books ON Books.bookID = Book_purchases.bookID
    INNER JOIN Purchases ON Book_purchases.purchaseID = Purchases.purchaseID;

INSERT INTO Book_purchases (bookPurchasesID, invoiceDate, orderQty, unitPrice, lineTotal)
VALUES :bookPurchaseIDInput, :invoiceDateInput; :orderQtyInput, :unitPriceInput, :lineTotalInput;

UPDATE Book_purchases
SET Book_purchases.bookPurchasesID = :bookPurchaseInputID, Book_purchases.invoiceDate = :invoiceDateInput,
Book_purchases.orderQty = :orderQtyInput, Book_purchases.unitPrice = :unitPriceInput, Book_purchases.lineTotal = lineTotalInput;

DELETE FROM Book_purchases WHERE Book_purchaseID = :bookPurchaseIDInput;


