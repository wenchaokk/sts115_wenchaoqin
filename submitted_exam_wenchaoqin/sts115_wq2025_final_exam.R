############
# BEGINNING OF EXAM
# You have read the README file, pushed the exam files up to GitHub,
# and synced your repositories.

# Good job - move on to the next question!

############
# QUESTION 1 (5 points)
# The variable `events`, defined below, contains the dates for several
# important events in the 20th century. Write code to convert these dates 
# into R `Date` objects. Then, in a few sentences explain why using a 
# standardized date format is or isn't a good idea.

events = c("Fri August-15 in 1969", "Tue Jun-6 in 1944", "Sat Jan-1 in 2000")

# Code Answer:
# install.packages("lubridate")
library("lubridate")
dates = c("Fri August-15 in 1969", "Tue Jun-6 in 1944", "Sat Jan-1 in 2000")
dates
result = mdy(dates)
result
class(result)
# Narrative Answer:
Using a standardized date format is a good idea.
Different countries use different date formats, which can lead to misinterpretation. A standardized format  eliminates confusion.
Standardized date formats allow for easy comparison, sorting, and arithmetic operations . If dates are stored as text, sorting might not work as expected.



############
# QUESTION 2 (15 points)
# 2.1. The variable `menu`, defined below, contains a string from a local
# restaurant's online menu. Use string processing to convert this string into a
# data frame with separate columns for 'item' and 'price'. Next, combine your
# data-frame with the data frame 'guads', below. This combined data frame should 
# have a populated column called 'restaurant' so it's clear which row came from 
# Mayas (the original 'menu' data) and which came from Taqueria Guadalajaras ('guads').

# Tip! Print the variable after you instantiate it and before you try to write 
# code to answer the rest of the question. This will help you to form a better 
# strategy for splitting the string. You can also use the Regex validator at 
# https://regex101.com/ to verify that your Regex works correctly before you 
# use it in your R code.

menu = "MAYAS
Street taco ......... 3.99
Crispy taco ........... 6.99
Potato taco .......... 4.99
Veggie burrito ........ 7.49
Regular ............. 13.99
Super ............... 15.99
Chimichanga ......... 14.00
Beans, rice & cheese .... 10.99"


guads = data.frame(
  type = c("Taco de camaron", "Taco de pescado", "Taco dorado","Veggie burrito", "Regular", "Super", "Super Giant", "Chimichanga", "Beans, rice & cheese"),
  price = c(3.99, 3.99, 4.29, 9.49, 8.99, 10.99, 20.99, 11.99, 5.99)
)



# Code Answer:


library(stringr)
library(dplyr)

# Define the menu string
menu <- "MAYAS
Street taco ......... 3.99
Crispy taco ........... 6.99
Potato taco .......... 4.99
Veggie burrito ........ 7.49
Regular ............. 13.99
Super ............... 15.99
Chimichanga ......... 14.00
Beans, rice & cheese .... 10.99"

# Remove the first line with restaurant name and split by lines
menu_lines <- str_split(menu, "\n")[[1]] %>% .[-1]

# Use str_split_fixed to separate item and price
item_price_matrix <- sapply(menu_lines, function(line) str_split_fixed(line, "\\.{2,}", 2))

# Create a data frame for the menu items
menu_df <- data.frame(
  item = item_price_matrix[1,],  # Extract item names
  price = as.numeric(item_price_matrix[2,]),  # Convert price to numeric
  restaurant = "Mayas"  # Assign restaurant name
)

# Create the 'guads' data frame
guads_df <- data.frame(
  item = c("Taco de camaron", "Taco de pescado", "Taco dorado", "Veggie burrito", "Regular", 
           "Super", "Super Giant", "Chimichanga", "Beans, rice & cheese"),
  price = c(3.99, 3.99, 4.29, 9.49, 8.99, 10.99, 20.99, 11.99, 5.99),
  restaurant = "Taqueria Guadalajaras"
)

