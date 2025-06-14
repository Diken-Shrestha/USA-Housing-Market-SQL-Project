-- overview of dataset
SELECT * FROM housingdata.housing;

-- data set columns
show columns from housing;

-- number of entries in the dataset
select count(*) from housing;

-- average, min, max housing price grouped by bedrooms
select bedrooms, round(min(price), 2) as min_price, round(max(price),2) as max_price, round(avg(price),2) as avg_price
from housing
group by bedrooms;

-- average, min, max lot size grouped by bedrooms
select bedrooms, round(min(lotsize), 2) as min_lotsize, round(max(lotsize),2) as max_lotsize, round(avg(LotSize),2) as avg_lotsize
from housing
group by bedrooms;

-- average, min, max squarefeet grouped by bedrooms
select bedrooms, round(min(squarefeet), 2) as min_squarefeet, round(max(squarefeet),2) as max_squarefeet, round(avg(squarefeet),2) as avg_squarefeet
from housing
group by bedrooms;

-- average, min, max garagespaces grouped by bedrooms
select bedrooms, round(min(garagespaces), 2) as min_garagespaces, round(max(garagespaces),2) as max_garagespaces, round(avg(garagespaces),2) as avg_garagespaces
from housing
group by bedrooms;

-- ranks the row based on ordering by crime rate first and then schoolrating for 5 bedrooms and having crimerate less than average and school rating more than average
select Bedrooms, Price, ZipCode, CrimeRate, SchoolRating,
rank () over(order by CrimeRate, SchoolRating desc) as Ranking
from housing 
where Bedrooms = 4 
	and CrimeRate < (select avg(CrimeRate) from housing where bedrooms = 4) 
	and SchoolRating > (select avg(SchoolRating) from housing where bedrooms = 4);

-- using case statement to categorize school rating and crime rating and puring them in cte to get required data
with CTE1 as
	( 
	select *, 
		case 
			when SchoolRating < 5 then 'Low'
			when schoolrating > 7 then 'High'
			else 'Medium'
		end as SchoolRating2,
		case 
			when CrimeRate < 30 then 'Low'
			when CrimeRate > 70 then 'High'
			else 'Medium'
		end as CrimeRate2
	from housing)
select zipcode, price, Schoolrating, schoolrating2, crimerate, crimerate2, 
rank() over(order by schoolrating desc, CrimeRate asc)  
from cte1
where CrimeRate2 = 'Low' and SchoolRating2 = 'High';

-- total number of houses with garage spaces
select count(*) 
from housing
where GarageSpaces != 0;

-- oldest and newest house
select min(yearbuilt) as oldest, max(yearbuilt) as newwest 
from housing;

-- houses with more than 3 bedrooms and price under 500,000
select * 
from housing 
where Bedrooms > 3 and Bathrooms > 2 and price < 500000
order by price asc;

-- Top 5 most expensive houses for each bedrooms size
select * from 
(select*, rank() over(partition by bedrooms order by price desc) rankings from housing) as ranked
where rankings <= 5;

-- housing price filtered by crime rate and school rating
select * from housing 
where SchoolRating >= 8 and crimerate <= 10
order by crimerate asc, schoolrating desc;

-- correlation between price and squarefeet
select
	case
		when squarefeet < 1500 then 'small'
		when squarefeet > 3000 then 'big'
		else 'medium'
	end as sqft,
avg(price) as avgprice    
from housing 
group by sqft
order by avgprice desc;

-- create livability score
select *, ROUND((SchoolRating * 2.0) - (CrimeRate * 0.5) + (GarageSpaces * 0.3) + (SquareFeet / 1000.0),2) AS LivabilityScore
from housing
order by Livabilityscore desc;


