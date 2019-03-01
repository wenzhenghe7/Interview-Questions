Schema 1:
The following data shows the quantity of tickets sold to the buyer with a buyer ID of 3 and the time that buyer 3 bought the tickets.
Write a sql query to compare the current sale with previous sale.

buyer

buyerid |Saletime | qtysold
3|2019-01-16|5
3|2019-01-18|6
3|2019-01-20|4

select a.buyerid, a.Saletime, a.qtysold, b.Saletime, b.qtysold
from buyer a
inner join buyer b on (a.buyerid = a.buyerid and a.Saletime > b.Saletime)

select 

Schema 2:
Members:
Member_id
Firstname
Surname
Address
Zipcode
Recommended_by
Joining_date

Bookings:
Facility_id
Member_id
Starttime
slots

Facilities:
Facility_id
Facility_Name
member_cost
guest_cost


2.	Get the first, last name and joining date of the last member who signed up?
select Firstname as first, Surname as last, Joining_date as date
from member
order by Joining_date desc
limit 1


3.Output a list of all members, including the individual who recommended them. Order the results by Surname, Firstname.
select a.Firstname, a.Surname, b.Firstname, b.Surname
from member a
left join member b on (a.Recommended_by = b.member_id)
order by a.Surname, a.Firstname


