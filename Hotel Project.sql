/*
This project is to asnwer 3 business objectives:
- Is our hotel revenue growing by year?
- Should we increase parking lot size?
- What trend we can see in the data?

The data used is from public data.

These quiries used JOIN, UNION, AGGREGATE FUNCTION.
*/

use hotel_project;

-- Check all the data with UNION

SELECT 
    *
FROM
    hotel_2018 
UNION SELECT 
    *
FROM
    hotel_2019 
UNION SELECT 
    *
FROM
    hotel_2020;



-- Check if the revenue increased from 2018 until 2020

SELECT 
    arrival_date_year,
    SUM((stays_in_week_nights + stays_in_weekend_nights) * adr) AS revenue
FROM
    (SELECT 
        *
    FROM
        hotel_2018 UNION SELECT 
        *
    FROM
        hotel_2019 UNION SELECT 
        *
    FROM
        hotel_2020) AS hotel
GROUP BY arrival_date_year;



-- Find out the revenue per each hotel type

SELECT 
    arrival_date_year,
    hotel,
    SUM((stays_in_week_nights + stays_in_weekend_nights) * adr) AS revenue
FROM
    (SELECT 
        *
    FROM
        hotel_2018 UNION SELECT 
        *
    FROM
        hotel_2019 UNION SELECT 
        *
    FROM
        hotel_2020) AS hotel
GROUP BY hotel , arrival_date_year;



-- Checking the trend
SELECT 
    *
FROM
    market_segment;
    


SELECT
*
FROM 
(SELECT 
        *
    FROM
        hotel_2018 UNION SELECT 
        *
    FROM
        hotel_2019 UNION SELECT 
        *
    FROM
        hotel_2020) AS hotel
			LEFT JOIN
        market_segment ms ON hotel.market_segment = ms.market_segment
			LEFT JOIN
		meal_cost mc ON mc.cost = hotel.meal;
        


-- Parking lot

SELECT 
    required_car_parking_spaces,
    SUM(required_car_parking_spaces / total_nights),
    SUM((stays_in_week_nights + stays_in_weekend_nights) * adr) AS revenue
FROM
    (SELECT 
        *
    FROM
        hotel_2018 UNION SELECT 
        *
    FROM
        hotel_2019 UNION SELECT 
        *
    FROM
        hotel_2020) AS hotel
group by arrival_date_year;