# Combine menu_df and guads_df manually without using rbind or mutate
combined_df <- data.frame(
  item = c(menu_df$item, guads_df$item),  # Combine item columns
  price = c(menu_df$price, guads_df$price),  # Combine price columns
  restaurant = c(menu_df$restaurant, guads_df$restaurant)  # Combine restaurant columns
)

# Print the final result
print(combined_df)



# Narrative Answer:

Narrative Answer:
  
first , I need employed string processing functions from the stringr package.
I used str_split(menu, "\n") to break the menu string into individual lines. This approach allowed me to isolate each menu item and its price. Since the first line contains the restaurant name, I removed it by selecting all lines except the first ([-1]).
Each remaining line was split into two parts using str_split_fixed(line, "\\.{2,}", 2). This function splits the line into the item name and price by looking for occurrences of two or more dots. This produced a matrix, where the first column contains the item names and the second column contains the corresponding prices. The item names were stored as character data, and the prices were converted into numeric values for calculations.
Using the extracted items and prices, I created the menu_df data frame. I manually added a column for the restaurant name (“Mayas”) for each entry.
The data for “Taqueria Guadalajaras” was already provided in the guads data frame. I added a column for the restaurant name, specifying “Taqueria Guadalajaras” for each row.
 I directly combined the two data frames (menu_df and guads_df) by concatenating their columns using c(). This resulted in a new data frame, combined_df, where each row is clearly labeled with the restaurant it came from.

This method ensures that both sets of restaurant data are combined into a single, easy-to-read table, where the restaurant name is included for each item. It avoids using mutate() or rbind(), as requested, by manually creating the combined data frame through column-wise concatenation.


# 2.2. Write code to generate a single data visualization to show the price by
# item per restaurant. In a few sentences, describe how your data visualization 
# may be easier to use than looking at the online menus when you and your friends 
# are deciding where to go for lunch.

# Code Answer:

library(ggplot2)

# Create the data frames (menu_df and guads_df already created in previous steps)
menu_df <- data.frame(
  item = c("Street taco", "Crispy taco", "Potato taco", "Veggie burrito", "Regular", 
           "Super", "Chimichanga", "Beans, rice & cheese"),
  price = c(3.99, 6.99, 4.99, 7.49, 13.99, 15.99, 14.00, 10.99),
  restaurant = "Mayas"
)

guads_df <- data.frame(
  item = c("Taco de camaron", "Taco de pescado", "Taco dorado", "Veggie burrito", "Regular", 
           "Super", "Super Giant", "Chimichanga", "Beans, rice & cheese"),
  price = c(3.99, 3.99, 4.29, 9.49, 8.99, 10.99, 20.99, 11.99, 5.99),
  restaurant = "Taqueria Guadalajaras"
)

# Combine the two data frames
combined_df <- data.frame(
  item = c(menu_df$item, guads_df$item),  # Combine item columns
  price = c(menu_df$price, guads_df$price),  # Combine price columns
  restaurant = c(menu_df$restaurant, guads_df$restaurant)  # Combine restaurant columns
)

# Create a bar plot to show price by item per restaurant
ggplot(combined_df, aes(x = item, y = price, fill = restaurant)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_minimal() +
  labs(title = "Price by Item per Restaurant",
       x = "Menu Item",
       y = "Price (in USD)",
       fill = "Restaurant") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))




# Narrative Answer:
I do the things agin in part a to ste the data. Using ggplot2, I generated a bar plot to compare the prices of each item at the two restaurants. The geom_bar() function creates the bars, with the position = "dodge" option ensuring the bars for the same item from different restaurants are placed side by side. The fill = restaurant argument colors the bars based on the restaurant.
The plot uses a minimal theme, and the x-axis labels are rotated by 45 degrees for better readability.
In this way , we can esay to see the differnce price in 2 restaurant by useing differnect color. also the bar make it ease ti find the prcie difference. you can find the higest price easily.

#############
# QUESTION 3 (15 points)
# Use the Cat Facts API documentation at 
# https://alexwohlbruck.github.io/cat-facts/docs/ to make a request to 
# the Cat Facts "facts" endpoint and retrieve 5 random facts about cats. 

