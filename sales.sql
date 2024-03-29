-- Inspecting Data
select * from sales;

-- CHecking unique values
select distinct status from sales; -- Nice one to plot
select distinct year_id from sales;
select distinct PRODUCTLINE from sales; -- Nice to plot
select distinct COUNTRY from sales; -- Nice to plot
select distinct DEALSIZE from sales; -- Nice to plot
select distinct TERRITORY from sales; -- Nice to plot

select distinct MONTH_ID from sales
where year_id = 2003;

-- ANALYSIS
-- Let`s start by grouping sales by productline
select PRODUCTLINE, sum(sales) Revenue
from sales
group by PRODUCTLINE
order by 2 desc;


select YEAR_ID, sum(sales) Revenue
from sales
group by YEAR_ID
order by 2 desc;

select  DEALSIZE,  sum(sales) Revenue
from sales
group by  DEALSIZE
order by 2 desc;


-- What was the best month for sales in a specific year? How much was earned that month? 
select  MONTH_ID, sum(sales) Revenue, count(ORDERNUMBER) Frequency
from sales
where YEAR_ID = 2004 -- change year to see the rest
group by  MONTH_ID
order by 2 desc;


-- November seems to be the month, what product do they sell in November, Classic I believe
select  MONTH_ID, PRODUCTLINE, sum(sales) Revenue, count(ORDERNUMBER)
from sales
where YEAR_ID = 2004 and MONTH_ID = 11 -- change year to see the rest
group by  MONTH_ID, PRODUCTLINE
order by 3 desc ;


-- Who is our best customer (this could be best answered with RFM)


-- DROP TABLE IF EXISTS #rfm
;
with rfm as 
(
	select 
		CUSTOMERNAME, 
		sum(sales) MonetaryValue,
		avg(sales) AvgMonetaryValue,
		count(ORDERNUMBER) Frequency,
		max(ORDERDATE) last_order_date,
		(select max(ORDERDATE) from sales) max_order_date,
		DATEDIFF(DD, max(ORDERDATE), (select max(ORDERDATE) from sales)) Recency
	from sales
	group by CUSTOMERNAME
),
rfm_calc as
(

	select r.*,
		NTILE(4) OVER (order by Recency desc) rfm_recency,
		NTILE(4) OVER (order by Frequency) rfm_frequency,
		NTILE(4) OVER (order by MonetaryValue) rfm_monetary
	from rfm r
)
select 
	c.*, rfm_recency+ rfm_frequency+ rfm_monetary as rfm_cell,
	cast(rfm_recency as char) + cast(rfm_frequency as char) + cast(rfm_monetary  as char)rfm_cell_string
into rfm 
from rfm_calc c;

select CUSTOMERNAME , rfm_recency, rfm_frequency, rfm_monetary,
	case 
		when rfm_cell_string in (111, 112 , 121, 122, 123, 132, 211, 212, 114, 141) then 'lost_customers'  -- lost customers
		when rfm_cell_string in (133, 134, 143, 244, 334, 343, 344, 144) then 'slipping away, cannot lose' -- (Big spenders who haven’t purchased lately) slipping away
		when rfm_cell_string in (311, 411, 331) then 'new customers'
		when rfm_cell_string in (222, 223, 233, 322) then 'potential churners'
		when rfm_cell_string in (323, 333,321, 422, 332, 432) then 'active' -- (Customers who buy often & recently, but at low price points)
		when rfm_cell_string in (433, 434, 443, 444) then 'loyal'
	end rfm_segment

from rfm ;




-- What products are most often sold together? 
-- select * from sales where ORDERNUMBER =  10411 ;


-- EXTRAs
-- What city has the highest number of sales in a specific country
select city, sum(sales) Revenue
from sales
where country = 'UK'
group by city
order by 2 desc;



-- What is the best product in United States?
select country, YEAR_ID, PRODUCTLINE, sum(sales) Revenue
from sales
where country = 'USA'
group by  country, YEAR_ID, PRODUCTLINE
order by 4 desc ;