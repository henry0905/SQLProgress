/*
A table sale has:
country - state - year - quarter - sales

We want to pivot follow quarter
*/

Select *
FROM sale
PIVOT (sum(sales) FOR quarter IN ('Q1','Q2','Q3','Q4')) as dt1
ORDER BY 1,2,3;
