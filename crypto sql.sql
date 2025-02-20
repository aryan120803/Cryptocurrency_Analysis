
use crypto;

 # to see tables
 show tables;
 
 # To describe table
 describe table crypto_market;
 
 # To see the data of the table
 select * from crypto_market;
 
 # To check null values
 SELECT 
    'Cryptocurrency Name' AS Column_Name,
    COUNT(*) AS Null_Count
FROM crypto_market
WHERE `Cryptocurrency Name` IS NULL

UNION ALL

SELECT 
    'Symbol' AS Column_Name,
    COUNT(*) AS Null_Count
FROM crypto_market
WHERE `Symbol` IS NULL

UNION ALL

SELECT 
    'Date' AS Column_Name,
    COUNT(*) AS Null_Count
FROM crypto_market
WHERE `Date` IS NULL

UNION ALL

SELECT 
    'Opening Price (USD)' AS Column_Name,
    COUNT(*) AS Null_Count
FROM crypto_market
WHERE `Opening Price (USD)` IS NULL

UNION ALL

SELECT 
    'Closing Price (USD)' AS Column_Name,
    COUNT(*) AS Null_Count
FROM crypto_market
WHERE `Closing Price (USD)` IS NULL

UNION ALL

SELECT 
    'Highest Price (USD)' AS Column_Name,
    COUNT(*) AS Null_Count
FROM crypto_market
WHERE `Highest Price (USD)` IS NULL

UNION ALL

SELECT 
    'Lowest Price (USD)' AS Column_Name,
    COUNT(*) AS Null_Count
FROM crypto_market
WHERE `Lowest Price (USD)` IS NULL

UNION ALL

SELECT 
    'Market Capitalization (USD)' AS Column_Name,
    COUNT(*) AS Null_Count
FROM crypto_market
WHERE `Market Capitalization (USD)` IS NULL

UNION ALL

SELECT 
    'Volume (24h)' AS Column_Name,
    COUNT(*) AS Null_Count
FROM crypto_market
WHERE `Volume (24h)` IS NULL

UNION ALL

SELECT 
    'Total Supply' AS Column_Name,
    COUNT(*) AS Null_Count
FROM crypto_market
WHERE `Total Supply` IS NULL

UNION ALL

SELECT 
    'Price Change (24h%)' AS Column_Name,
    COUNT(*) AS Null_Count
FROM crypto_market
WHERE `Price Change (24h%)` IS NULL

UNION ALL

SELECT 
    'Price Change (7d%)' AS Column_Name,
    COUNT(*) AS Null_Count
FROM crypto_market
WHERE `Price Change (7d%)` IS NULL

UNION ALL

SELECT 
    'Blockchain Network' AS Column_Name,
    COUNT(*) AS Null_Count
FROM crypto_market
WHERE `Blockchain Network` IS NULL

UNION ALL

SELECT 
    'Popularity Rank' AS Column_Name,
    COUNT(*) AS Null_Count
FROM crypto_market
WHERE `Popularity Rank` IS NULL;

# KPI'S



# 1. Most Popular Cryptocurrencies by Rank
SELECT `Cryptocurrency Name`, `Popularity Rank`, ROW_NUMBER() OVER (ORDER BY `Popularity Rank` ASC) AS Popular_Rank 
FROM crypto_market WHERE `Popularity Rank` IS NOT NULL LIMIT 10;

# 2. Top 5 Cryptocurrencies by Market Capitalization
SELECT `Cryptocurrency Name`, SUM(`Market Capitalization (USD)`) AS Total_Market_Capitalization
FROM crypto_market GROUP BY `Cryptocurrency Name`ORDER BY Total_Market_Capitalization DESC LIMIT 5;

# 3.Cryptocurrencies with the Highest 24-Hour Price Change
SELECT `Cryptocurrency Name`, `Price Change (24h%)`
FROM crypto_market ORDER BY `Price Change (24h%)` DESC LIMIT 5;

# 4.Average Trading Volume per Blockchain Network
SELECT `Blockchain Network`, AVG(`Volume (24h)`) AS Avg_Trading_Volume
FROM crypto_market GROUP BY `Blockchain Network`ORDER BY Avg_Trading_Volume DESC;

# 5.Cryptocurrency with the Highest Weekly Price Growth
SELECT `Cryptocurrency Name`, `Price Change (7d%)`
FROM crypto_market ORDER BY `Price Change (7d%)` DESC LIMIT 5;

# 6.Total Market Capitalization of All Cryptocurrencies
SELECT SUM(`Market Capitalization (USD)`) AS Total_Market_Cap FROM crypto_market;

# 7.Daily Average Closing Price for Each Cryptocurrency
SELECT `Cryptocurrency Name`, DATE(`Date`) AS Day, AVG(`Closing Price (USD)`) AS Avg_Closing_Price
FROM crypto_market GROUP BY `Cryptocurrency Name`, DATE(`Date`)ORDER BY `Cryptocurrency Name`, Day;

# 8.Total Market Capitalization by Cryptocurrency for Each Day
SELECT     `Cryptocurrency Name`, DATE(`Date`) AS Day,SUM(`Market Capitalization (USD)`) AS Total_Market_Cap
FROM crypto_market GROUP BY `Cryptocurrency Name`, DATE(`Date`)ORDER BY `Cryptocurrency Name`, Day;

# 9.Weekly Average Closing Price for Each Cryptocurrency
SELECT `Cryptocurrency Name`, YEARWEEK(`Date`) AS Week, AVG(`Closing Price (USD)`) AS Avg_Closing_Price
FROM crypto_market GROUP BY `Cryptocurrency Name`, YEARWEEK(`Date`)ORDER BY `Cryptocurrency Name`, Week;










