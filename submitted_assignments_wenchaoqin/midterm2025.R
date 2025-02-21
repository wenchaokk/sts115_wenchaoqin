################################################################
# This file contains questions for the midterm exam for STS115 #
# Winter Quarter, 2025.                                        #
#                                                              #
# This is exam is designed to provide you with the chance      #
# to demonstrate your understanding of both the concepts       #
# and syntax of the methods deployed by Data Scientists.       #
# As such, even if you are unable to provide working code      #
# for questions that require you to code, we encourage you     #
# to provide pseudo code and/or a textual explanation          #
# of your understanding of how one would approach the          #
# problem computationally, or even how the computer itself     #
# would approach the problem given your knowledge of how       #
# computers and programming languages work.                    #
#                                                              #
# Because problem solving is an essential part of being a      #
# Data Scientist, you are allowed to use any resources at      #
# your disposal to respond to the questions in this exam.      #
# This includes, but is not limited to, resources such as      #
# Google, Stack Overflow, the Course Reader, etc.              #
# The only restriction is that you may not use live chat,      # 
# messaging, email, discourse, Slack, or any other method of   # 
# real-time communication with another member of the course    #
# or any other person to formulate your response.              #
#                                                              #
# Questions appear as comments in this file.  As with the      #
# homework assignments, place your answers to each question    #
# immediately following the question prompt. Some questions    #
# require you to write computer code (R or Shell Script) as    #
# an answer and other questions ask you to provide text only   #
# explanations of computing and Data Science concepts.         #
# The phrase "[Text Answer]" appears immediately following     #
# each question that requires a text only answer. As noted     #
# above, you are encouraged to include text explanation of     #
# your code answers in all cases to increase your chances      #
# of earning partial credit for a question in the event that   #
# your code solution is incorrect.                             #
#                                                              #
# The exam duration is 1.5 hours.                              #                                                             #                                                              #
# Submit your completed exam and generated files via Github    #
# using the same workflow that you have used to submit your    #
# class homework.                                              #
################################################################


# Question 1. What is the command line symbol that provides 
# a shortcut to your "home" directory on your system.  For 
# example, what symbol would you use in place of "x" in the 
# command "cd x" if you wanted to use the cd command to move 
# into your home directory:

The cd command (short for “change directory”) is used in Unix-based systems (Linux, macOS) and Unix-like environments (Git Bash on Windows) to navigate between directories.
The tilde (~) is a special shortcut that represents the current user’s home directory.
On different operating systems, the home directory location is:Linux/macOS: /home/username or /Users/username
Windows (Git Bash or WSL): /c/Users/username

cd ~
 



# Question 2. Write R code to assign the value 7 to a variable "x":

In R, the assignment operator <- is commonly used to assign values to variables.
x <- 7 assigns the value 7 to the variable x.

x <- 7



# Question 3. Write R code that subtracts 3 from the variable "x" 
# and assigns the results to a variable "y":

y <- x - 3 performs subtraction, taking the value stored in x and subtracting 3 from it.
The result is assigned to the variable y using the <- assignment operator.
If x was previously assigned the value 7, as in the previous question, then y will be assigned the value 4
  
y <- x - 3


# Question 4. Assign the values 1, 23, 6, 2, 19, 7 to a vector:

c() (concatenate function) is used to create a vector in R.
The values inside the parentheses (1, 23, 6, 2, 19, 7) are combined into a single vector.
The vector is assigned to the variable v using the <- assignment operator.

v <- c(1, 23, 6, 2, 19, 7)

# Question 5. Run the code `“four” < “five”`. Paste the output 
# from R into a comment and explain why you think it provided 
# that result: [Text Answer]

[1] FALSE
In R, when comparing character strings using <, the comparison is based on lexicographic (dictionary) order.
Strings are compared letter by letter based on their ASCII values (or Unicode values).
The first letters of both words are compared:
"f" in "four" has an ASCII value of 102.
"f" in "five" also has an ASCII value of 102.
Since the first letters are the same, R moves to the second letter:
"o" in "four" has an ASCII value of 111.
"i" in "five" has an ASCII value of 105.
Because “o” (111) is greater than “i” (105), "four" < "five" evaluates to FALSE.

