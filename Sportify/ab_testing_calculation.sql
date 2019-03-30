#A product team launched a test on the Home page (page='home') that they hope will lead users to binge content from Home. 
#Write a SQL query to calculate--for Variant and Control A/B groups--the average consumption time (in minutes) across all users, 
#where we are only taking into account a user's "binge day" (most active day on Home page). 
#Please note that you should only consider days during which the user was exposed to the test.

select avg(binge_time)/1000/60 as avg_binge_time, ab_bucket
from(select max(total_ms_played) as binge_time, user_id, ab_bucket
     from (select sum(A.ms_played) as total_ms_played, A.user_id, A.date, B.ab_bucket
           from steams A
           left join ab_buckets B on A.user_id = B.user_id
           where b.first_exposed_date IS NOT NULL AND A.date >= TO_DATE(b.first_exposed_date) & A.page = 'home'
           group by A.user_id, A.date, B.ab_bucket) as C
     group by user_id, ab_bucket) as D
group by ab_bucket
