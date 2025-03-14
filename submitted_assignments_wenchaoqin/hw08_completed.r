# Directions:

# This file contains homework questions for the lecture on data visualization.
# Questions appear as comments in the file. 

# Please see the Grading Criteria Canvas Page for specific guidance on what
# we expect from you regarding assignment responses.

# Once you have completed the assignment, follow the Submission Instructions 
# on Canvas Pages section to add, commit, and push this to your GitHub repository. 

# Some questions have multiple parts - make sure to read carefully and
# answer all of them. The majority of points lost in homework come from
# careless skipping over question parts.  

###############################################################################


# Write a R code snippet that uses regular expressions to find all occurrences of 
# dates in the string variable text that are in the format "dd/mm/yyyy" and replace 
# them with the format "yyyy-mm-dd". The text variable contains multiple dates in 
# the "dd/mm/yyyy" format interspersed with other text. For example, if text is 
# "The event was held on 23/04/2021 and the next event will be on 05/10/2022.", 
# the output should be "The event was held on 2021-04-23 and the next 
# event will be on 2022-10-05.".
#
# Ensure your code dynamically handles the text variable, meaning it should work 
# for any string input following the mentioned pattern. Use relevant functions from 
# the stringr package, any other package, or base R for your solution. 
# [Code completion + comprehension]

To solve the question of dynamically replacing dates in the format “dd/mm/yyyy” with “yyyy-mm-dd”, I utilized the stringr package in R, which is excellent for string manipulation, particularly when working with regular expressions.
First, I recognized that we need to match dates in the format “dd/mm/yyyy”. To do this, I used the regular expression (\\d{2})/(\\d{2})/(\\d{4}).
	 \\d{2} matches two digits (for day and month).
  	/ is used to match the literal slash separating day, month, and year.
   \\d{4} matches four digits for the year.
	The parentheses () around \\d{2} and \\d{4} create capture groups that allow us to access the individual components of the date (day, month, year) later.
Before making replacements, I used str_view() to visualize the parts of the string that match the regex pattern. 
This helps ensure that the regex is correctly identifying dates in the input text. It’s important to verify the pattern before running replacements on the entire text, especially if the input contains variations.
Once I was confident that the pattern matched the dates correctly, I used str_replace_all() to replace the matched dates with the new format “yyyy-mm-dd”.
The replacement string \\3-\\2-\\1 refers to the capture groups:
  	\\3 refers to the year (captured in the third group).
    \\2 refers to the month (captured in the second group).
    \\1 refers to the day (captured in the first group).
By rearranging the groups, the date format is transformed from “dd/mm/yyyy” to “yyyy-mm-dd”.
The function convert_dates() is applied to a sample text, which contains two dates (“23/04/2021” and “05/10/2022”). The function returns the modified text with both dates converted to the new format.
This approach works because it leverages the power of regular expressions to match specific patterns in the text (in this case, dates). By capturing parts of the date using parentheses, I can easily rearrange and transform the captured groups into a new format. The function is dynamic because it works for any text containing dates in the “dd/mm/yyyy” format, and str_replace_all() ensures that all instances are replaced.
The use of str_view() also ensures that the regex is correctly capturing the intended dates before performing any replacements. This provides an added layer of verification, making the code more robust and less prone to errors.
# Load necessary package
library(stringr)

# Define a function to dynamically replace dates in the format "dd/mm/yyyy" with "yyyy-mm-dd"
convert_dates <- function(text) {
  # Visualize the regex matching dates using str_view
  str_view(text, "(\\d{2})/(\\d{2})/(\\d{4})")
  
  # Replace dates in "dd/mm/yyyy" format with "yyyy-mm-dd"
  text_modified <- str_replace_all(text, 
                                   "(\\d{2})/(\\d{2})/(\\d{4})", 
                                   "\\3-\\2-\\1")
  
  return(text_modified)
}

# Example usage with a sample text
text <- "The event was held on 23/04/2021 and the next event will be on 05/10/2022."
modified_text <- convert_dates(text)

# Print the modified text
cat(modified_text)














