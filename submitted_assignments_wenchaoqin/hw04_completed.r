# Directions:

# This file contains homework questions for the lecture on working with files
# and data exploration. Questions appear as comments in the file. 

# Please see the Grading Criteria Canvas Page for specific guidance on what
# we expect from you regarding assignment responses.

# Once you have completed the assignment, follow the Submission Instructions 
# on Canvas Pages section to add, commit, and push this to your GitHub repository. 

# Some questions have multiple parts - make sure to read carefully and
# answer all of them. The majority of points lost in homework come from
# careless skipping over question parts.  

###############################################################################

# 1. Write out the file extension and explain what it means for the following
#    files: [comprehension]
#
#       a. `myscript.py`

File Extension: .py
The path myscript.py refers to a Python script located in the current working directory or the directory where the script is being run. Since no directory is specified before the file name, it’s assumed that myscript.py is in the present directory. You can verify the file path by checking your terminal or file explorer. This path can also be used in R to run Python scripts by calling it in system commands or other interfacing packages like reticulate for running Python code in R.


#
#       b. `/home/arthur/images/selfie.jpg`
File Extension: .jpg

  The path /home/arthur/images/selfie.jpg is an absolute path, meaning it starts from the root directory / and specifies the full location of the selfie.jpg file on a Unix-based system (like Linux or macOS).
/home/arthur/ refers to the user’s home directory arthur.
/images/ is a subdirectory within arthur’s home directory, where the image is stored.
selfie.jpg is the file name (with a .jpg extension), which is a JPEG image file.

This path ensures that the file can be accessed regardless of the current working directory, as the absolute path provides the complete route to the file.


#       c. `~/Documents/data.csv`

File Extension: .csv
The path ~/Documents/data.csv uses a tilde (~) to represent the home directory of the user. On a Unix-like system, the tilde (~) is shorthand for the current user’s home directory (e.g., /home/arthur/).
~/Documents/ is a subdirectory named Documents located within the home directory.
data.csv is a file within that directory with a .csv extension, indicating that it’s a Comma-Separated Values (CSV) file.
This path is a relative path because it starts with ~ (the home directory), making it dependent on the user’s environment. However, when used in a terminal or script, it will be resolved to the full absolute path to that file.



# 2. Which command line utility can be used to determine the type of a file? 
# [code completion]
# Get the file extension
file_ext("path/to/your/file.jpg")
In R, you can use the file.info() function to gather information about a file, but it does not specifically return the file type. To check the type of a file in R, a common approach is to use the tools::file_ext() function, which returns the file extension.
The file_ext() function in R is useful for basic file extension checks, but if you need more details (like determining if a file is truly an image or binary), you’d need to implement additional logic, as R does not provide a direct equivalent to the Unix file command out-of-the-box.

# 3. Why is it a bad idea to explicitly call the `setwd` function within an R
#    script? [comprehension]
If your script uses relative file paths and calls setwd(), those relative paths become relative to the set working directory, which can cause issues if the script is run from a different location. This can break the execution of the script if files are located relative to the original working directory.
If you call setwd with an absolute path, it also makes your code less portable to other computers. It’s fine to use setwd interactively (in the R console), but avoid making your saved code dependent on it.

# 4. List one advantage and one disadvantage for each of these formats:
# [comprehension]
#   
#     a. RDS files
Advantage:
	Preserves Data Structures: RDS files can store R objects in their native R format, meaning that they preserve the data structure (e.g., data frames, lists, matrices) and the data types exactly as they are in R. This ensures no data loss or transformation when reading back the file.
Disadvantage:
	Not Human-readable: RDS files are binary files, so they are not human-readable or easily editable without R. If you need to inspect the contents manually, you won’t be able to open them as a plain text file (unlike CSV files).
#     b. CSV files
Advantage:
  Human-readable and Universal: CSV files are plain text files, which makes them human-readable and easy to open with any text editor, spreadsheet software (like Excel), or other programs. They are also widely supported across different platforms and programming languages.	
Disadvantage:
  Loss of Data Types and Structure: When saving data as a CSV, you may lose certain data structures (e.g., factors or complex objects) and types (e.g., date formatting, numerical precision). For instance, a comma-separated values (CSV) file records a tabular data using one line per row, with commas separating columns.This may require extra handling when reading the data back into R to restore the original structure.	


