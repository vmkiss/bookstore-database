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

-- Authors table CRUD operations
SELECT Authors.authorID, Authors.authorName, Publishers.publisherName as Publisher
    FROM Authors
    INNER JOIN Publishers ON Publishers.publisherID = Authors.publisherID;

INSERT INTO Authors (authorName, publisherID)
VALUES (:authorInput, (SELECT publisherID FROM Publishers WHERE :publisherInput = Publishers.publisherName));


-- Publishers table CRUD operations
SELECT publisherID, publisherName, publisherAddress, publisherCity, publisherState, publisherZip
FROM Publishers;

INSERT INTO Publishers (publisherName, publisherAddress, publisherCity, publisherState, publisherZip)
VALUES (:publisherNameInput, :publisherAddressInput, :publisherCityInput, :publisherStateInput, :publisherZipInput);

-- Customers table CRUD operations
SELECT customerID, customerName, customerPhone, customerEmail, customerAddress, customerCity, customerState, customerZip
    FROM Customers;

INSERT INTO Customers (customerName, customerPhone, customerEmail, customerAddress, customerCity, customerState, customerZip)
VALUES (:customerNameInput, :customerPhoneInput, :customerEmailInput, :customerAddressInput, :customerCityInput, :customerStateInput, :customerZipInput);

UPDATE Customers
SET customerName = :customerNameInput, customerPhone = :customerPhoneInput, customerEmail = :customerEmailInput, customerAddress = :customerAddressInput,
customerCity = :customerCityInput, customerState = :customerStateInput, customerZip = :customerZipInput;


-- Purchases table CRUD operations
SELECT Purchases.purchaseID, Customers.customerName as Customer, Purchases.datePlaced, Purchases.totalPrice, 
Purchases.purchaseStatus
	FROM Customers
    INNER JOIN Purchases ON Customers.customerID = Purchases.customerID;

INSERT INTO Purchases (purchaseID, datePlaced, totalPrice, purchaseStatus)
VALUES (:purchaseIDInput, :datePlacedInput, :totalPriceInput, :purchaseStatusInput);
    
UPDATE Purchases
SET Purchases.purchaseID = :purchaseIDInput, Purchases.datePlaced = :datePlacedInput, Purchases.totalPrice = :totalPriceInput, 
Purchases.purchaseStatus = purchaseStatusInput;
    
DELETE FROM Purchases WHERE purchaseID = :purchaseIDInput;

    
-- BookPurchases (intersection) table CRUD operations
SELECT BookPurchases.bookPurchasesID, Books.title as Book, Purchases.purchaseID as PurchaseID, 
BookPurchases.invoiceDate, BookPurchases.orderQty, BookPurchases.unitPrice, BookPurchases.lineTotal
	FROM BookPurchases
    INNER JOIN Books ON Books.bookID = BookPurchases.bookID
    INNER JOIN Purchases ON BookPurchases.purchaseID = Purchases.purchaseID;

INSERT INTO BookPurchases (bookPurchasesID, invoiceDate, orderQty, unitPrice, lineTotal)
VALUES (:bookPurchaseIDInput, :invoiceDateInput; :orderQtyInput, :unitPriceInput, :lineTotalInput);


UPDATE Book_purchases
SET Book_purchases.bookPurchasesID = :bookPurchaseInputID, Book_purchases.invoiceDate = :invoiceDateInput,
Book_purchases.orderQty = :orderQtyInput, Book_purchases.unitPrice = :unitPriceInput, Book_purchases.lineTotal = lineTotalInput;

DELETE FROM BookPurchases WHERE Book_purchaseID = :bookPurchaseIDInput;


