/*Round 1
Date uid start finish vid

每条播放日志记录了播放开始和结束时间，
date, user_id, start_time, end_time, video_id
如果需要每天统计"过去30天的人均播放时长"*/

/*var excute_date string*/
create view as A
select user_id, sum(end_time-start_time) as duration
from table_a
where date <= date(excute_date) and date >= date(excute_date) - 30
group by user_id

select avg(duration) as avg_duration
from A

create view as B
select distinct date, user_id
from table_a

create view as C
select 
date, user_id, 
date-min(date) over (partition by user_id order by date) as days_since_first_day,
row_number() over (partition by user_id order by date) as position,
position- days_since_first_day as diff
from B

create view as D
select user_id, count(*) as num_of_days
from C
group by user_id, diff
having num_of_days >= 3

select distinct user_id
from D

1,2,3,5,8,9,10
1,2,3,4,5,6,7
0,0,0,1,3,3,3

##########################

/*Round 2
uid，date
查询近三天连续访问的uid列表。


/* *arg  **arg 的区别

__init__.py

f(x) => 0/1 不等概率, 假设输出0概率为p
y(f(x)) => 0/1  等概率的输出。*/