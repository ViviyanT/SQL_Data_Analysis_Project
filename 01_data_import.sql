-- 01_data_import.sql

CREATE TABLE OrderDetails (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255),
    RestaurantID INT,
    QuantityOfItems INT,
    OrderAmount INT,
    PaymentMode VARCHAR(50),
    DeliveryTimeTakenMinutes INT,
    CustomerRatingFood INT,
    CustomerRatingDelivery INT
);

CREATE TABLE Restaurants (
    RestaurantID INT PRIMARY KEY,
    RestaurantName VARCHAR(255),
    Cuisine VARCHAR(100),
    Zone VARCHAR(50),
    Category VARCHAR(50)
);
