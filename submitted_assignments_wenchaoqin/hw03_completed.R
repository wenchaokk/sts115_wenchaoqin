# This file contains homework questions for the lecture on 
# Control Structures and Functions.  Questions appear as comments 
# in the file.  Place your answers as executable code immediately 
# following the relevant question.


# QUESTION 1: Assign the value 3 to a variable "x" and write
# a conditional statement that test whether x is less than 5.  
# if it is, print "Yay!" to screen.

#x <- 3  # Assigning 3 to the variable x

#if (x < 5) {  # Checking if x is less than 5
 # print("Yay!")  # Printing "Yay!" if the condition is true
#}

# QUESTION 2:  Create two variables "x" and "y" and assign 
# each a numeric value. Create a conditional statement that 
# tests whether the value of a variable "x" is equivalent 
# to the value of variable "y." If the values are equivalent, 
# print "The variables are equal" to screen. If they are not 
# equivalent, print "The variables are not equal" to screen.

#x <- 10  # Assign a numeric value to x
#y <- 20  # Assign a numeric value to y

#if (x == y) {
 # print("The variables are equal")
#} else {
 # print("The variables are not equal")
#}

# QUESTION 3:  Duplicate the conditional code from above, but 
# change the logic of the conditional so that it tests for 
# conditions in which "x" IS NOT EQUIVALENT" to "y" and print 
# the appropriate message to screen accordingly.

x <- 10  # Assign a numeric value to x
y <- 20  # Assign a numeric value to y

# Modified condition (x != y)
if (x != y) {
  print("The variables are not equal")
} else {
  print("The variables are equal")
}

# QUESTION 4:  Assign the boolean value TRUE to the variable "x", 
# and then create a conditional statement that tests whether the 
# value of a variable "x" is TRUE or FALSE. If the value is true, 
# print "X is true" to screen. If false print "X is false" to screen.

x <- TRUE  # Assign the boolean value TRUE to x

if (x) {
  print("X is true")
} else {
  print("X is false")
}

# QUESTION 5: Write a "for" loop that iterates through the 
# values 1 to 10 and prints the iteration number to screen 
# during each loop.

for (i in 1:10) {
  print(paste("Iteration number:", i))
}


# Question 6: Assume that you want to create a loop that executes 
# exactly 10 times. Assign the value 1 to "x" and then write a "while" 
# loop that iterates based on a test of the value of "x" and for each 
# loop prints the value of "x" to the screen. 
#
# The printed output should look like:
#
# 1 2 3 4 5 6 7 8 9 10
#
# Note that depending on your browser the numbers may print to the same 
# line or each on a new line.

x <- 1  # Assign the value 1 to x

while (x <= 10) {  # Loop while x is less than or equal to 10
  cat(x, " ")  # Print x followed by a space
  x <- x + 1  # Increment x by 1
}

# Question 7: Create a list or vector object that contains 
# the following values:
#
# Tesla, Nissan, Harley, Chevy, Indian, MG. 
# 
# Then write code that loops through each item in the list and
# prints the value to screen

# Create a vector with the given values
vehicles <- c("Tesla", "Nissan", "Harley", "Chevy", "Indian", "MG")

# Loop through each item and print its value
for (vehicle in vehicles) {
  print(vehicle)
}

# Question 8: Write code that loops through each item in the list 
# object that you created for Question 3 above and, for each value,
# if the values is "Harley" or "Indian" print, "This is a motorcycle" 
# to screen. Otherwise print, "This is a car" to screen.

# Create the vector with vehicle names
vehicles <- c("Tesla", "Nissan", "Harley", "Chevy", "Indian", "MG")

# Loop through each item
for (vehicle in vehicles) {
  if (vehicle == "Harley" | vehicle == "Indian") {
    print("This is a motorcycle")
  } else {
    print("This is a car")
  }
}

# Question 9: Assign the values 1-10 to a vector.  Then, loop through
# your vector and print each value to screen unless the value is 5.  (The
# final output of your process should be: 1 2 3 4 6 7 8 9 10)

# Assign values 1-10 to a vector
vector <- 1:10

# Loop through the vector and print each value unless it is 5
for (value in vector) {
  if (value != 5) {
    cat(value, " ")
  }
}


# QUESTION 10: Write a function that performs a simple math equation 
# with a variable. Run the function substituting the variable with 
# at least three different values by calling it in a loop. For 
# instance, if you write a function for a variable "x", Use a loop 
# call the function for at least three numbers as "x".

# Define a function that performs a simple math equation
math_function <- function(x) {
  return(x^2 + 3*x + 5)  # Example equation: x² + 3x + 5
}

# Define values to substitute for x
values <- c(2, 5, 7)

# Loop through the values and call the function
for (x in values) {
  result <- math_function(x)
  cat("For x =", x, ", the result is:", result, "\n")
}
