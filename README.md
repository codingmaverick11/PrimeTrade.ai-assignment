# PrimeTrade.ai-assignment<br>

# Objective
Analyze how market sentiment (Fear/Greed) relates to trader behavior and performance on Hyperliquid. Your goal is to uncover patterns that could inform smarter trading strategies.<br><br>

## Data Import and Cleaning

### Step 1
1. Imported the data using pandas.<br>
2. Checked the shape of the tables.<br>
3. Inspected the DataType of the tables.<br>
4. Made a overview document of the data with the help of `PandasProfiling` library, where i checked for missing values, duplicate rows, zero values, distinct values, correlations, etc.<br>
5. Handle the DATE data types.<br>
6. Exported the file to MySQL database for running queries, joining tables, etc.

### Step 2
1. Extreme Fear = (1-24)
2. Fear = (25-44)
3. Neutral = (45-54)
4. Greed = (55-74)
5. Extreme Greed = (75-100)<br><br>

## SQL Final

### Step 1
1. I filtered out the data which we will be needing for our current project objective.
2. SQL query file is saved in SQL_query folder.
3. The CSV files I dervied from it are given.
4. Main objective from SQL file handling was to segregate the data for our requirements and to join the Market Sentiment and Hyperliquid trade dataset.<br><br>

## Data Analysis using Seaborn & Matplotlib

### Step 1





