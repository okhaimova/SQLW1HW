-- 1. Which destination in the flights database is the furthest distance away, based on information in the flights table.
	-- Show the SQL query(s) that support your conclusion
    

SELECT origin, dest, distance
FROM flights
ORDER BY distance DESC
LIMIT 1;

# The distance between HNL airport in Hawaii and JFK airport in New York is the largest. 

SELECT dest AS 'destination', AVG(distance) AS 'Average Distance'
FROM flights
GROUP BY dest
ORDER BY AVG(distance) DESC;

# On average, HNL is the furthest airport by distance.
    
-- 2. What are the different numbers of engines in the planes table? For each number of engines, which aircraft have
	-- the most number of seats? Show the SQL statement(s) that support your result.
    
 SELECT DISTINCT engines AS 'Numbers of engines', MAX(seats) AS 'Most Number of Seats', CONCAT(manufacturer, ' ', model) AS 'Aircraft'
 FROM planes
 GROUP BY engines
 ORDER BY engines;
    
-- 3. Show the total number of flights.

SELECT COUNT(*) AS 'Total Number of flights'
FROM flights;

-- 4. Show the total number of flights by airline (carrier).

SELECT flights.carrier, airlines.name, COUNT(*) AS 'Total Number of flights'
FROM flights INNER JOIN airlines ON flights.carrier = airlines.carrier
GROUP BY carrier
ORDER BY carrier;

-- 5. Show all of the airlines, ordered by number of flights in descending order.

SELECT flights.carrier, airlines.name, COUNT(*) AS 'Total Number of flights'
FROM flights INNER JOIN airlines ON flights.carrier = airlines.carrier
GROUP BY carrier
ORDER BY COUNT(*) DESC;

-- 6. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.

SELECT flights.carrier, airlines.name, COUNT(*) AS 'Total Number of flights'
FROM flights INNER JOIN airlines ON flights.carrier = airlines.carrier
GROUP BY carrier
ORDER BY COUNT(*) DESC
LIMIT 5;

-- 7. Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of
	-- flights in descending order.
    
SELECT flights.carrier, airlines.name, COUNT(*) AS 'Total Number of flights'
FROM flights INNER JOIN airlines ON flights.carrier = airlines.carrier
WHERE distance >=1000
GROUP BY carrier
ORDER BY COUNT(*) DESC
LIMIT 5;    
    
-- 8. Create a question that (a) uses data from the flights database, and (b) requires aggregation to answer it, and
	-- write down both the question, and the query that answers the question.

--  What is the average, longest, and shortest arrival delay in for each airline, ordered by the average?

SELECT flights.carrier, airlines.name, AVG(arr_delay) AS 'Average Departure Delay (min)', 
	MAX(arr_delay) AS 'Longest Delay (min)', MIN(arr_delay) AS 'Shortest Delay (min)'
FROM flights INNER JOIN airlines ON flights.carrier = airlines.carrier
GROUP BY carrier
ORDER BY AVG(arr_delay) DESC;


