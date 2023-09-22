# SQL Data Analysis Project

This project showcases a series of SQL queries and data analysis on a dataset related to food orders from a food delivery app. The dataset includes two main tables: `OrderDetails` and `Restaurants`.

You can find the Kaggle dataset used in this project [here](https://www.kaggle.com/datasets/mohamedharris/restaurant-order-details).

## Project Overview

The project is divided into several SQL scripts, each addressing specific aspects of the data:

1. **01_data_import.sql**: This script creates the necessary database tables for the project, including `OrderDetails` and `Restaurants`, and imports data from raw Excel files.

2. **02_data_exploration.sql**: Explore key statistics and insights about the dataset, such as:
- Total number of orders
- Average order amount 
- Highest and lowest order amounts
- Average quantity of items ordered
- The most common payment modes

3. **03_customer_analysis.sql**: Analyze customer behavior:
- The average order amount per customer
- The number of distinct customers
- Identifying the top customers by total spending
- Analyzing preferred payment modes for each distinct customer

4. **04_restaurant_performance.sql**: This section focuses on evaluating restaurant performance and includes more advanced SQL queries. It provides insights into:
- Average ratings for each restaurant
- Average order amount and quantity of items for each restaurant
- The number of restaurants in each cuisine category
- The restaurant with the fastest delivery in each zone
- Favourite restaurant and cuisine of each customer


## Requirements

To run and work with this project, you'll need the following:

- SQL Server Management Studio
- Excel (for importing data from Excel files)

