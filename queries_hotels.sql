select * from market_18y
union
select * from market_19y
union
select * from market_20y;


with hotels as 
(select * from market_18y
union
select * from market_19y
union
select * from market_20y)

select arrival_date_year,
       hotel,
       sum((STAYS_IN_WEEK_NIGHTS + STAYS_IN_WEEKEND_NIGHTS) * ADR) revenue
from hotels
group by arrival_date_year, hotel
order by arrival_date_year, hotel;


with hotels as 
(select * from market_18y
union
select * from market_19y
union
select * from market_20y)

select * 
from hotels h,
     market_segment ms,
     meal_cost mc
where ms.market_segment = h.market_segment
and mc.meal = h.meal;
