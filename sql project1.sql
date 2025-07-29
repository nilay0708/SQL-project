CREATE table zepto(
sku_id SERIAL primary key,
category VARCHAR(120),
name varchar(150) not null,
mrp numeric(8,2),
discountPercent numeric(5,2),
availablequantity integer,
discountedSellingPrice numeric(8,2),
WeightInGms integer,
OutofStock boolean,
quantity integer
)

--count of rows
select * from zepto

--sample data
select * from zepto
limit 10

--null values
select * from zepto
where name is null
or
mrp is null
or
category is null
or
discountpercent is null
or
availablequantity is null
or
weightingms is null
or
outofstock is null
or
quantity is null

--diff product categories
select distinct category
from zepto
order by category

--products in stock vs out of stock
select  outofstock, count(sku_id)
from zepto
group by outofstock

--product names present multiple times
select name, count(sku_id) as "SKUs number"
from zepto
group by name
having count(sku_id) > 1
order by count(sku_id) desc

--data cleaning
--product with price=0
select * from zepto
where mrp = 0 or discountedsellingprice=0

delete from zepto
where sku_id=3830

--convert paise to rupee
update zepto
set mrp = mrp/100,
discountedsellingprice = discountedsellingprice/100

-- Q1. Find the top 10 best-value products based on the discount percentage.
select distinct name, mrp, discountpercent, discountedsellingprice
from zepto
order by discountpercent desc
limit 10

--Q2.What are the Products with High MRP but Out of Stock
select distinct name, mrp from zepto
where outofstock is true
order by mrp desc

--Q3.Calculate Estimated Revenue for each category
select distinct category,
sum(discountedsellingprice * availablequantity) as revenue
from zepto
group by category
order by revenue desc

-- Q4.Find all products where MRP is greater than ₹500 and discount is less than 10%.
select distinct name, mrp, discountpercent from zepto
where mrp > 500 and discountpercent < 10
order by mrp desc, discountpercent desc

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
select category, round(avg(discountpercent),1) from zepto
group by category
order by avg(discountpercent) desc
limit 5

-- Q6. Find the price per gram for products above 100g and sort by best value.
select distinct name, discountedsellingprice, weightingms,
round(discountedsellingprice/weightingms,2) as ppg
from zepto
where weightingms >= 100
order by ppg

--Q7.Group the products into categories like Low, Medium, Bulk.
select distinct name, weightingms,
case when weightingms < 1000 then 'low'
	 when weightingms < 5000 then 'medium'
     else 'bulk'
     end as weight_category
from zepto

--Q8.What is the Total Inventory Weight Per Category 
select category, 
round(sum(availablequantity*weightingms),0) as Total_inventory_weight
from zepto
group by category
order by Total_inventory_weight