
######################################################################
# 1. Interview 5 people from outside of STS115 and add their data to the “my_data” data
frame from class to create a new data frame called “our_data”. You will use this for the
subsequent questions. (Please do not interview someone who a classmate has already
                       interviewed. You can call, Zoom, etc. but you need to actually talk to other human
                       beings to complete this assignment!)
# add 5  data into the new_data
> new_data <- data.frame(
  +     response = c("Sociology", "Sociology", "Sociology", "Sociology", "Sociology"),
  +     major = c("SOC", "SOC", "SOC", "SOC", "SOC"),
  +     study = c("ARC", "ARC", "ARC", "ARC", "ARC"),
  +     location = c("Peet's", "Peet's", "Peet's", "Peet's", "Peet's"),
  +     pet = c("Woof", "Woof", "Woof", "Woof", "Woof"),
  +     distance.mi = c(5, 3, 8, 2, 4),
  +     time.min = c(25, 30, 28, 22, 24))
#combine my_data and new_data into our_data 
> our_data <- rbind(my_data, new_data)

# 2. Come up with a yes/no or true/false question you’d have liked the survey to have
asked. Make up these data for every subject in the survey, then create it as a logical
vector and add it to the data frame.
# Logical vector for the new question
> enjoy_outdoor <- c(TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE, TRUE, TRUE, FALSE,TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE, TRUE, TRUE, FALSE,TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE, TRUE, TRUE, FALSE,TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE, TRUE, TRUE, FALSE,TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE, TRUE, TRUE, FALSE,TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE, TRUE, TRUE, FALSE,TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE, TRUE, TRUE, FALSE,TRUE)
> 
  > # Add it to the data frame
  > our_data$Enjoys_Outdoor_Activities <- enjoy_outdoor



# 3. Use a single function to return the class of each column in the data frame.

# 'our_data' is our data frame
column_classes <- sapply(our_data, class)

# Print the result
print(column_classes)



# 4. Look up how to use the function `max`. Use it to calculate the longest commute
distance and travel time.

 # Replace 'Commute_Distance' and 'Travel_Time' with the actual column names in your data frame
# Calculate the longest commute distance, na.rm can get a answer even you have na in your data
longest_commute_distance <- max(my_data$distance.mi, na.rm = TRUE)
# Calculate the longest travel time
longest_travel_time <- max(my_data$time.min, na.rm = TRUE)
 # Print the results
cat("Longest Commute Distance:", longest_commute_distance, "\n")
cat("Longest Travel Time:", longest_travel_time, "\n")


# 5. Calculate travel speed across subjects as miles per minute. Assign this to a new
vector `mi.per.min` and add it to the data frame.
# Calculate travel speed (miles per minute)
> mi.per.min <- our_data$distance.mi / our_data$time.min
> 
  > # Add the new vector to the data frame
  > our_data$mi.per.min <- mi.per.min


# 6. Use a function to return the total number of elements in mi.per.min.

# Get the total number of elements in 'mi.per.min'
total_elements <- length(our_data$mi.per.min)

# Print the result
print(total_elements)

# 7. Index/subset the vector `major` to get a new vector that contains the 3rd, 1st, and
9th elements (in that order).

# Subset the vector to get the 3rd, 1st, and 9th elements
subset_major <- our_data$major[c(3, 1, 9)]

# Print the result
print(subset_major)

# 8. R’s `[` indexing operator accepts several different types of indexes, not only positive
whole numbers. For example, the operator accepts negative numbers as indexes. Using
the vector `places`, try out three to five different negative indexes. Based on the results,
what do you think the [ operator does with negative indexes?
                          places <- c("Paris", "London", "New York", "Tokyo", "Berlin")                      
                        # Using negative indices to exclude elements
                        subset_places_1 <- places[-1]  # Exclude the first element
                        subset_places_2 <- places[-c(2, 4)]  # Exclude the second and fourth elements
                        subset_places_3 <- places[-5]  # Exclude the fifth element
                        subset_places_4 <- places[-c(1, 3, 5)]  # Exclude the first, third, and fifth elements
                        
                        # Print the results
                        print(subset_places_1)
                        print(subset_places_2)
                        print(subset_places_3)
                        print(subset_places_4)
                          #Negative indices remove the elements at those positions, so using negative indices gives you a new vector that contains all elements except those at the specified positions.
                          
                          # 9. Consider the R code `c(3, 3.1, “4”, -1, TRUE)`.
                          # a. WITHOUT running the code, what data type you think the result will have and
                          why?
                          #	3,3.1,-1 is a numeric value,“4”: This is a character string (quotes indicate it’s a string)
                            #TRUE is a logical value.In R, when you combine different data types in a vector using c(), R will automatically coerce the elements to the same type. The rule is that R will coerce to the most flexible type that can hold all the values. The hierarchy of types in R for coercion is typically:
                          #	Logical → Integer → Numeric → Character
                          
                          # The result will be a character vector.
                            
                          # b. Now run the code to check whether your guess was correct. If it was not
                          correct, explain what the actual data type is and why. If your guess was correct, write a
                        new, different line of code that yields the same resulting data type.
                        
                        result <- c(3, 3.1, "4", -1, TRUE)
                      # Check the class of the result
                        class(result)
                        new_vector <- c("apple", "banana", 1, 2.5, FALSE)
                        
                        10. Run the code `“four” < “five”`. Paste the output from R into a comment and explain
                        why you think it provided that result.
                        [1] FALSE#In R, when comparing strings (character vectors) using the < operator, the comparison is based on lexicographical (alphabetical) order, similar to how words are sorted in a dictionary.	“four” is compared to “five”.
                        #	Comparing character by character:
                         # 	"f" vs. "f" → same
                        #"o" vs. "i" → "o" is alphabetically greater than "i", so "four" is considered greater than "five".
                        
                        # 11. There are several major mistakes in the data entered in class.
                        # a. Describe in complete sentences what at least 2 of the errors are. Make some
                        guesses as to how those errors may have happened, and how they might affect
                        analyses and/or re-use of these data.
                        # Potential Non-Standardized Responses:
                        #The pet column has inconsistent values (e.g., "Woof" vs. "Cats rule, dogs drool").
                        #Cause: Lack of predefined response categories or free-text input.
                        #Impact: Analysis requiring categorical data (e.g., counting preferences) will be unreliable.
                        #Inconsistent Case in Categorical Data:
                         # Column major has mixed case (e.g., "ECS" vs. "Ecs" or "sts").
                        #Cause: Manual data entry without enforcing consistent case formatting.
                        #Impact: Grouping or comparison by major may yield incorrect results.
                        
                        # b. Pretend the data frame was too big for you to view it manually. List specific
                        function calls you could use in R to help you find these mistakes programmatically.
                        #Check for Missing Values:
                        colSums(is.na(data))
                        #Detect Whitespace Issues:
                        which(grepl("^\\s|\\s$", data$location))
                        #Find Inconsistent Categorical Values:
                        table(data$pet)
                        table(data$major)
                        #Check for Case Inconsistencies:
                        unique(tolower(data$major))
                        #summarize Numeric Data for Outliers:
                        summary(data$distance.mi)
                        summary(data$time.min)
                        
                        