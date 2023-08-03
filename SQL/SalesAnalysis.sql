create database Supermarket;

use Supermarket;

select * from sales;


-- Q1 Find the distibution of male and female for each product line

select `product line`, gender,count(gender) as total
from sales 
group by `product line`,gender
order by total desc;

-- Top 2 product lines purchased by females are fashion accessories and Food and beverages
-- whereas for males the Top 2 are Electronic accessories and health and beauty


-- Q2  Find Average total transaction of each product line 

select `product line` , avg(total) as Avgsale
from sales 
group by `product line`
order  by Avgsale desc;

-- Home and lifestyle has the highest Average total transaction while Fashion accessories has the lowest


-- Q3 Find average total transaction of each payment method

select payment , avg(total) as avgtrans
from sales
group by Payment 
order by avgtrans desc;

-- Total amount has no impact on payment method as all three methods have around the same average


-- Q4  Find city wise distribution of Product line

select city,`product line`, count(`product line`)
from sales
group by city,`product line`
order by city;


-- Q5 Product line wise Gross margin percentage and gross income

select `Product line` ,round(sum(`gross income`),2) as SumGrossIncome, round(avg(`gross margin percentage`),2) as AvgPercentageMargin
from sales
group by `product line`
order by SumGrossIncome desc; 

-- Every Product line has the same Average Gross Margin Percentage but Food and bevearges has the highest income while health and beauty has the lowest.


-- Q6 Find the best branch rating wise.

select Branch , round(avg(Rating),2) As Average_Rating
from sales
group by branch
order by Average_rating desc;

-- Branch C has the best Average Rating(7.07) closely followed by A (7.03)


-- Q7 Find the best branch income wise.

select Branch , round(avg(`gross income`),2) As Average_Income
from sales
group by branch
order by Average_Income desc;

-- C has the highest Average income But we can see that B has higher Average income than A  but has a lower average rating 
-- Customer Service could be imporved at branch B 


-- Q8 City wise Branch Distribution

select city , branch , count(branch) as cntBranch
from sales
group by city, branch
order by city;

-- Branch and city contain the same information.


-- Q9  Impact of customer Type on Gross income.

select `customer type`, round(avg(`gross income`),2) as AverageIncome
from sales
group by `customer type`
order by AverageIncome desc;

-- Members genarate slightly higher income on Average but still very negligible.


-- Q10 branch wise membership percentage

select branch,`customer type`,count(`customer type`) as Num_type
from sales
group by branch,`customer type`
order by branch;

-- There should be more schemes to enroll more members in branch A as well as B  
-- C has more members than normal customer


-- Q10 Find Average rating given product line wise for totals above 200$

select `Product line`, round(avg(rating),2) as Average_Rating 
from sales 
where total >= 200
group by `product line`
order by Average_Rating desc;

-- Fashion accessories get the highest Average rating when the total spent is above 200


-- Q11 Which Gender generates more income on Average?

select Gender , round(avg(`gross income`),2) as Average_Gross_Income
from sales
group by Gender
order by Average_Gross_Income desc;

-- Females Generate more income on Average.


-- Q12 Which Gender is more statisfied?

select gender, round(Avg(rating),2) Average_rating
from sales
group by gender
order by Average_rating desc;

-- Average rating given by both genders is very similar.alter


-- Q13 branch wise, gender wise, Customer type for branch A and B 

select branch, gender, `Customer type`,round(count(`Customer type`),2) as Cnt
from sales
where branch in ('A','B')
group by branch, gender, `Customer type`
order by branch;


-- Q14 Which payment types do different genders use

select payment , gender ,round(count(gender),2) as cnt
from sales
group by payment , gender
order by payment;

-- Cash and Credit Card have more numbers of females while Ewallet has more number of male users


-- Q15 Branch wise payment type.

select branch, payment, round(count(payment),2) as cnt
from sales
group by branch , payment
order by branch;

-- Branch A and B have higher number of EWallet payments, while C has higher number of cash payments