Thus, "four" is considered greater than "five" in lexicographic ordering.

# Question 6. Write a for loop that loops through each element in
# the vector you created in your answer to Question 4 and prints
# each value to screen:

The function c(1, 23, 6, 2, 19, 7) creates a vector containing six numbers: 1, 23, 6, 2, 19, 7.This vector is stored in the variable v.
The for loop allows us to go through each element in the vector one by one.
value is the loop variable (it will take on each element of v one at a time).v is the sequence (the vector we are looping through).
The loop starts by taking the first element of v (1) and assigns it to value.
It then executes print(value), which displays 1 on the screen.
The loop moves to the next element (23), assigns it to value, and prints it.
This process continues until all elements in v have been printed.

# Define the vector
v <- c(1, 23, 6, 2, 19, 7)

# Loop through each element and print
for (value in v) {
  print(value)
}

# Question 7. Assign the value 3 to a variable "x" and write
# a conditional statement that tests whether x is less than 5.  
# If it is, print "Yay!" to screen:

The line x <- 3 assigns the value 3 to the variable x.
The if statement checks if x is less than 5 (x < 5).
If this condition is TRUE, the code inside the {} (curly brackets) runs.
Since x = 3 and 3 is less than 5, the condition is met.
The print("Yay!") statement executes and prints "Yay!" to the screen.
If x were 5 or greater, the condition (x < 5) would be FALSE, and nothing would be printed.

# Assign the value 3 to x
x <- 3

# Conditional statement to check if x is less than 5
if (x < 5) {
  print("Yay!")
}

# Question 8. Download the "wine_enthusiast_rankings.csv" file from
# the "data" directory in the "Files" area of the course Canvas
# website and then write code to load it into a variable called "wine_revs":

The readr package provides the read_csv() function, which is faster and more efficient than read.csv().
I can install it by using library(readr)
read_csv(file_path) reads the CSV file from the directory it stored (full file path),and stores it in the variable wine_revs.
Unlike read.csv(), read_csv() automatically handles column types (e.g., numbers, text, dates).
head(wine_revs) prints the first few rows to check if the data was loaded correctly.


# Load the readr package (if not installed, install it using install.packages("readr"))
library(readr)

# Read the CSV file into the variable wine_revs
wine_revs <- read_csv("/Users/wenchaoqin/Downloads/wine_enthusiast_rankings.csv")

# Print the first few rows to verify
head(wine_revs)

# Question 9.  Write code to determine the class of the "wine_revs"
# data object you created in Question 8 above:

The class() function in R is used to determine the type or class of an R object. In R, objects can take many forms—ranging from simple atomic data types like integers and characters to more complex data structures such as data frames, matrices, and lists. Each of these objects belongs to a specific class, and the class defines how the object behaves in various contexts and which methods can be used with it.
When i apply class() to wine_revs, it will return the class of the object,which depending on how the data was loaded and its structure.


# Determine the class of the wine_revs data object
class(wine_revs)

# Question 10. Write code that returns the column/variable
# names of the "wine_revs" object:

The colnames() function is used to retrieve the column names (or variable names) of an object, typically a data frame or matrix.
It allows me to access the labels of the columns, which is important for data manipulation, subsetting, and exploration.
When you run colnames(wine_revs), R will return a character vector containing the names of all columns (variables) in the data frame wine_revs.

# Return the column names of the wine_revs object
colnames(wine_revs)

# Question 11. Write code to load all observations from the
# "price" column/variable of the "wine_revs" object into
# a vector called "wine_prices":

In R, you can access a specific column in a data frame (or tibble) using the $ operator.
The syntax is:data_frame$column_name. Here, wine_revs$price accesses the “price” column of the wine_revs data frame.
The column wine_revs$price contains all the observations (rows) of the “price” variable, which is automatically stored in the vector wine_prices.
The result is a vector of values corresponding to the “price” column from the wine_revs data frame.