# 5. Why doesn't R automatically load every installed package when it starts?
# [comprehension]
R doesn’t load packages automatically because each package you load uses memory and may conflict with other packages. Thus you should only load the packages you need for whatever it is that you want to do. 
Loading all installed packages at once would significantly increase R’s memory usage. Some packages can be quite large and load unnecessary functions or data into memory, which could slow down the system or consume excessive memory resources.
Automatically loading all packages would make R’s startup time much slower. Each time R starts, it would take time to load every installed package, even though only a few might actually be needed for the task at hand.
Many R packages contain functions that share the same name. If all packages were loaded at once, R would encounter conflicts about which function to use.

# 6. Load the dogs data from the `dogs.rds` file provided in lecture.
#
#     a. How many missing values are in the `height` column? 
#       [code completion + comprehension]

To determine the number of missing values in the height column of the dogs.rds dataset, I first need to load the dataset into R. For this, I use the readRDS() function, which is specifically designed to read .rds files. The .rds format is commonly used in R because it allows saving and loading R objects efficiently. I call the function as readRDS("/Users/wenchaoqin/Desktop/dogs.rds"), which reads the file and stores its contents in the variable dogs. This ensures that the data is properly loaded as a data frame, allowing me to perform further operations on it.

Once the data is loaded, my next step is to check for missing values in the height column. In R, missing values are represented as NA, and to identify them, I use the is.na() function. Specifically, I write is.na(dogs$height), which goes through each value in the height column and returns TRUE if the value is missing and FALSE if it is not. This step helps me identify where the missing values are located within the column.

Finally, to get the total number of missing values, I use the sum() function. Since is.na(dogs$height) produces a logical vector of TRUE and FALSE values, and in R, TRUE is treated as 1 and FALSE as 0, applying sum() to this vector effectively counts the number of TRUE values. Thus, sum(is.na(dogs$height)) gives me the total number of missing values in the height column.

To complete the process, I print the result to see the number of missing values in the dataset. 
#dogs = readRDS("/Users/wenchaoqin/Desktop/dogs.rds")Load the dogs data from the 'dogs.rds' file
# Count the number of missing values in the 'height' column
num_missing <- sum(is.na(dogs$height))
# Print the result
num_missing
13

#     b. Think of a strategy to check the number of missing values in every
#        column using no more than 3 lines of code. Hint: think about last
#        week's lecture. Explain your strategy in words. 
#       [code completion + comprehension]
#
To efficiently check the number of missing values in every column using no more than three lines of code, I would use the colSums() function along with is.na(). First, I apply the is.na() function to the dataset, which creates a logical matrix where each element is TRUE if it is a missing value (NA) and FALSE otherwise. This allows me to identify all missing values in the dataset at once. Next, I use the colSums() function to sum up the TRUE values for each column. Since TRUE is treated as 1 and FALSE as 0 in numerical operations, colSums() effectively counts the number of missing values in each column. Finally, I print or store the resulting named vector, where each column name is associated with its corresponding count of missing values. This method is both concise and efficient, leveraging R’s built-in vectorized operations to analyze missing data across all columns simultaneously.

missing_counts <- colSums(is.na(dogs))
print(missing_counts)




#     c. Which column has the most missing values? Try to solve this by
#        implementing your strategy from part b. If that doesn't work, you can
#        use the `summary` function to get the number of missing values in each
#        column as well as a lot of other information (we'll discuss this
#        function more next week).
#       [code completion + comprehension]

To find the column with the most missing values, I first use is.na(dogs), which creates a logical matrix where TRUE represents a missing value (NA). Then, colSums(is.na(dogs)) calculates the total number of missing values in each column by summing up the TRUE values.

Next, which.max(missing_counts) identifies the index of the column with the highest count of missing values, and names() retrieves the actual column name. Finally, I use cat() to print the column name and its missing value count in a readable format.



# Count missing values in each column
missing_counts <- colSums(is.na(dogs))

# Find the column with the most missing values
most_missing_column <- names(which.max(missing_counts))

# Print the result
cat("The column with the most missing values is:", most_missing_column, "with", max(missing_counts), "missing values.\n")



# 7. Use indexing to get the subset of the dogs data which only contains large
#    dogs that are good with kids (the category `high` in the `kids` column
#    means good with kids). [code completion + comprehension]

