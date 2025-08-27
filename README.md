Zepto Product Data Analysis - SQL Project
📝 Overview
This project involves the analysis of a product dataset from a company named Zepto. The goal is to explore, clean, and derive meaningful business insights from the data using SQL. The SQL script performs several key tasks, from initial data exploration and cleaning to answering specific business questions related to product pricing, inventory, and category performance.

🛠️ Tools Used
Database: MySQL

🗄️ Database and Table Schema
The project uses a single database and one primary table to store the product data.

Database Name: Zepto_SQL_Project

Zepto Table Schema
This table holds all the information related to the products.

Column Name

Data Type

Description

sku_id

INT

A unique identifier for each product (Primary Key).

category

VARCHAR(120)

The product category (e.g., 'Snacks', 'Beverages').

name

VARCHAR(150)

The name of the product.

mrp

NUMERIC(8,2)

The Maximum Retail Price of the product.

discountPercent

NUMERIC(5,2)

The discount percentage offered on the product.

availableQuantity

INT

The current stock quantity available for the product.

discountSellingPrice

NUMERIC(8,3)

The final selling price after the discount is applied.

weightInGms

INT

The weight of the product in grams.

outOfStock

BOOLEAN

A flag to indicate if the product is out of stock (1 for true, 0 for false).

quantity

INT

An additional quantity field (e.g., pack size).

🚀 Project Workflow
The SQL script is structured into four main parts:

Setup: Creates the database and the Zepto table schema.

Data Exploration: Performs initial checks to understand the structure and quality of the data. This includes counting rows, checking for null values, and identifying distinct categories.

Data Cleaning: Cleans the data to ensure accuracy for analysis. This involves removing products with zero price and standardizing currency values from paise to rupees.

Data Analysis: Executes a series of queries to answer specific business questions.

❓ Business Questions Addressed
The analysis phase focuses on answering the following key questions:

Top 10 Best-Value Products: What are the top 10 products with the highest discount percentage?

High MRP & Out of Stock: Which products with an MRP over 300 are currently out of stock?

Estimated Revenue by Category: What is the total estimated revenue for each product category?

Premium Products with Low Discounts: Which products have an MRP greater than 500 but a discount of less than 10%?

Top 5 Discount-Heavy Categories: Which 5 categories offer the highest average discount percentage?

Price Per Gram Analysis: What is the price per gram for products weighing 100g or more?

Product Weight Categorization: How can products be grouped into 'Low', 'Medium', and 'Bulk' weight categories?

Total Inventory Weight by Category: What is the total weight of all available inventory for each category?

▶️ How to Use
Setup the Database: Run the initial CREATE DATABASE and USE commands.

Create the Table: Execute the CREATE TABLE Zepto... statement.

Import Data: Load the zepto_v2.csv dataset into the Zepto table using the following command. Remember to update the file path.

LOAD DATA LOCAL INFILE 'C:/path/to/your/file/zepto_v2.csv'
INTO TABLE Zepto
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

Note 1: Ensure that boolean values (outOfStock column) in your source file are represented as 1 for true and 0 for false to avoid import errors.

Note 2: If you encounter an error like Loading local data is disabled, you may need to enable the local_infile setting in your MySQL server and connection settings.

Run Queries: Execute the data exploration, cleaning, and analysis queries to see the results.
