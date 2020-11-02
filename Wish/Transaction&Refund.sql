/*SQL  
Table 1 Transaction Info 
order_time ,transaction_id ,merchant_id ,product_id ,shipping_country , gmv

Table 2 Refund Info 
transaction_id ,refund_reason — (‘Quality’, ‘Logistics’)  

Question 1 please find the monthly top 10 GMV merchants in DE, SH (2020/01 to 2020/06) 

Question 2 please find the monthly Global top 10 (# of orders) products and their quality related refund rate 

Question 3 please find the products which have orders consecutively in 5 days since 2020/01/01 (exclude the refunded orders) */



/*Q1*/
create view as B
select merchant_id, month(order_time) as order_month, gmv, shipping_country
from A
where order_time between date('2020-01-01') and date('2020-06-30')
and shipping_country in ('DE','SH')

create view as C
select merchant_id, order_month, shipping_country, sum(gmv) as total_gmv
from B
group by merchant_id, order_month, shipping_countrcre

select mechart_id, order_month, shipping_country, 
row_number() over (partition by order_month, shipping_country order by total_dmv DESC) as pos
from C
where pos <= 10

/*Q2*/
create view as B
select product_id, count(order_id) as order_total
from A
where month(order_date) = 2 and year(order_date) = 2020
group by product_id

create view as C
select product_id, count(order_id) as refund_total
from refund_info as D
inner join A on A.transaction_id = D.transaction_id
where month(order_date) = 2 and year(order_date) = 2020
and refund_reason = 'quality'
group by product_id

select product_id, 
case when
isnull(refund_total) then 0
else refund_total/order_total
end as refund_rate
from B
left join C on B.product_id = C.product_id

/*Q3*/
row_number() - days since first day to get the group column.
