use july7;
select*from flight_bookings;
--- 1  Total Revenue ----
SELECT SUM(Ticket_Price) AS Total_Revenue
FROM flight_bookings;

--- 2 Revenue by Airline ----
SELECT Airline,
       SUM(Ticket_Price) AS Revenue
FROM flight_bookings
GROUP BY Airline
ORDER BY Revenue DESC;

---- 3 Top Performing Airline ----
SELECT Airline,
       SUM(Ticket_Price) AS Revenue
FROM flight_bookings
GROUP BY Airline
ORDER BY Revenue DESC
LIMIT 1;

--- 4 Average Ticket price by Class ---
SELECT Travel_Class,
       AVG(Ticket_Price) AS Avg_Price
FROM flight_bookings
GROUP BY Travel_Class;

--- 5  Revenue by Departure city ----
SELECT Depture_City,
       SUM(Ticket_Price) AS Revenue
FROM flight_bookings
GROUP BY Depture_City
ORDER BY Revenue DESC;

--- 6 Most used payment methods ----
SELECT Payment_Method,
       COUNT(*) AS Usage_Count
FROM flight_bookings
GROUP BY Payment_Method
ORDER BY Usage_Count DESC;

---- 7 Passenger Age Analysis by bookings----
SELECT 
    CASE 
        WHEN Passenger_Age < 20 THEN 'Below 20'
        WHEN Passenger_Age BETWEEN 20 AND 40 THEN '20-40'
        WHEN Passenger_Age BETWEEN 41 AND 60 THEN '41-60'
        ELSE 'Above 60'
    END AS Age_Group,
    COUNT(*) AS Total_Passengers
FROM flight_bookings
GROUP BY Age_Group;

--- 8 Average Ticket Price by Airline&Class---
SELECT Airline,
       Travel_Class,
       AVG(Ticket_Price) AS Avg_Price
FROM flight_bookings
GROUP BY Airline, Travel_Class
ORDER BY Airline;

---- 9 Revenue per each KM(Efficency)-----
SELECT Airline,
       SUM(Ticket_Price) / SUM(Distance_km) AS Revenue_per_km
FROM flight_bookings
GROUP BY Airline;

--- 10 Longest Flights ---
SELECT *
FROM flight_bookings
ORDER BY Fight_Duration_hr DESC
LIMIT 5;

--- 11 Buiness class vs economy revenue----
SELECT Travel_Class,
       SUM(Ticket_Price) AS Revenue
FROM flight_bookings
GROUP BY Travel_Class;

--- 12  Booking price above 700---
SELECT *
FROM flight_bookings
WHERE Ticket_Price > 700;

---- 13 Airline booking count----
SELECT Airline,
       COUNT(*) AS Total_Bookings
FROM flight_bookings
GROUP BY Airline
ORDER BY Total_Bookings DESC;