# Load all observations from the "price" column into the vector wine_prices
wine_prices <- wine_revs$price

# Question 12. Subset the "wine_revs" object to create a new 
# data.frame named "wine_revs_truncated" that contains all 
# observations for only the numeric ID, Points, Price, Variety, 
# and Winery columns/variables in "wine_revs": 

wine_revs[, c(...)]: This part tells R to subset the wine_revs data frame. The , separates the rows (before the comma) and columns (after the comma). Since we want all rows, we leave the rows part empty (wine_revs[, ]).
•	c("...1", "points", "price", "variety", "winery"): The c() function combines the column names into a vector. We are selecting the columns ”…1”, “points”, “price”, “variety”, and “winery” based on the correct names you found in colnames(wine_revs).



# Subset the wine_revs data frame to include the correct columns
> wine_revs_truncated <- wine_revs[, c("...1", "points", "price", "variety", "winery")]


# Question 13. Save the "wine_revs_truncated" that you created 
# in Question 12 to your course working  directory 
# as an RDS file named "wine_revs_truncated.rds":

The saveRDS() function is used to save an R object (in this case, the wine_revs_truncated data frame) to a file on your computer.
If i want to save it to a specific directory, i can include the full path.
If i only specify "wine_revs_truncated.rds", it will save the file in my current working directory.

# Save the wine_revs_truncated data frame as an RDS file
saveRDS(wine_revs_truncated, file = "wine_revs_truncated.rds")


# Question 14. Below is an R function that receives a single 
# argument (an integer) and returns the square root of that
# argument.  Write code (below the function) that calls the 
# function sending it the value 144 as its argument and assigns
# the returned result to a variable "z".  Note:  Be sure to run
# code of the function to load it into your environment before
# you try to call it in your answer or you won't be able to test
# your answer.

getSqrt <- function(argument_1) {
  retval <- sqrt(argument_1) 
  return(retval)
}

The code defines a function called getSqrt that takes a number as input, computes its square root using the sqrt() function, and returns the result. After defining the function, it is called with the argument 144. The function calculates the square root of 144, which is 12, and returns this value. The result is stored in the variable z, and finally, the value of z is printed to the console.

# Define the function
getSqrt <- function(argument_1) {
  retval <- sqrt(argument_1) 
  return(retval)
}

# Now call the function with 144
z <- getSqrt(144)

# Print the result
print(z)

# Question 15. Write code that you would use to install the "fortunes"
# package onto your local machine and then load it into the working
# R environment:

install.packages("fortunes") installs the “fortunes” package from CRAN (the Comprehensive R Archive Network).
The install.packages() function downloads and installs the specified package. Once the package is installed, it is available for use in future R sessions, but i will need to load it explicitly each time i start a new session.
	After the package is installed, use library() to load it into the current R session.
The library() function makes the functions, datasets, and other objects from the “fortunes” package available for use in the R environment.

install.packages("fortunes")
library(fortunes)


# Question 16. Why doesn't R automatically load every installed package when 
# it starts: [Text Answer]

R does not automatically load every installed package upon startup to conserve memory and improve performance. Automatically loading all packages would increase R’s memory usage and startup time, potentially causing slowdowns. It could also lead to conflicts between functions in different packages, as well as unnecessary loading of dependencies. By requiring users to explicitly load packages, R gives more control and flexibility, allowing users to manage their environment and avoid namespace issues. This approach ensures a cleaner, faster, and more efficient workflow, focusing on only the packages needed for the task at hand.


# Question 17. What command(s) create a repository and put that
# directory under git control:

git init initializes a new Git repository in the current directory, creating a .git folder that tracks all version control information.
git add  adds all the files in the directory to the staging area, preparing them to be committed.
To save the changes and commit them to the repository, use git commit
  
git init: Initializes the repository.
git add .: Adds all files to Git.
git commit -m "message": Commits the changes to the repository.



# Question 18. List an advantage and a disadvantage for each of the
# following data file formats: [Text Answer]
#   
#     a. RDS files

