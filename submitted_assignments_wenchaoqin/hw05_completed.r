# Directions:

# This file contains homework questions for the lecture on data forensics
# and statistics. Questions appear as comments in the file. 

# The first four questions are narrative only, meaning you can just write an
# answer and do not need to write computer code. For other questions, please 
# see the Grading Criteria Canvas Page for specific guidance on what
# we expect from you regarding assignment responses.

# Once you have completed the assignment, follow the Submission Instructions 
# on Canvas Pages section to add, commit, and push this to your GitHub repository. 

# Some questions have multiple parts - make sure to read carefully and
# answer all of them. The majority of points lost in homework come from
# careless skipping over question parts.  

###############################################################################

# 1. What is Deviation a measure of? [comprehension]

Deviation is a measure of how much individual values in a dataset differ from a central value, usually the mean (average). It helps quantify the spread or dispersion of data points.

# 2. What is Standard Deviation? [comprehension]

Standard Deviation (σ) – Measures how spread out the data is from the mean. A low value means data points are close to the mean, while a high value means they are widely spread.

# 3.Load the Craigslist data and then compute:
#
#     a. The number of rows and columns. [code completion + comprehension].
first we will use read.csv("/Users/wenchaoqin/cl_rentals.csv" to load the dataset from cvs file, we also need to use stringsAsFactors = FALSE.stringsAsFactors = FALSE is used to prevent text columns (strings) from being automatically converted into factors when you read a CSV file using read.csv()
So it can us directly manipulate, search, or modify text without converting factors back to strings.                           
Then i will use dim(cl_rentals) to Returns a vector (rows, columns).dim(cl_rentals) will returns a vector with two values: the number of rows and columns of the dataset.
data_dimensions[1] is the number of rows, and data_dimensions[2] is the number of columns.At last,we will use cat.	cat() prints the results in a readable format.
                           
#cl_rentals <- read.csv("/Users/wenchaoqin/cl_rentals.csv", stringsAsFactors = FALSE )
# Get the number of rows and columns
data_dimensions <- dim(cl_rentals)

# Print results
cat("Number of Rows:", data_dimensions[1], "\n")
cat("Number of Columns:", data_dimensions[2], "\n")

#     b. The names of the columns. [code completion + comprehension] 
#In order to get the name, we will use colname.It will retrieves the names of the columns in the dataset.Then we can use cat() to prints the column names as a single string in a readable format.

# Get the names of the columns
column_names <- colnames(cl_rentals)

# Print the column names
cat("The names of the columns are:", column_names, "\n")

#     c. A structural summary of the data. [code completion + comprehension]
To get a structural summary of the dataset in R, we can use the str() function. This function gives us an overview of the structure of an object, including the types of columns (e.g., integer, character, factor) and a preview of the data.
str(cl_rentals) prints a compact summary of the structure of the dataset.It shows the type of each column (e.g., int, factor, chr).It also provides a preview of the first few values in each column, so you get an idea of the data contained in each one.
It helps you quickly understand the structure of your dataset, including column types and a sample of the data.

# Get a structural summary of the dataset
str(cl_rentals)
#
#     d. A statistical summary of the data. [code completion + comprehension]
To get a statistical summary of the dataset in R, we can use the summary() function. This function provides a quick summary of each column, including measures like the mean, min, max, median, 1st quartile (Q1), and 3rd quartile (Q3) for numeric data, and counts for categorical data.
This function computes a statistical summary of each column in the dataset.
For numeric columns (e.g., price, quantity): It provides statistics like:Min: The smallest value.1st Qu. (Q1): The first quartile (25th percentile).Median: The middle value (50th percentile).Mean: The average value.3rd Qu. (Q3): The third quartile (75th percentile).	Max: The largest value.
When summary() is applied to character columns, it doesn’t compute numeric statistics like mean or median because the data consists of text (strings). Instead, it provides:
Length: The number of rows (observations) in the column.
Class: The data type of the column (usually "character" for text).
Mode: The internal storage type (usually "character" for text).

# Get a statistical summary of the dataset
summary(cl_rentals)
# 4. The goal of this exercise is to compute the number of missing values in
#    every column of the Craigslist data.
#
#    a. Write a function called `count_na` that accepts a vector as input and
#       returns the number of missing values in the vector. Confirm that your
#       function works by testing it on a few vectors. 
#.      [code completion + comprehension]

#We can write a function count_na that takes a vector as input and returns the number of missing values in that vector using the sum() function with is.na() to identify missing values.
The function count_na() uses is.na(vec) to check for missing values (NA) in the input vector vec. is.na() returns a logical vector of TRUE (if the value is NA) and FALSE (if it’s not).
sum(is.na(vec)) sums the TRUE values, which are treated as 1, so the result is the total number of missing values in the vector.
At last , we can use cat to print the result.

# Define the count_na function
count_na <- function(vec) {
  return(sum(is.na(vec)))
}

# Test the function with sample vectors
test_vec1 <- c(1, 2, NA, 4, NA)
test_vec2 <- c("apple", "banana", NA, "cherry", NA)
test_vec3 <- c(NA, NA, NA)

cat("Test Vector 1 NA count: ", count_na(test_vec1), "\n")  # Should return 2
cat("Test Vector 2 NA count: ", count_na(test_vec2), "\n")  # Should return 2
cat("Test Vector 3 NA count: ", count_na(test_vec3), "\n")  # Should return 3
#    b. Test your function on the `pets` column from the Craigslist data. The
#       result should be 14. If you get an error or a different result, try
#       part a again.
#       [code completion + comprehension]
# 
we will test the count_na function on the pets column from the Craigslist dataset. The $ symbol is used to select a specific column by its name (in this case, pets) from the dataframe cl_rentals.
By passing cl_rentals$pets as the argument to count_na(), we are asking the function to check how many missing values (NA) there are in the pets column.
Inside the function, is.na(cl_rentals$pets) checks each value in the pets column to see if it’s missing (NA). It returns a logical vector of TRUE (for missing values) and FALSE (for non-missing values).
# Assuming 'cl_rentals' is your Craigslist dataset
count_na(cl_rentals$pets)  # Should return 14 if the column has 14 missing values
#    c. Use an apply function to apply your function to all of the columns in
#       the Craigslist data set. Include the result in your answer.
#       [code completion + comprehension]

#I can use the apply() function to apply count_na() to all columns in the dataset.
The apply() function applies a given function (count_na) to each column of the dataset. The second argument (2) tells apply() to apply the function to columns (if it were 1, it would apply to rows).
missing_values will be a vector showing the number of missing values for each column in the Craigslist dataset.
count_na() counts the number of missing (NA) values in a given vector.At last , we use print  to show the result.



# Apply count_na to all columns in the dataset
missing_values <- apply(cl_rentals, 2, count_na)  # 2 means apply to columns

# Show the result (number of missing values in each column)
print(missing_values)
title         text     latitude    longitude         city  date_posted date_updated        price      deleted         sqft 
0            0            3            3          952            0         1801           35            0          347 
bedrooms    bathrooms         pets      laundry      parking   craigslist    shp_place     shp_city    shp_state   shp_county 
10           10           14            0            0            0           24          650            3            3 
#    d. Which columns have 0 missing values? [comprehension]
Columns with 0 missing values:
title
text
date_posted
date_updated
deleted
parking
craigslist
laundry
In R, missing values are represented by NA. So, when a column has 0 missing values, that means every row in the column has valid data (no missing data).
Columns with 0 missing values are perfect for analysis because they are complete, while columns with missing data require further attention. 
# 5. What time period does this data cover? Hint: convert the `date_posted`
#    column to an appropriate data type, then use the `range` function.
#    [code completion + comprehension]

In  dataset, the date_posted column is stored as a character type, meaning it is just text (like "2025-01-15"). For R to work with these dates correctly, I need to convert them into a Date type so that R can understand them as actual dates, not just text.
The as.Date() function is used for this.This function tells R, “Treat the values in this column as dates.”
format="%Y-%m-%d"specifies the format in which the dates are written in your dataset. 
The format %Y-%m-%d stands for:
%Y: Year (4 digits, e.g., 2025)
%m: Month (2 digits, e.g., 01 for January)
%d: Day of the month (2 digits, e.g., 15)
This means the date is in the format yyyy-mm-dd.
Once the date_posted column is converted to a proper Date type, I can use the range() function to get the earliest and latest dates in the column. The range() function gives me the minimum and maximum values in a vector, so in this case, it will return the earliest and latest dates.
Now that we have the time_period, ywe can print it to see the range of dates in the dataset.

# Step 1: Convert the 'date_posted' column to Date format
cl_rentals$date_posted <- as.Date(cl_rentals$date_posted, format="%Y-%m-%d")  # Adjust format as needed

# Step 2: Use range() to find the time period (earliest and latest dates)
time_period <- range(cl_rentals$date_posted)

# Print the result
print(time_period)
# 6. Compute the mean price for each pets category. Based on the means, are
#    apartments that allow pets typically more expensive? Explain, being
#    careful to point out any subtleties in the result.
#    [code completion + comprehension + interpretation]

I group the dataset by the “pets” column to calculate the mean price for each category (e.g., whether pets are allowed or not).
I can use the aggregate() function  to group the data and calculate the mean price for each category.
price ~ pets: This means compute the mean of the price column for each group in the pets column.
data = cl_rentals: This tells R to use the cl_rentals dataset.
FUN = mean: This tells R to calculate the mean price for each group of pets.
At last, i get an output showing the mean price for each category of the pets column by print.
Based on these values, apartments that allow dogs have the highest mean price (1828.742), while those that allow only cats are the least expensive (1531.630).
Apartments that allow both pets (cats and dogs) are priced in the middle (1771.407).
None is close to the mean price for “both” (1771.407) and slightly higher than the “cats” mean (1531.630), but lower than “dogs”.
The price differences are likely due to different factors, like the demand for dog-friendly apartments being higher, or specific areas where dog-friendly places may be priced higher.
It’s also possible that apartments allowing pets are in slightly more desirable areas or have other distinguishing features, which could explain the variation in pricing.

# Step 1: Compute the mean price for each pets category using aggregate
mean_price_by_pets <- aggregate(price ~ pets, data = cl_rentals, FUN = mean)

# Step 2: Print the result to check the mean price for each pets category
print(mean_price_by_pets)
# 7. The `sort` function sorts the elements of a vector. For instance, try
#    running this code:
#
#    x = c(4, 5, 1)
#    sort(x)
#    
#    Another way to sort vectors is by using the `order` function. The order
#    function returns the indices for the sorted values rather than the values
#    themselves:
#
#    x = c(4, 5, 1)
#    order(x)
#
#    These can be used to sort the vector by subsetting:
#
#    x[order(x)]
#    
#    The key advantage of `order` over `sort` is that it can also be used to
#    sort one vector based on another, as long as the two vectors have the same
#    length.
#    
#    Create two vectors with the same length, and use one to sort the elements
#    of the other. Explain how it (should) work.
#    [code completion + comprehension]

values = c(10, 20, 15) is a numeric vector with three values: 10, 20, and 15.
names = c("A", "B", "C") is a character vector with three elements: “A”, “B”, and “C”.
The order() function returns the indices that would sort the values vector in ascending order.
order(values) processes the values vector (c(10, 20, 15)) and determines the indices that would arrange them from the smallest to largest value.
values = c(10, 20, 15) gets sorted to c(10, 15, 20).
The positions (indices) of these sorted values in the original vector are:
•	10 is at position 1 in the original vector.
•	15 is at position 3 in the original vector.
•	20 is at position 2 in the original vector.
Therefore, order(values) returns the indices [1, 3, 2], which means the smallest value (10) is at index 1, followed by the value 15 at index 3, and the largest value 20 at index 2.
names[order(values)] sorts the names vector based on the indices returned by order(values).
The order(values) function has given us the sorted order [1, 3, 2] for values. Now, we use these indices to rearrange the names vector.
The names vector is c("A", "B", "C"). Using the order [1, 3, 2] means:
  •	Index 1 in names is “A”, so “A” comes first.
•	Index 3 in names is “C”, so “C” comes second.
•	Index 2 in names is “B”, so “B” comes last.
Therefore, the result of names[order(values)] is the sorted vector: c("A", "C", "B").
The order(values) function does not sort values directly. Instead, it gives us the indices that would sort the values vector. By using these indices, we can reorder any other vector, such as names, to match the sorted order of values.

# Create two vectors
values = c(10, 20, 15)
names = c("A", "B", "C")

# Use order to sort 'values' based on the order of 'names'
sorted_names = names[order(values)]

# Print the result
print(sorted_names)
# Output: [1] "A" "C" "B"

# 8. Use the `order` function to sort the rows of the Craigslist data set
#     based on the `sqft` column. [code completion + comprehension]
#
#     a. Compute a data frame that contains the city, square footage, and price
#        for the 5 largest apartments. [code completion + comprehension]
#
order(cl_rentals$sqft, decreasing = TRUE) is used to sort the data. The sqft column is specified as the criterion for sorting. By setting decreasing = TRUE, the data will be sorted in descending order—the largest square footage comes first.
After applying order to the sqft column, cl_rentals[order(cl_rentals$sqft, decreasing = TRUE), ] reorders the entire cl_rentals dataset based on the sorted square footage values. The comma , indicates that all columns should be returned, but the rows are reordered according to their square footage values.
The result is stored in the sorted_data variable, which is now a data frame with all rows sorted by the sqft column in descending order.
sorted_data[1:5, ] selects the first 5 rows of the sorted data. Since the rows are sorted by square footage in descending order, these rows represent the apartments with the largest square footage.
c("city", "sqft", "price") selects only the “city”, “sqft”, and “price” columns from the sorted data, as we’re interested in displaying the location, square footage, and price of the top 5 largest apartments.
The resulting data frame top_5_largest now contains the city, square footage, and price of the 5 largest apartments.
The print() function displays the contents of the top_5_largest data frame. This will show the city, square footage, and price of the five largest apartments based on the square footage.


# Sort the Craigslist dataset by 'sqft' in descending order (largest first)
sorted_data <- cl_rentals[order(cl_rentals$sqft, decreasing = TRUE), ]

# Select the top 5 largest apartments based on square footage
top_5_largest <- sorted_data[1:5, c("city", "sqft", "price")]

# Print the result
print(top_5_largest)
#     b. Do you think any of the 5 square footage values are outliers? Explain
#        your reasoning. [interpretation]
#
Yes, some of the square footage values could be considered outliers, particularly the first one.88,900 square feet is extremely large for an apartment in most locations. Typically, an apartment’s square footage ranges from a few hundred to a few thousand square feet. This value seems unusually high, and it’s more likely to be a data entry error or an extra-large commercial or industrial property rather than a typical residential apartment.
Given that the next largest apartment has 8,190 sqft (still large, but much smaller), the 88,900 sqft apartment is clearly an outlier in the context of typical apartment sizes.
While 8,190 sqft is large for an apartment, it is still within the realm of possibility for a very large residential unit, such as a luxury penthouse or a large house converted into an apartment.
Rancho Cordova (sqft = 2,500), Folsom (sqft = 2,296), and Roseville (sqft = 2,282),these square footage values are large, but they fall within a more reasonable range for upscale apartments, houses, or large condos.
They are quite large compared to the average apartment, but they are not extreme outliers like the first two values (88,900 sqft and 8,190 sqft).
The SACRAMENTO apartment (88,900 sqft) is a clear outlier and likely represents an error or an exceptional property type. The Roseville CA (8,190 sqft) apartment is also quite large but could be a legitimate large residential space, though still worth verifying. The other three apartments (Rancho Cordova, Folsom, and Roseville) have large square footage but are not outliers in the same sense.

#     c. Do you think any of the 5 square footage values are erroneous
#        (incorrect in the data)? [interpretation]

A square footage value of 88,900 is unreasonably large for a typical apartment. In urban areas, even large luxury apartments, penthouses, or houses would not have square footage anywhere near this size.
This could be an input error where the square footage was entered incorrectly (for example, an extra “0” could have been mistakenly added).
It’s highly unlikely that a typical apartment has this much square footage, so this number should be verified. It’s more plausible that it represents a commercial or industrial property or a data-entry mistake.
While 8,190 sqft is large, it could represent a luxury apartment, a penthouse, or a large converted house.
It is not inherently erroneous, but depending on the location and type of property, this might seem high for a residential unit in this area. If this property was listed as an apartment, a data check might be necessary to ensure that this is correct.
If this square footage value was mistakenly entered for a house or multi-unit building, it might be a discrepancy. However, in most cases, this size is within the realm of possibility for large residential spaces.
Rancho Cordova (sqft = 2,500), Folsom (sqft = 2,296), and Roseville (sqft = 2,282) are large but plausible for upscale apartments, houses, or larger condos.
They don’t seem erroneous because properties of this size do exist in high-end residential areas.
If these were supposed to be standard apartments and not larger homes or luxury units, it could be worth checking if they are misclassified, but they do not appear to be outright errors.
SACRAMENTO (sqft = 88,900) is almost certainly erroneous due to its extreme size and should be checked for a possible data-entry mistake.
Roseville CA (sqft = 8,190) might be correct, but it’s worth confirming whether it should be categorized as an apartment or a house, and further investigation into its listing could help determine if it’s genuinely a residential apartment or a different property type.
The other values (Rancho Cordova, Folsom, and Roseville) seem reasonable, but we could consider validating them with more context about the properties listed.