To filter the dataset and obtain only the large dogs that are good with kids, I use logical indexing in R. First, I identify the rows in the dataset where the size column has the value "large", indicating that the dog is classified as large. At the same time, I check the kids column to find rows where the value is "high", meaning the dog is considered good with kids. To ensure that only the dogs meeting both conditions are selected, I use the logical AND operator (&). This creates a subset of the data that contains only rows where both conditions are true. Finally, I store the filtered data in a new variable called large_kid_friendly_dogs, and I use the head() function to display the first few rows of the result, allowing me to verify that the filtering process worked correctly.

# Subset the data for large dogs that are good with kids
large_kid_friendly_dogs <- dogs[dogs$size == "large" & dogs$kids == "high", ]

# Print the first few rows of the filtered dataset
head(large_kid_friendly_dogs)


# 8. With the dogs data:
#
#     a. Write the condition to test which dogs need daily grooming (the result
#        should be a logical vector). Does it contain missing values? 
#       [code completion + comprehension]
#
To determine which dogs require daily grooming, I examine the grooming column in the dataset. I create a logical condition that checks whether the value in the grooming column is "daily", producing a logical vector where TRUE indicates a dog needs daily grooming and FALSE means it does not.

Additionally, I need to check whether this logical vector contains missing values (NA). If there are missing values in the grooming column, they will appear in the logical vector as NA, which I can verify using the any(is.na()) function.

# Logical vector indicating which dogs need daily grooming
daily_grooming_condition <- dogs$grooming == "daily"

# Check if there are any missing values
any(is.na(daily_grooming_condition))
[1] TRUE



#     b. Use the condition from part a to get the subset of all rows containing
#        dogs that need daily grooming. How many rows are there?
#       [code completion + comprehension]
#
In this step, i aim to use the logical vector created in part a to subset the dogs data frame, extracting only the rows corresponding to dogs that need daily grooming. The process of subsetting involves using the condition daily_grooming_condition to select the rows where the value is TRUE, effectively filtering out the dogs that do not require daily grooming.
The expression dogs[daily_grooming_condition, ] subsets the dogs data frame. The daily_grooming_condition logical vector serves as a filter, keeping only the rows where the condition is TRUE. The empty part after the comma indicates that we want to retain all columns for the selected rows. The result is stored in the daily_grooming_dogs variable, which will contain a subset of the original dogs data frame—only the dogs that need daily grooming.
To determine how many rows are in this subset, I use the nrow() function, which returns the number of rows in the data frame:
# Subset data for dogs that need daily grooming
daily_grooming_dogs <- dogs[daily_grooming_condition, ]

# Count the number of rows in the subset
nrow(daily_grooming_dogs)
[1] 83


#     c. Use the `table` function to compute the number of dogs in each
#        grooming category. You should see a different count than in part b for
#        daily grooming. What do you think is the reason for this difference?
#       [code completion + interpretation]
To get an overview of how many dogs are in each grooming category, I can use the table() function. This function creates a frequency table of the values in a given column, providing us with the count of occurrences of each unique value. 
The function table(dogs$grooming) counts how many dogs fall into each grooming category (e.g., "daily", "weekly", "monthly".). The result will show the frequency of each grooming type in the dataset.
table(dogs$grooming)
The reason why the count from table() may differ from the count in part b is likely due to the presence of missing values (NA) in the grooming column. The table() function not includes all rows, like those with missing values.  In part b, we  include dogs with missing grooming data . As a result, part b gives us the count of  those dogs that are explicitly marked for daily grooming and including any rows with missing grooming information.

table(dogs$grooming)
#
#     d. Enclose the condition from part a in a call to the `which` function,
#        and then use it to get the subset of all rows containing dogs that
#        need daily grooming. Now how many rows are there? Does the number of
#        rows agree with the count in part c?
#       [code completion + comprehension]

In this step, i use the which() function to extract the indices of the dogs that need daily grooming. The which() function returns the row numbers corresponding to the TRUE values in the logical vector. I can then use these indices to subset the dogs data frame and get the dogs that need daily grooming.
The function which(daily_grooming_condition) returns the indices of the rows where the condition is TRUE. I use these indices to subset the dogs data frame and obtain the corresponding rows that contain dogs needing daily grooming. The resulting subset is stored in the daily_grooming_dogs variable.
To check how many rows are in this subset, I again use nrow().The number agree with the daily count in part c .Beacuase which also not rrturn na.
daily_grooming_indices <- which(daily_grooming_condition)
daily_grooming_dogs <- dogs[daily_grooming_indices, ]
nrow(daily_grooming_dogs)
[1] 23
# 9. Compute a table that shows the number of dogs in each grooming category
#    versus size. Does it seem like size is related to how often dogs need to
#    be groomed? Explain your reasoning. [code completion + interpretation]
To analyze whether a dog’s size is related to how often it needs to be groomed, i create a contingency table using the table() function in R. This table will display the number of dogs in each grooming category (grooming) for each size category (size).
I use table(dogs$grooming, dogs$size), dogs$grooming represents the grooming frequency of each dog,dogs$size represents the size category of each dog (small, medium, large),the table() function counts the occurrences of each combination of grooming and size.