Advantage:
Efficient Storage of R Objects: RDS files store R objects in their native format, preserving the structure and data types. This allows for efficient saving and loading of complex data structures (like data frames, lists, etc.), without any data type conversion, which can reduce the potential for errors or data loss.
•	Disadvantage:
R-Specific: RDS files are specific to R, meaning they cannot be easily opened or used by other software outside of the R ecosystem. This reduces interoperability and limits their use in environments where R is not available.
#
#     b. CSV files
advantage
Universal Compatibility: CSV files are plain text files and can be opened by a wide range of programs, including Excel, Google Sheets, databases, and even other programming languages. This makes them highly portable and easy to share with users who may not be familiar with R.
•	Disadvantage:
  •	Limited Data Types: CSV files do not store any metadata about the data (e.g., column types, date formats). This means that complex data structures (like factors or dates) can be misinterpreted during import/export, leading to potential data quality issues.



# Question 19. Discuss what statisticians mean when they talk about
# finding the "center" of a data set: [Text Answer]

When statisticians talk about finding the “center” of a data set, they are referring to identifying a representative value that summarizes the central location of the data. The center is a measure that describes the typical or average value around which the data points cluster. There are several ways to define and measure the center:
  1.	Mean: The arithmetic average, calculated by summing all data points and dividing by the number of points. It is commonly used when the data is symmetric and there are no extreme outliers.
2.	Median: The middle value when the data is ordered. If the data set has an odd number of values, the median is the middle value; if even, it is the average of the two middle values. The median is more robust than the mean when the data has outliers or is skewed.
3.	Mode: The value that appears most frequently in the data set. It can be useful for categorical data, where the most common category represents the “center.”




# Question 20.  Explore the "wine_revs" data object that you created in 
# Question 8 above and calculate some summary statistics. Include in your 
# answer the code that you used to generate the statistics and outputs,
# a text explanation of the statistics you generated, and an interpretation
# of what those statistics mean.
#
# [Code Answer]
#
# [Text Answer]

summary(wine_revs) provides a summary of the entire wine_revs data frame, showing key statistics such as the minimum, 1st quartile (25%), median (50%), mean (average), 3rd quartile (75%), and maximum values for each numeric variable (e.g., price, points). For categorical variables (e.g., variety, winery), it shows counts of the most frequent values.
mean_price and sd_price mean price is the average price of the wines in the dataset. It is calculated by summing all the prices and dividing by the number of observations. The standard deviation (SD) of price measures the variation in prices. A larger SD indicates that the prices vary more widely.
The mean points represent the average rating given to the wines. The median points represent the middle value of the ratings when they are ordered. If the mean and median are close, it suggests that the distribution of ratings is fairly symmetric. If the mean is much higher than the median, it indicates a positive skew, where higher ratings are more common. Conversely, if the mean is much lower than the median, it suggests a negative skew.

Price: The mean price of $35.36 indicates that on average, wines in this dataset cost about $35. However, with a standard deviation of $41.02, there is significant variation in wine prices, meaning some wines are much cheaper or more expensive than others. The price range is from $4 to $3300, indicating the presence of both affordable and luxury wines.
•	Wine Ratings (Points): The mean and median ratings are quite close, with the mean being 88.45 and the median being 88. This suggests that the distribution of wine ratings is fairly symmetrical and centered around 88. The slight difference between the mean and median indicates that there are a few wines with higher ratings that are pulling the mean up, but the bulk of the wines are rated around 88.
The data shows a wide range in both prices and ratings, with a slight skew in prices due to the presence of a few very expensive wines.
•	The ratings distribution is fairly balanced, with most wines rated around 88.


# Summary statistics for the entire data frame
summary(wine_revs)

# Calculate the mean and standard deviation for the "price" column
mean_price <- mean(wine_revs$price, na.rm = TRUE)
sd_price <- sd(wine_revs$price, na.rm = TRUE)

# Calculate the mean and median for the "points" column
mean_points <- mean(wine_revs$points, na.rm = TRUE)
median_points <- median(wine_revs$points, na.rm = TRUE)

# Display results
mean_price
sd_price
mean_points
median_points
