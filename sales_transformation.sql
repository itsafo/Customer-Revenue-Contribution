-- sales schema


Use sales;
SELECT *
  FROM [sales].[customers]

SELECT *
  FROM [sales].[products]
  
SELECT distinct product_type
  FROM [sales].[products]

--Show total number of customers
SELECT count(*) FROM sales.customers;

--Validating currency tags
SELECT distinct currency FROM sales.transactions;

SELECT count(*) FROM sales.transactions where currency='GPB\r';

--Show transactions for Chennai market (market code for Birmingham is Mark001)
SELECT * FROM sales.transactions where market_code='Mark001';

--Show distrinct product codes that were sold in Birmingham
SELECT distinct product_code FROM sales.transactions where market_code='Mark001';

--Show transactions where currency is US dollars
SELECT * from sales.transactions where currency like '%USD%';

--Show transactions in 2020 join by date table
SELECT transactions.*, date.* FROM sales.transactions INNER JOIN sales.date 
ON transactions.order_date=date.date where date.year=2020;

--Show total revenue in year 2020
SELECT SUM(transactions.sales_amount) FROM sales.transactions INNER JOIN sales.date 
ON transactions.order_date=date.date where date.year=2020 
and transactions.currency='INR' or transactions.currency='USD';

--Show total revenue in year 2020, January Month,
SELECT SUM(transactions.sales_amount) FROM sales.transactions INNER JOIN sales.date 
ON transactions.order_date=date.date where date.year=2020 and date.month_name='January' 
and (transactions.currency='INR' or transactions.currency='USD');

--Show total revenue in year 2020 in Chennai
SELECT SUM(transactions.sales_amount) FROM sales.transactions INNER JOIN sales.date 
ON transactions.order_date=date.date where date.year=2020 and transactions.market_code='Mark001';
