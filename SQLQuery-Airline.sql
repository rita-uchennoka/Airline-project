select * from [Airline].[dbo].[airlines data]

-- finding how many channels for booking- internet and mobile
select count (distinct sales_channel) from [Airline].[dbo].[airlines data]
select distinct sales_channel from [Airline].[dbo].[airlines data]

--finding the total no of customer that use each of the 2 channels- internet 70662, mobile 8900
select sum(num_passengers), sales_channel from  [Airline].[dbo].[airlines data]
group by sales_channel

--NO of country that book the airline-104
select count (distinct booking_origin) from [Airline].[dbo].[airlines data]

-- the contry with highest booking- Australia 17872
select booking_origin, count(*) Total_booking from [Airline].[dbo].[airlines data]
group by booking_origin
order by Total_booking desc

select booking_origin, count(purchase_lead) Lead_Pur from [Airline].[dbo].[airlines data]
where purchase_lead > 150
group by booking_origin
order by Lead_Pur desc

-- 799 route
select count (distinct route) from [Airline].[dbo].[airlines data]

-- flight with most number of passengers for each route
select sum(num_passengers) Total_pas, route from [Airline].[dbo].[airlines data]
group by route
order by Total_pas desc

-- flight with most number of passengers for each route on monday
select sum(num_passengers) Total_pas, route from [Airline].[dbo].[airlines data]
where flight_day = 'Mon'
group by route
order by Total_pas desc

--days in the week with height number of passenger-Monday
select sum(num_passengers) Total_pas, flight_day from [Airline].[dbo].[airlines data]
group by flight_day
order by Total_pas desc

-- new table
select sum(num_passengers) Total_pas, flight_day,booking_origin, route 
--into [Airline].[dbo].[new airlines data]
from [Airline].[dbo].[airlines data]
group by flight_day, route, booking_origin
order by Total_pas desc

select total_pas, flight_day, route from [Airline].[dbo].[new airlines data]
where flight_day = 'Mon'
order by Total_pas desc

