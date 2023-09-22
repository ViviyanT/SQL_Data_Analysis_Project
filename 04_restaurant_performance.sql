-- 04_restaurant_analysis.sql

-- 1. Average Ratings for Each Restaurant
SELECT
    R.RestaurantName,
    R.Cuisine,
    AVG(O.CustomerRatingFood) AS AvgRatingFood,
    AVG(O.CustomerRatingDelivery) AS AvgRatingDelivery
FROM
    SQLProject.dbo.Restaurants AS R
LEFT JOIN
    SQLProject.dbo.OrderDetails AS O
ON
    R.RestaurantID = O.RestaurantID
GROUP BY
    R.RestaurantName,
    R.Cuisine;


-- 2. Average Order Amount and Quantity of Items for Each Restaurant
WITH RestaurantPerformance AS (
    SELECT
        R.RestaurantName,
        R.Cuisine,
        AVG(O.OrderAmount) AS AvgOrderAmount,
        AVG(O.QuantityOfItems) AS AvgQuantityOfItems
    FROM
        SQLProject.dbo.Restaurants AS R
    LEFT JOIN
        SQLProject.dbo.OrderDetails AS O
    ON
        R.RestaurantID = O.RestaurantID
    GROUP BY
        R.RestaurantName,
        R.Cuisine
)
SELECT
    RP.RestaurantName,
    RP.Cuisine,
    RP.AvgOrderAmount,
    RP.AvgQuantityOfItems
FROM
    RestaurantPerformance AS RP;


-- 3. Number of Restaurants in Each Category
SELECT
    R.Cuisine,
    COUNT(DISTINCT R.RestaurantID) AS RestaurantCount
FROM
    SQLProject.dbo.Restaurants AS R
GROUP BY
    R.Cuisine
ORDER BY
    RestaurantCount DESC;

-- 4. Restaurant with Fastest Delivery in Each Zone (Based on Average Delivery Time)
WITH AvgDeliveryTimes AS (
    SELECT
        R.Zone,
        R.RestaurantName AS Restaurant,
        AVG(O.DeliveryTimeTakenMinutes) AS AvgDeliveryTime
    FROM
        SQLProject.dbo.Restaurants AS R
    LEFT JOIN
        SQLProject.dbo.OrderDetails AS O
    ON
        R.RestaurantID = O.RestaurantID
    GROUP BY
        R.Zone,
        R.RestaurantName
)
, FastestInEachZone AS (
    SELECT
        ADT.Zone,
        ADT.Restaurant,
        ADT.AvgDeliveryTime,
        ROW_NUMBER() OVER (PARTITION BY ADT.Zone ORDER BY ADT.AvgDeliveryTime ASC) AS ZoneRank
    FROM
        AvgDeliveryTimes AS ADT
)
SELECT
    FZ.Zone,
    FZ.Restaurant AS FastestDeliveryRestaurant,
    FZ.AvgDeliveryTime
FROM
    FastestInEachZone AS FZ
WHERE
    FZ.ZoneRank = 1; 



-- 5. Favorite Restaurant/Cuisine of Every Distinct Customer
WITH CustomerFavorites AS (
    SELECT
        O.CustomerName,
        R.RestaurantName AS FavoriteRestaurant,
        R.Cuisine AS FavoriteCuisine,
        ROW_NUMBER() OVER (PARTITION BY O.CustomerName ORDER BY COUNT(*) DESC) AS Rank
    FROM
        SQLProject.dbo.OrderDetails AS O
    INNER JOIN
        SQLProject.dbo.Restaurants AS R
    ON
        O.RestaurantID = R.RestaurantID
    GROUP BY
        O.CustomerName,
        R.RestaurantName,
        R.Cuisine
)
SELECT
    CF.CustomerName,
    CF.FavoriteRestaurant,
    CF.FavoriteCuisine
FROM
    CustomerFavorites AS CF
WHERE
    CF.Rank = 1; 