# Note: you must properly construct the URL for your request by adding the 
# "endpoint" for your specific request as documented on the site to the 
# "base URL for all endpoints" which is also documented on the site.  
# All of the information that you need to construct a well-formed URL for your 
# request appears somewhere in the documentation, and you should be able to do 
# this using your knowledge of how URLs are constructed.

# Code Answer:
# Load necessary library
library(httr)

# Construct the URL for the "random" facts endpoint
base_url <- "https://cat-fact.herokuapp.com"
endpoint <- "/facts/random"
url <- paste0(base_url, endpoint, "?animal_type=cat&amount=5")  # 5 random cat facts

# Make the GET request to the API
response <- GET(url)

# Check the status of the response
if(status_code(response) == 200) {
  # Parse the response content
  content <- content(response, "parsed")
  
  # Extract the 'text' field from each fact
  facts <- sapply(content, function(fact) fact$text)
  
  # Print the facts
  print(facts)
} else {
  print("Failed to retrieve facts.")
}


#############
# QUESTION 4 (20 points)
# Wikipedia has a table of female Nobel Laureates at: 
# https://en.wikipedia.org/wiki/List_of_female_Nobel_laureates

# Write code that scrapes the page to get a data frame with the 
# year, name, country, and category for each laureate. You DO NOT need to worry
# about cleaning up the text to remove footnotes, parenthetical notes, 
# dual countries, or dual categories for this question.


# Code Answer:
library(xml2)
library(rvest)

# Define the URL
wiki_url <- "https://en.wikipedia.org/wiki/List_of_female_Nobel_laureates"

# Read the HTML content of the page
wiki_doc <- read_html(wiki_url)

# Extract all tables from the page
tables <- xml_find_all(wiki_doc, "//table")

# Check the structure of the tables to identify the one with the Nobel laureates
length(tables)  # Check how many tables there are
head(tables, 2)  # Check the first few tables for their structure

# Assuming the table with female Nobel laureates is the second one:
female_nobel_table <- html_table(tables[2], fill = TRUE)

# View the first few rows of the table to confirm it's the correct one
head(female_nobel_table)
######################################
# QUESTION 5 (20 points)
# The file `nobel_laureates_messy.rds` (included in the zip file you downloaded 
# that contains this exam file) contains a data frame with information about 
# female Nobel Laureates, scraped from Wikipedia. 

# 5.1. This new data frame is terribly messy. One issue is that while each row 
# corresponds to one laureate,  the `Laureate` column sometimes contains a 
# parenthetical note in addition to the laureate's name. Separate the name of 
# each laureate from these notes, so that the name is alone in the `Laureate` 
# column, and the note is stored in a new column called `Note`.

# Make sure there are no parentheses in the text in the `Note` column. For rows
# where there is no note, the value of the note should be `NA` or the empty 
# string `""` (either is acceptable, but don't use a mix of both).  This question 
# will require you to apply various skills that we learned in this course, 
# including manipulating the columns of a data frame and using regular expressions
# to identify substrings within a string.  

# Hint: The question asks you to apply computational operations across all 
# rows/observations in the data frame.  There are several ways to apply the same 
# function to all observations in R.  Before you begin coding, think about 
# how you will accomplish this iteration.  
                                                                                                        

# Code Answer:

library(stringr)

# Load the RDS file into an R object
my_data <- readRDS("nobel_laureates_messy.rds")

# Use str_match to capture the shared names in parentheses
my_data$Note <- str_match(my_data$Laureate, "\\((.*)\\)")[,2]  # Extract content inside parentheses

# Use str_replace to remove parentheses and shared names from the Laureate column
my_data$Laureate <- str_replace(my_data$Laureate, "\\s*\\(.*\\)", "")

# If the Note column is empty (meaning no shared names were found), set it to NA
my_data$Note[is.na(my_data$Note)] <- NA

# View the cleaned data
print(my_data)

# 5.2. What is something else you noticed about this data frame that should be
# cleaned before it is used in an analysis?

# Narrative Answer:

we should delate all the shareed with in the note , 


##############
# QUESTION 6 (25 points)
# For this question you will need add the carData package to your environment.
# Next, run this code: 
demo <- carData::MplsDemo

