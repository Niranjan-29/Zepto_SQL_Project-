create database Zepto_SQL_Project;
use Zepto_SQL_Project;
drop table if exists Zepto;
create table Zepto(
sku_id int AUTO_INCREMENT PRIMARY key,
category varchar(120),
name varchar(150) not null,
mrp numeric(8,2),
discountPercent numeric(5,2),
availableQuantity int,
discountSellingPrice Numeric(8,3),
weightInGms int,
outOfStock boolean,
quantity int 
);

-- data exploration

-- count of rows
Select count(*) from zepto;

-- sample data
select * from zepto limit 10;

-- null values 
select * from zepto 
where name is null
or
category is null
or
mrp is null
or
discountPercent  is null
or
availableQuantity is null
or
discountSellingPrice is null
or
weightInGms is null
or
outOfStock is null
or
quantity is null;

-- different product categories
select distinct category 
from zepto
order by category;

-- product in stock vs out of stock
select outOfStock, count(sku_id) as counts
from zepto
group by outOfStock;

-- product names present multiple times 
select name, count(sku_id) as "Number of SKUs"
from zepto
group by name 
having count(sku_id)>1
order by count(sku_id) desc;

-- data cleaning

-- products with price = 0 
select * from zepto
where mrp=0 or discountSellingPrice=0;

delete from zepto 
where mrp=0;

-- convert paise to rupees
update zepto
Set mrp = mrp/100.0,
discountSellingPrice = discountSellingPrice/100.0;

select mrp, discountSellingPrice from zepto;

-- Q1. Find the top 10 best-value products based on the dicount percentage
select distinct name, mrp, discountSellingPrice, discountPercent
from zepto
ORDER BY discountPercent desc
limit 10;

-- Q2. What are the Products with High MRP but Out of Stock
Select Distinct name, mrp
from zepto
where outOfStock = 1 and mrp > 300
order by mrp desc;

-- Q.3 Calculate estimated Revenue for each category
Select category,
SUM(discountSellingPrice * availableQuantity) as total_revenue
from zepto
group by category
order by total_revenue;

-- Q.4 Find all products where MRP is greater than 500 and discount is less than 10%
select distinct name, mrp, discountPercent
from zepto
where mrp>500 and discountPercent <10
order by mrp desc, discountPercent desc;

-- Q.5 Identify the top 5 category offering the hightest average discount percentage
select category, 
round(avg(discountPercent),2) as avg_discount
from zepto
group by category
order by avg_discount desc
limit 5;

-- Q.6 Find the price per gram for products above 100g and sort by the value.
select distinct name, weightInGms, discountSellingPrice,
Round(discountSellingPrice/weightInGms,2) as price_per_gram
from zepto
where weightInGms >= 100
order by price_per_gram;

-- Q.7 Group the products into categories like Low, Medium, Bulk.
 select distinct name, weightInGms,
 CASE when weightInGms < 1000 then 'Low'
	when weightInGms < 5000 then 'Medium'
    else 'Bulk'
    END as weight_category
from zepto; 

-- Q.8 What is the total inventory weight per category
select category,
SUM(weightInGms * availableQuantity) as total_weight
from zepto 
group by category
order by total_weight;  