# Write an R code snippet that assigns the string "I am here.  Am I alive" to
# a variable "x" and uses an Escape Sequence to put a newline between the two
# sentences. [Code completion + comprehension]

In R, escape sequences are special characters that represent actions or formatting within a string. One commonly used escape sequence is \n, which represents a newline. This means that any text after \n will appear on the next line when printed.
The original string was given as two sentences: “I am here.” and “Am I alive”. To satisfy the requirement, I needed to insert a newline between these two sentences.
Therefore, I thought of placing \n between the two parts of the string: "I am here.\nAm I alive".
In R, the cat() function is used to print strings, and it evaluates escape sequences (like \n) as expected, unlike the print() function which would display the escape sequence as a raw string.
I used cat(x) to print the modified string where the newline is properly interpreted.

# Assign the string with a newline escape sequence
x <- "I am here.\nAm I alive"

# Print the result
cat(x)













# Write an R code snippet that assigns the following string to the variable "y:"
#
# She said, "Hi!"
# [Code completion + comprehension]

The string provided has double quotes around the word "Hi!", but we can’t simply include double quotes inside a string without causing an issue since R would interpret those internal quotes as the end of the string.
In R, if you want to include special characters like double quotes (") inside a string that is already enclosed by double quotes, you need to escape the double quotes using the backslash (\).
Specifically, \" is the escape sequence for a double quote inside a string.
To build the string She said, "Hi!", I need to ensure that:
	The text “She said, “ is followed by an escaped quote \", then "Hi!" is included with the internal quotes around Hi! properly escaped.
	The closing double quote of the string comes after the escaped quote .	
I assigned the correctly formatted string to the variable y, ensuring that R would interpret the quotes inside the string correctly using the escape sequence.
To confirm that the string was correctly formatted, I used cat(y). The cat() function displays the string and interprets escape sequences (like \" for quotes), so it will print the string as expected.

	
# Assign the string to the variable y
y <- "She said, \"Hi!\""

# Print the result
cat(y)













# [TEXT ANSWER] Explain what a Text Encoding is:
# [Comprehension]

Text encoding is a process that allows computers to represent and store text in a way that can be understood and processed across various systems. When I think about text encoding, I start by recognizing that computers don’t understand text in the way humans do. Instead, they work with binary data, which consists of zeros and ones. Characters, such as letters and punctuation marks, must therefore be mapped to specific binary sequences so that computers can store and manipulate them.

The first thing that comes to mind is ASCII , one of the earliest text encoding systems. It maps each character to a 7-bit binary value, and it was good enough for the English alphabet, digits, and some punctuation. However, it was very limited because it couldn’t support characters from other languages, such as accented letters in French or Chinese characters.

Then,  how Unicode came along to solve this limitation. Unicode includes a much larger set of characters from many languages around the world. One of its most popular formats is UTF-8, which is flexible and widely used. UTF-8 can encode characters in one to four bytes, which means that common characters (like those in English) take up less space, but more complex characters (like those in Mandarin or emoji) can still be represented.

In my mind, the importance of text encoding becomes clear when I think about the global nature of the internet and communication. For example, if I were to send an email with characters from a non-English language, I need to make sure that both the sender and the recipient’s systems understand the encoding used so that the characters display properly. Without the right encoding, we could end up with unreadable or corrupted text.

So, text encoding essentially ensures that data is transferred accurately, regardless of language, platform, or software. It defines how a computer translates characters into binary data and vice versa. It’s essential for the proper exchange and understanding of text data across diverse systems.






# Write an R code snippet that creates a vector of all containing the words in the string, 
# "He wanted to say hello but was afraid".  Then use the stringr library to locate any 
# occurrences of the string "hello" in your vector.
# [Code completion + interpretation]

The problem asks for a vector of words from the string "He wanted to say hello but was afraid". In R, the best way to split a string into words is by using the str_split function from the stringr package. 
This function splits the string into a list of words using spaces as the delimiter. Since str_split returns a list, I need to extract the first element (which contains the words) using [[1]].
Next, the task asks us to locate the word “hello” in the vector of words. To do this, I can use the str_detect function from the stringr package. 
str_detect checks whether a pattern (in this case, the word “hello”) is present in each element of the vector. It returns a logical vector (TRUE for a match and FALSE otherwise).
Once we know whether each word contains “hello” or not, I should combine this information with the original words. I chose to use a data.frame to organize the output because it allows me to display both the word and the result of the detection (whether it contains “hello”).

# Load the stringr package
library(stringr)

# Create a vector of words from the string
text <- "He wanted to say hello but was afraid"
words_vector <- str_split(text, " ")[[1]]

# Use stringr to locate the word "hello" in the vector
matches <- str_detect(words_vector, "hello")

# Print the words and whether "hello" is present in each
print(data.frame(word = words_vector, contains_hello = matches))


# Section "15.7 Corpus Analytics" of the reader contains a tutorial on performing
# corpus analytics on a Document Term Matrix of 19th Century novels.  A Document Term
# Matrix is a matrix that contains information about the number of times that a work 
# appears in each text in a corpus.  In class, we calculated the word frequencies for
# the novel _Wuthering Heights_.  There "data" folder in the Files area of Canvas for 
# this course contains a file names dtm.rds which holds this type of count information
# for every normalized text in the collection of novels we worked with in class. 
# 
#     First, download that file to your course working directory.   



#     Then, recreate a working version of the code in section 15.8 of the reader below.
#     Note that before you can use the code in that section you will need to read 
#     dtm.rds file into the dtm variable so that the data ih the DTM is available to
#     the rest of the code.
# [Code completion + interpretation]

In text preprocessing, some abbreviations, such as possessive forms (e.g., “John’s” or “Sarah’s”), might not be fully addressed by the initial cleaning steps. To handle this, we can apply additional transformations to the corpus. One such transformation is removing the possessive “‘s” from words, using the tm_map() function with a regular expression. This ensures that words like “John’s” are cleaned to just “John,” which helps in standardizing the corpus and improving analysis accuracy.

After performing this cleaning step, it’s important to update the Document-Term Matrix (DTM) to reflect the changes. The DTM is a matrix that shows the frequency of terms in the corpus, so any modification to the corpus, such as removing possessive forms, should prompt a rebuild of the DTM. By recreating the DTM after cleaning, we ensure that the term frequencies are accurate and account for the most recent changes.

This iterative approach to preprocessing is common in text mining workflows. We first apply cleaning steps, check the results, and then revisit the corpus as needed to address any overlooked issues. After each round of adjustments, the DTM is updated to reflect the cleaned data, which ensures the integrity of any further analysis, such as frequency counts or TF-IDF calculations. This process is essential for obtaining meaningful insights from the text.
# Load necessary libraries
library(tm)
library(ggplot2)
library(dplyr)
library(tidyverse)

# Load the data
manifest <- read.csv("C19_novels_manifest.csv", row.names = 1)  # Load the manifest of novels
dtm <- readRDS("dtm.rds")  # Load the Document-Term Matrix (DTM)
cleaned_corpus <- readRDS("C19_novels_cleaned.rds")  # Load the cleaned corpus

# Initialize DTM (before any cleaning)
dtm_initial <- DocumentTermMatrix(cleaned_corpus)

# Perform text cleaning: remove possessive 's
cleaned_corpus <- tm_map(cleaned_corpus, content_transformer(function(x) gsub("\\'s", " ", x)))
dtm_after_abbreviation_cleaning <- DocumentTermMatrix(cleaned_corpus)  # Update DTM after abbreviation cleaning

# Continue with other text cleaning steps
cleaned_corpus <- tm_map(cleaned_corpus, removeNumbers)  # Remove numbers
cleaned_corpus <- tm_map(cleaned_corpus, removeWords, stopwords("SMART"))  # Remove stopwords
cleaned_corpus <- tm_map(cleaned_corpus, removePunctuation)  # Remove punctuation
cleaned_corpus <- tm_map(cleaned_corpus, stripWhitespace)  # Remove extra whitespace

# After all cleaning steps, update DTM
dtm_final <- DocumentTermMatrix(cleaned_corpus)

# Inspect the updated DTM
inspect(dtm_final)  # View DTM content

# Assign document names to the DTM
dtm_final$dimnames$Docs <- manifest$title  # Assign titles to the documents
dtm_final$dimnames$Docs  # Display document names

# Create term count matrix
term_counts <- as.matrix(dtm_final)
term_counts <- data.frame(sort(colSums(term_counts), decreasing = TRUE))
term_counts <- cbind(term = rownames(term_counts), term_counts)
colnames(term_counts) <- c("term", "count")

# Visualize the top 50 terms by frequency
ggplot(term_counts[1:50, ]) +
  aes(x = fct_reorder(term, -count), y = count) +
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  labs(
    title = "Top 50 words in 18 Nineteenth-Century Novels",
    x = "Word",
    y = "Count"
  )

# Create a TF-IDF weighted Document-Term Matrix (DTM)
dtm_tfidf <- DocumentTermMatrix(
  cleaned_corpus,
  control = list(weighting = weightTfIdf)
)

# Assign document names
dtm_tfidf$dimnames$Docs <- manifest$title

# Convert to matrix
tfidf_counts <- as.matrix(dtm_tfidf)
tfidf_counts <- data.frame(sort(colSums(tfidf_counts), decreasing = TRUE))
tfidf_counts <- cbind(term = rownames(tfidf_counts), tfidf_counts)
colnames(tfidf_counts) <- c("term", "tfidf")

# Visualize the top 50 terms by TF-IDF score
ggplot(data = tfidf_counts[1:50, ]) +
  aes(x = fct_reorder(term, -tfidf), y = tfidf) +
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  labs(
    title = "Words with the 50-highest TF-IDF scores in 18 Nineteenth-Century Novels",
    x = "Word",
    y = "TF-IDF"
  )

# Convert to data frame (documents as columns)
tfidf_df <- as.matrix(dtm_tfidf)
tfidf_df <- as.data.frame(t(tfidf_df))

# Assign document names
colnames(tfidf_df) <- manifest$title

# Example: Get the top 50 terms for 'Dracula' sorted by TF-IDF
ordering <- order(tfidf_df$Dracula, decreasing = TRUE)

# Print the top 50 terms for 'Dracula'
top_50_terms <- rownames(tfidf_df[ordering[1:50], ])
top_50_terms

In my thinking, TF-IDF is incredibly valuable for researchers because it helps to isolate the most important terms within a large corpus of text. Instead of focusing on common words that don’t provide much insight, like “the” or “and,” TF-IDF highlights terms that appear frequently within a specific document but are less common across other documents. 
This allows researchers to identify key concepts or topics in a body of work. For example, if a researcher is studying a set of news articles, TF-IDF would help them focus on the terms that are specific to each article, enabling them to capture the article’s core message. 
By doing so, researchers can extract meaning from large volumes of text data without being overwhelmed by too many irrelevant terms.
When I consider the patterns that TF-IDF might uncover, I think of several possibilities. First, it can help identify trends over time, especially in large datasets like research papers. For instance, terms with high TF-IDF values could represent the key issues being discussed in a specific period, such as a growing focus on climate change or artificial intelligence. 
TF-IDF can also reveal uncommon but significant terms that might be central to understanding a specific document’s theme. If a term appears frequently in one document but not in others, it likely plays a crucial role in the document’s unique message. For example, in a historical novel, 
terms related to a specific event or location may stand out. Additionally, TF-IDF can be useful for discovering text similarities: If two texts share high TF-IDF terms, they might be discussing the same topic, even if they don’t explicitly reference each other.
Thinking about what types of texts I’d want to explore with TF-IDF, I would likely be most interested in applying it to historical literature, particularly novels from the 19th century. These texts have a lot of cultural and linguistic richness, and using TF-IDF would allow me to identify common themes, character names, and locations that are central to the novel’s narrative. 
For instance, in analyzing “Dracula” by Bram Stoker, TF-IDF could help pinpoint key terms like “vampire,” “Transylvania,” or “Dracula” himself, which would be important for understanding the central themes. In addition, I’m also interested in applying TF-IDF to academic research papers across various disciplines. By analyzing papers on similar topics, 
TF-IDF could reveal the most frequently discussed themes, such as emerging theories or key findings, as well as shifts in focus over time.