# 6.1. In a paragraph, describe what 'demo' is about and define the variables 
# it contains. Include an explanation of how you determined your answers.

# Narrative Answer:

The dataset demo contains information about various neighborhoods .
Each row corresponds to a neighborhood, and it includes 8 variables . 
The dataset consists of several variables:neighbor, balck , white, population,foreign born,income,provert, college.


you can see it in data demo in the first line 

# 6.2. Investigate this dataset and provide a short answer to the questions below.

# a. How many rows and columns are in the data set?
# Narrative Answer: 
8 colums
100 rows
# b. What are the names and classes of the columns in the data set?
# Narrative Answer: 
library(carData)
> demo <- carData::MplsDemo
> 
  > # Check the structure of the dataset to see column names and classes
  > str(demo)

1.	neighborhood: character (chr)
2.	population: numeric (num)
3.	white: numeric (num)
4.	black: numeric (num)
5.	foreignBorn: numeric (num)
6.	hhIncome: numeric (num)
7.	poverty: numeric (num)
8.	collegeGrad: numeric (num)

# c. How many missing values are in each column?
# Narrative Answer: 
missing_values <- colSums(is.na(demo))
missing_values
neighborhood   population        white        black  foreignBorn     hhIncome      poverty  collegeGrad 
0            0            0            0            0            0            0            0 
> 
# d. How many missing values are in the data set in total?
# Narrative Answer: 
  > total_missing_values <- sum(is.na(demo))
> total_missing_values
[1] 0


# Code Answer: Add any code here that you wrote to help you answer questions a-d above.
> str(demo)
missing_values <- colSums(is.na(demo))
missing_values
> total_missing_values <- sum(is.na(demo))
> total_missing_values

# 6.3. Write code to help you identify any outliers in 'demo'. You can use 
# statistics or plotting to determine your answer. Return the index of any 
# outliers you discover.

# Code Answer

# Load necessary libraries
library(ggplot2)

# Function to identify outliers based on IQR
identify_outliers <- function(x) {
  Q1 <- quantile(x, 0.25)
  Q3 <- quantile(x, 0.75)
  IQR <- Q3 - Q1
  lower_bound <- Q1 - 1.5 * IQR
  upper_bound <- Q3 + 1.5 * IQR
  outliers <- which(x < lower_bound | x > upper_bound)
  return(outliers)
}

# Apply outlier identification function to each numeric column in demo
outliers_list <- lapply(demo[, sapply(demo, is.numeric)], identify_outliers)


outliers_index <- list()

# Add outlier indices to the list
for (var_name in names(outliers_list)) {
  outliers_index[[var_name]] <- outliers_list[[var_name]]
}

# Print the outlier indices for each variable in the dataset
outliers_index


# 6.4. Write a question to investigate using this data. Then, write code to 
# generate a data visualization that helps address your question.

# Your research question:


comapre the gard rate  between balck and white

# Code Answer

# Load necessary library
# Load necessary libraries
library(ggplot2)
library(tidyr)  # For reshaping data

# Create a data frame for plotting
grad_data <- data.frame(
  neighborhood = demo$neighborhood,
  white_grad = demo$collegeGrad * demo$white,  # White graduation rate
  black_grad = demo$collegeGrad * demo$black   # Black graduation rate
)

# Melt the data frame using pivot_longer from tidyr
grad_data_melted <- grad_data %>%
  pivot_longer(cols = starts_with("white_grad"):starts_with("black_grad"),
               names_to = "race",
               values_to = "graduation_rate")

# Plot comparison between White and Black graduation rates by neighborhood
ggplot(grad_data_melted, aes(x = neighborhood, y = graduation_rate, fill = race)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Comparison of College Graduation Rates by Race Across Neighborhoods",
       x = "Neighborhood",
       y = "Graduation Rate",
       fill = "Race") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))  # Rotate x-axis labels for better readability


#############
# END OF EXAM
# Save and push your exam files to GitHub.
#############

# Congratulations, you're done! We wish you a restful spring break.