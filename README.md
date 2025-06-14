# USA Housing Market SQL Project
This project analyzes a housing dataset from the USA using SQL. The dataset contains key information on housing prices, features, and neighborhood conditions.

## Dataset Columns:
1. Price
2. Bedrooms
3. Bathrooms
4. SquareFeet
5. YearBuilt
6. GarageSpaces
7. LotSize
8. ZipCode
9. CrimeRate
10. SchoolRating

## SQL Clause/Functions/Statements Used:

- GROUP BY, ORDER BY, WHERE, ROUND, MIN, MAX, AVG, COUNT
- Aliasing and Conditional Filtering
- Window Functions (RANK(), PARTITION BY)
- CASE Statements
- Subqueries
- Common Table Expressions (CTEs)

## Key Insights and Analyses
### 1. Total Entries in the Dataset
    Concepts Used: COUNT
    Purpose: Counted total number of rows.

### 2. Dataset Schema and Data Types
    Concepts Used: SHOW COLUMNS
    Purpose: Viewed column names and data types.

### 3. Summary Statistics by Bedroom Count
    Concepts Used: GROUP BY, MIN, MAX, AVG, ROUND, ALIAS
    Purpose: Calculated average, minimum, and maximum for price, lot size, square footage, and garage spaces, grouped by number of bedrooms.

### 4. Ranked Homes with 5 Bedrooms (Low Crime, High School Rating)
    Concepts Used: Subqueries, RANK(), WHERE, Window Functions
    Purpose: Ranked 5-bedroom homes with below-average crime rate and above-average school rating.

### 5. Houses with Low Crime Rate and High School Rating
    Concepts Used: CTE, CASE, RANK(), WHERE
    Purpose: Highlighted homes that scored well in both safety and education.

### Total Homes with Garage Spaces
    Concepts Used: WHERE, != (not equal)
    Purpose: Counted homes with at least one garage space.

### 7. Oldest and Newest Homes
    Concepts Used: MIN, MAX
    Purpose: Found construction years of oldest and newest homes.

### 8. Homes with >3 Bedrooms and Price < $500,000
    Concepts Used: WHERE, AND, ORDER BY
    Purpose: Filtered affordable large homes.

### 9. Top 5 Most Expensive Homes per Bedroom Count
    Concepts Used: Subquery, RANK(), PARTITION BY
    Purpose: Identified the most expensive homes in each bedroom category.

### 10. Prices of Homes with Crime Rate ≤ 10 and School Rating ≥ 8
    Concepts Used: WHERE, ORDER BY
    Purpose: Explored safe and highly-rated school areas with house prices.

### 11. Correlation Check – Square Feet vs Price
    Concepts Used: CASE, GROUP BY, AVG, ORDER BY
    Purpose: Analyzed if larger homes typically cost more.

### 12. Livability Score Calculation
    Concepts Used: Derived Metric Formula using multiple fields
    Purpose: Created a custom livability score based on school rating, crime rate, square footage, and price

## Tools Used:
- MySQL
- MS Excel

## Files Included

- README.md: Project description and analysis overview
- housing_sql.sql: All SQL queries used
- usa_housing_kaggle.csv: Excel csv file used

## Dataset Source
This project uses the USA Housing Dataset, available on Kaggle.

Citation:
Gupta, Arnav. USA Housing Dataset. Kaggle. https://www.kaggle.com/datasets/arnavgupta1205/usa-housing-dataset
