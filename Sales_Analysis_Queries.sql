create database project_db;
use project_db;
select*
From clean_sales_data_project limit 10;

select count(order_ID) as total_orders,
Round(sum(sales),2) as total_sales_Amount
from clean_sales_data_project;

select city,
Round(sum(sales),2)as city_sales
from clean_sales_data_project
group by city
order by city_sales desc;

select product, count(order_ID) as Total_Quantity_Sold,
Round(sum(sales),2) as product_sales
from clean_sales_data_project
group by product
order by Total_Quantity_Sold Desc;


select*
from (select
city,
product,
Round(sum(sales),2) as Total_Sales_Amount,
dense_rank() over(partition by city order by sum(sales) Desc) as 
city_wise_product_rank
from clean_sales_data_project
group by city,product
)v

where city_wise_product_rank =1;