# Compute the table of grooming frequency versus dog size
grooming_size_table <- table(dogs$grooming, dogs$size)

# Print the table
print(grooming_size_table)
           large medium small
daily       6      8     9
weekly     30     29    29
monthly     0      1     0
From the data, we see that daily grooming is slightly more common among small and medium dogs, with 9 small dogs and 8 medium dogs requiring daily grooming, compared to only 6 large dogs. This suggests that smaller dogs may have a slightly higher tendency to need frequent grooming. However, the weekly grooming category has nearly equal numbers across all sizes, with 30 large dogs, 29 medium dogs, and 29 small dogs. This balance indicates that weekly grooming is a common requirement across all dog sizes, regardless of their physical stature. Lastly, the monthly grooming category contains only a single medium-sized dog, while no small or large dogs fall into this group. This suggests that monthly grooming is rare among the dogs in our dataset.
While these numbers show some variation, they do not provide strong evidence that a dog’s size directly determines how often it needs grooming. The fact that dogs of all sizes appear in the daily and weekly grooming categories suggests that other factors, such as breed, coat type, and owner preferences, may have a greater influence. For instance, certain small breeds like Poodles or Shih Tzus have long, curly fur that requires daily grooming to prevent matting, while some large breeds like Golden Retrievers also require frequent brushing due to their thick coats. Conversely, short-haired breeds of any size might only need occasional grooming, as their fur does not tangle as easily.

# 10. Compute the number of dogs in the `terrier` group in two different ways:
#
#     a. By making a table from the `group` column. 
#       [code completion + comprehension]
#By using the table() function to create a frequency count of all dog groups can allows us to see how many dogs belong to each group, including the number of terriers. This command scans through the group column of the dogs dataset and counts the occurrences of each unique category, displaying the total for each. This  provides a comprehensive summary of all dog groups, not just terriers, giving a broader view of the dataset.

table(dogs$group)
herding        hound non-sporting     sporting      terrier          toy      working 
25           26           19           28           28           19           27 


#     b. By getting a subset of only terriers and counting the rows.
#       [code completion + comprehension]
#By filtering the dataset , i keep only the rows where the group column is "terrier", then counting how many rows remain.dogs$group == "terrier" creates a logical vector that is TRUE for rows where the group is "terrier" and FALSE otherwise.dogs[dogs$group == "terrier", ] filters the dataset, keeping only the rows where the condition is TRUE.nrow(terrier_dogs) then counts the number of rows in this filtered dataset, which corresponds to the number of terriers.This approach is more direct when we are only interested in terriers, and it also allows for further manipulation of the filtered data. 
terrier_dogs <- dogs[dogs$group == "terrier", ]
nrow(terrier_dogs)
[1] 28
#     c. Computing the table is simpler (in terms of code) and provides more
#        information. In spite of that, when would indexing (approach b) be more
#        useful? [comprehension + interpretation]
While using table(dogs$group) is a quick and efficient way to get an overview of all dog groups, indexing (approach B) becomes more useful in scenarios where we need to extract, manipulate, or analyze specific subsets of data rather than just count occurrences.
Indexing allows us to work exclusively with the terrier group. For example, if we want to analyze the average height, weight, or lifespan of only terriers, we cannot do this directly from a table. 
Sometimes, we need to apply multiple conditions. For example, if we only want terriers that are good with kids and have a weekly grooming requirement, we can use:terrier_friendly <- dogs[dogs$group == "terrier" & dogs$kids == "high" & dogs$grooming == "weekly", ]A table cannot filter based on multiple conditions—it only shows counts.
If we want to update or modify information about terriers specifically—such as changing an incorrect grooming category or filling in missing values,we can do this easily with indexing.A table only displays data, while indexing allows us to modify it.
A table is great for quick insights and summarization, but indexing is essential when we need to work with the terrier group separately—whether for filtering, modification, analysis, or visualization.