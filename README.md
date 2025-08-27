# 📊 Zepto Product Data Analysis - SQL Project

## 📝 Overview  
This project involves the analysis of a product dataset from a company named **Zepto**.  
The goal is to explore, clean, and derive meaningful business insights from the data using **SQL**.  

The SQL script performs several key tasks, from initial data exploration and cleaning to answering specific business questions related to product pricing, inventory, and category performance.  

---

## 🛠️ Tools Used  
- **Database:** MySQL  

---

## 🗄️ Database and Table Schema  

The project uses a single database and one primary table to store the product data.  

- **Database Name:** `Zepto_SQL_Project`  

### Zepto Table Schema  

| Column Name          | Data Type       | Description                                                                 |
|-----------------------|-----------------|-----------------------------------------------------------------------------|
| `sku_id`             | INT             | A unique identifier for each product (**Primary Key**).                     |
| `category`           | VARCHAR(120)    | The product category (e.g., *Snacks*, *Beverages*).                         |
| `name`               | VARCHAR(150)    | The name of the product.                                                    |
| `mrp`                | NUMERIC(8,2)    | The Maximum Retail Price of the product.                                    |
| `discountPercent`    | NUMERIC(5,2)    | The discount percentage offered on the product.                             |
| `availableQuantity`  | INT             | The current stock quantity available for the product.                       |
| `discountSellingPrice` | NUMERIC(8,3) | The final selling price after the discount is applied.                      |
| `weightInGms`        | INT             | The weight of the product in grams.                                         |
| `outOfStock`         | BOOLEAN         | A flag to indicate if the product is out of stock (**1 = true, 0 = false**).|
| `quantity`           | INT             | An additional quantity field (e.g., pack size).                             |

---

## 🚀 Project Workflow  

The SQL script is structured into four main parts:  

1. **Setup**: Creates the database and the Zepto table schema.  
2. **Data Exploration**: Performs initial checks (row count, null values, distinct categories).  
3. **Data Cleaning**: Removes invalid rows (e.g., zero price) and standardizes values (paise → rupees).  
4. **Data Analysis**: Executes queries to answer specific business questions.  

---

## ❓ Business Questions Addressed  

- **Top 10 Best-Value Products** → Products with the highest discount percentage.  
- **High MRP & Out of Stock** → Products with MRP > 300 that are currently out of stock.  
- **Estimated Revenue by Category** → Total estimated revenue for each category.  
- **Premium Products with Low Discounts** → Products with MRP > 500 but discount < 10%.  
- **Top 5 Discount-Heavy Categories** → Categories with the highest average discount %.  
- **Price Per Gram Analysis** → Price per gram for products ≥ 100g.  
- **Product Weight Categorization** → Group products into *Low*, *Medium*, and *Bulk*.  
- **Total Inventory Weight by Category** → Total weight of all available stock per category.  

---

## ▶️ How to Use  

1. **Setup the Database**  
   ```sql
   CREATE DATABASE Zepto_SQL_Project;
   USE Zepto_SQL_Project;

2. **Create the Table**  
   CREATE TABLE Zepto (
    sku_id INT PRIMARY KEY,
    category VARCHAR(120),
    name VARCHAR(150),
    mrp NUMERIC(8,2),
    discountPercent NUMERIC(5,2),
    availableQuantity INT,
    discountSellingPrice NUMERIC(8,3),
    weightInGms INT,
    outOfStock BOOLEAN,
    quantity INT
);


3. **Import Data**  
   Load the `zepto_v2.csv` dataset into the **Zepto** table using the following command.  
   Remember to update the file path:  

   ```sql
   LOAD DATA LOCAL INFILE 'C:/path/to/your/file/zepto_v2.csv'
   INTO TABLE Zepto
   FIELDS TERMINATED BY ','
   ENCLOSED BY '"'
   LINES TERMINATED BY '\n'
   IGNORE 1 ROWS;

⚠️ **Notes**  

- Ensure that boolean values (`outOfStock` column) in your source file are represented as **1 (true)** and **0 (false)** to avoid import errors.  
- If you encounter an error like **"Loading local data is disabled"**, you may need to enable the `local_infile` setting in your MySQL server and connection settings.  

---

## ▶️ Run Queries  
Execute the **data exploration, cleaning, and analysis queries** to see the results.  

