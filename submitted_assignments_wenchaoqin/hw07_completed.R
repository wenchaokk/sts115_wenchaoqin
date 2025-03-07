part 1

# Loading libraries
library('httr') # Make http easy
library('jsonlite') # Parser/generator optimized for the web

# Store a web address in the 'url' variable
url = 'https://restcountries.com/v3.1/all?fields=name'


response = GET(url) # retrieve whatever info is at url
response # see the surface info of the response object
# Notice that the content-type is JSON
str(response) # see the structure of the response object

status_code(response) # return the status code of url e.g. 200 is successful

response$content # this raw compressed binary is unreadable to me
bdy = content(response, 'text') # decompress and convert to readable text
substr(bdy, 1, 201) # print out the first few characters of the url content

df = fromJSON(bdy)$name # use fromJSON because the content-type (L11)
# L20 also subsets the bdy content to only the name df
df

country_names = df[, c('common', 'official')] # index the two columns common and official

Sys.sleep(1/10)


1.Understanding the Libraries

The first step in the code is the inclusion of two essential libraries: httr and jsonlite. The httr package facilitates easy interaction with web APIs by simplifying HTTP requests such as GET, POST, and PUT. In this case, the GET function is used to send a request to a specified URL. The jsonlite package, on the other hand, is used to parse and generate JSON data, a lightweight data format commonly used in APIs. These libraries are necessary to handle web requests and process the response from the server in a way that makes it usable for analysis.

2.Sending the GET Request

The core function of the code is to send a GET request to the URL https://restcountries.com/v3.1/all?fields=name. This API endpoint returns information about countries, but the query parameter ?fields=name limits the response to include only the names of the countries. The GET function from httr retrieves the data from the URL and stores it in the response object. By sending this request, the program is asking the API server to return a structured set of country names.

3.Examining the Response

After sending the request, it is important to inspect the structure of the response to ensure that the data has been received correctly. The str(response) function reveals the internal structure of the response object, showing details such as the HTTP status code, headers, and body content. In particular, the status code is crucial because it indicates whether the request was successful. A status code of 200 signifies that the request has been processed successfully by the server.

Additionally, the raw content of the response is often in binary format, which is not directly readable. To make this content readable, the code uses the content() function with the 'text' argument, decompressing the binary data into a text format. The first few characters of this content are then printed using substr(bdy, 1, 201) to quickly inspect the structure of the data returned by the API.

4.Parsing JSON Data

Once the data is converted into a readable text format, the next step is parsing the JSON content. The fromJSON() function from the jsonlite library is used to convert the JSON text into a structured R object. In this case, the name field from the JSON response is extracted, which contains both the common and official names of the countries. This extraction ensures that only the relevant country names are retained, eliminating any unnecessary information.

5.Selecting the Relevant Information

After parsing the JSON data, the code isolates the “common” and “official” names of the countries. These two columns represent the commonly used name of a country and its official name, respectively. By subsetting the parsed data frame, the code effectively focuses on the most important attributes of the countries, which will be useful for further analysis or presentation.

6.Rate Limiting and Responsiveness

To prevent overwhelming the server with too many requests in a short time, the code introduces a small delay between requests using the Sys.sleep(1/10) function. This function pauses the execution of the script for 0.1 seconds, ensuring that no more than 30 requests are made per second. This is a responsible approach to web scraping and is often necessary when interacting with external APIs to avoid violating usage limits or overloading the server.

By utilizing the httr and jsonlite packages, the code retrieves country names from a REST API, processes the raw JSON data, and extracts relevant information. Each step is carefully designed to ensure the program handles data efficiently, respects server limitations, and produces clean and usable data.







# Web Scraping ------------------------------------------------------------

#An html example to play with...

html = r"(
<html>
  <head>
    <title>This is the page title!</title>
  </head>
  <body>
    <h1>This is a header!</h1>
    <p>This is a paragraph.
      <a href="http://www.r-project.org/">Here's a website!</a>
    </p>
    <p id="hello">This is another paragraph.</p>
  </body>
</html> )"

#loading libraries
library("xml2") # to parse xml
library("rvest") # to parse css

doc = read_html(html) # read the practice html content into an object, doc
doc

# Experiment with the content and how to parse the information you need
paragraphs = xml_find_all(doc, '/html/body/p')
paragraphs

paragraphs = xml_find_all(doc, '//p')
paragraphs

links = xml_find_all(doc, '//p/a')
xml_find_all(doc, '//p|//h1')

hello = xml_find_all(doc, "//p[@id='hello']")

paragraph = xml_find_all(doc, '//*[contains(text(), "paragraph")]')
paragraph2 = xml_find_all(doc, '//p[2]')


This particular example demonstrates how to parse HTML content and extract specific elements using the xml2 and rvest packages in R.
1.Overview of the HTML Content

The code starts by defining a small HTML document as a character string. This HTML content includes a title, a couple of paragraphs, and links embedded within them. Specifically, the document includes:
(1)A title in the <head> section.
(2)Two paragraphs (<p>), one of which contains a hyperlink (<a>).
(3)	An additional paragraph with an id of “hello”.
(4)A simple header (<h1>).

By defining this HTML content, the goal is to simulate web scraping on a real web page.

2.Loading Libraries for Parsing HTML

The next step is to load two important libraries: xml2 and rvest.
	The xml2 library is used for parsing XML content, which is also applicable to parsing HTML because HTML is essentially a subset of XML. It provides functions to navigate the HTML structure, extract elements, and work with the content.
	The rvest library is built specifically for web scraping in R. It enhances the functionality of xml2 by providing a more user-friendly interface to interact with HTML, such as easily extracting elements by CSS selectors and XPath queries.

3.Reading HTML Content

The read_html() function is used to read the HTML content stored in the html variable. This function takes the HTML string and parses it into an R object that represents the structure of the web page. The doc object now contains the parsed HTML, which can be further manipulated using various functions from the xml2 and rvest libraries.

4.Extracting Paragraphs with XPath

One of the first tasks is to extract the <p> (paragraph) elements from the HTML document. The function xml_find_all(doc, '/html/body/p') is an example of using XPath, a language designed for navigating XML documents. The XPath query 'html/body/p' specifies that the function should look for <p> elements within the <body> section of the HTML document.

The next line, xml_find_all(doc, '//p'), demonstrates an alternative XPath query. By using '//p', the query searches for all <p> tags in the entire document, regardless of where they appear. This is a more general way of locating paragraphs without explicitly specifying their position in the HTML hierarchy.

5.Extracting Links within Paragraphs

The code also demonstrates how to extract hyperlinks from the paragraphs. The function xml_find_all(doc, '//p/a') finds all <a> elements (links) inside <p> elements. The a tag contains the hyperlinks, so this query extracts all the links embedded in paragraphs.

6.Extracting Multiple Elements Simultaneously

In the line xml_find_all(doc, '//p|//h1'), the query uses the pipe (|) operator to search for both <p> (paragraph) and <h1> (header) elements. This demonstrates how to extract multiple types of elements in a single query, which is helpful when you want to retrieve various kinds of information from a webpage at once.

7.Extracting Elements by Specific Attributes

The code then shows how to extract a specific paragraph with the id attribute set to “hello”. This is done using the XPath query "//p[@id='hello']". The @id syntax is used to select an element based on its attribute value. In this case, the query retrieves the paragraph with the exact id of “hello”. This type of selection is useful when you want to target elements with specific identifiers, such as when extracting unique sections of a web page.

8.Extracting Elements Based on Text Content

Another useful feature of XPath is the ability to find elements based on their text content. The code uses xml_find_all(doc, '//*[contains(text(), "paragraph")]') to search for all elements that contain the word “paragraph” in their text. The contains() function in XPath allows for flexible text-based searches, making it easy to locate elements containing specific keywords or phrases.

9.Selecting Specific Paragraphs by Position

Finally, the code demonstrates how to select a specific paragraph based on its position in the document. The XPath query '//p[2]' selects the second <p> element in the document. This is useful when you want to extract elements based on their order or position within a larger structure, such as tables or lists.

This code showcases the fundamental aspects of web scraping using R. By leveraging the xml2 and rvest libraries, it provides a simple and effective way to parse and extract specific elements from HTML content. Whether we’re extracting paragraphs, links, or other HTML elements, XPath and CSS selectors offer powerful tools to navigate and manipulate web pages. In this example, we explored a variety of XPath techniques, including extracting elements based on tags, attributes, and text content, as well as selecting specific elements by their position in the document. 









# California Cities -------------------------------------------------------

cities_url = 'https://en.wikipedia.org/wiki/List_of_municipalities_in_California'

doc = read_html(cities_url)

cities_table = xml_find_all(doc, '//table[contains(@class, "plainrowheaders")]')

cities_df = html_table(cities_table)[[1]]

cities = cities_df[-1, ]

names(cities) = c('name', 'type', 'county', 'pop2020', 'pop2010', 'pop_change',
                  'mi2', 'km2', 'density', 'date')

dates = as.Date(cities$date, format="%B %d, %Y")
cities$date = dates

#install.packages('stringr')
library('stringr') # parsing library for character strings

pop20_str = str_replace_all(cities$pop2020, ',', '')
pop20 = as.numeric(pop20_str)
cities$pop2020 = pop20

write.csv(cities, 'data/california_cities.csv')





1.Retrieving the Web Page Content

The first step in the script involves defining the URL of the Wikipedia page that contains the list of California municipalities:
  
  cities_url = 'https://en.wikipedia.org/wiki/List_of_municipalities_in_California'

This URL serves as the source from which we will extract tabular data related to cities in California.

Next, the script reads the HTML content of the webpage using the read_html() function from the xml2 package:
  
  doc = read_html(cities_url)

This function retrieves the raw HTML content of the page and stores it in the doc object. This object now holds the entire structure of the webpage, allowing us to extract specific elements from it.

2.Extracting the Relevant Table

Wikipedia pages often contain multiple tables, so we need to identify the one that holds the information we need. The function xml_find_all() is used with an XPath expression to locate the table that has the class "plainrowheaders":
  
  cities_table = xml_find_all(doc, '//table[contains(@class, "plainrowheaders")]')

This XPath query searches for all <table> elements that contain "plainrowheaders" in their class attribute. This ensures that we select the correct table that lists the municipalities.

Once the relevant table is found, we extract its content using the html_table() function from the rvest package:
  
  cities_df = html_table(cities_table)[[1]]

This function converts the HTML table into a data frame format, making it easier to work with in R. Since the html_table() function returns a list of tables (in case there are multiple matches), we select the first one ([[1]]).

3.Cleaning the Data

Raw web data often contains unnecessary rows or columns. The first row of the table is typically a header row or an unwanted artifact, so we remove it:
  
  cities = cities_df[-1, ]

This line removes the first row of the data frame, ensuring that only the relevant city data remains.

To improve clarity and usability, the column names are renamed:
  
  names(cities) = c('name', 'type', 'county', 'pop2020', 'pop2010', 'pop_change',
                    'mi2', 'km2', 'density', 'date')

The new column names provide more readable and standardized labels for the dataset. For example, "pop2020" and "pop2010" refer to population counts from the respective years, while "mi2" and "km2" represent the city’s area in square miles and square kilometers, respectively.

4.Converting Dates to a Standard Format

Dates on Wikipedia pages are often stored as text in a format like "January 1, 2020". Before performing any time-based analysis, we need to convert these textual dates into a standard date format:
  
  dates = as.Date(cities$date, format="%B %d, %Y")
cities$date = dates

The as.Date() function takes the text representation of the date and converts it into an actual date object. The format "%B %d, %Y" specifies that the date is written as a full month name (%B), followed by a numerical day (%d), and a four-digit year (%Y).

5.Cleaning Population Data

Population figures in Wikipedia tables often contain commas for readability, such as "1,000,000". However, these commas prevent R from interpreting the values as numeric data. To clean and convert them into numerical format, the script uses the stringr package.
  
  library('stringr') # parsing library for character strings

	str_replace_all(cities$pop2020, ',', ''): This function replaces all commas in the pop2020 column with an empty string (''), effectively removing them.
	as.numeric(pop20_str): The cleaned string is then converted into numeric format so that we can perform calculations and analyses on it.
	The cleaned and converted values are assigned back to the cities$pop2020 column.

This process ensures that population data is stored as numbers rather than text, enabling statistical computations and visualizations.

6.Saving the Cleaned Data

Finally, the script saves the cleaned data as a CSV file so that it can be used later without requiring repeated web scraping:
  
  write.csv(cities, 'data/california_cities.csv')

This command writes the data frame cities to a CSV file named "california_cities.csv" in the "data" directory. CSV files are widely used for storing structured data and can be easily loaded into various data analysis tools, including R, Python, and Excel.

By following this structured approach, we can automate data collection from web sources and ensure that the data is in a clean, usable format .





# Cal Aggie ---------------------------------------------------------------

aggie_url = 'https://theaggie.org/category/features/'

aggie1 = read_html(aggie_url) 

feature_blocks = xml_find_all(aggie1, '//div[@class="tdb_module_loop td_module_wrap td-animation-stack td-cpt-post"]')
feature_block_headers = xml_find_all(feature_blocks, './/h3[@class="entry-title td-module-title"]')
feature_block_links = xml_find_all(feature_block_headers, './/a')
feature_urls = xml_attr(feature_block_links, 'href')

scrape_urls = function(page) {
  blocks = xml_find_all(page, '//div[@class="tdb_module_loop td_module_wrap td-animation-stack td-cpt-post"]')
  block_headers = xml_find_all(blocks, './/h3[@class="entry-title td-module-title"]')
  block_links = xml_find_all(block_headers, './/a')
  urls = xml_attr(block_links, 'href')
  
  return(urls)
}

prep <- read_html(aggie_url)

ulrs <- scrape_urls(prep)
ulrs







1.Retrieving the Web Page

The first step in the script is defining the target URL from which data will be scraped:
  
  aggie_url = 'https://theaggie.org/category/features/'

This URL directs us to the California Aggie’s “Features” section, where we aim to extract article links. To access the webpage content, we use the read_html() function from the xml2 package:
  
  aggie1 = read_html(aggie_url) 

This function downloads the HTML structure of the page and stores it in the aggie1 object. By doing so, we now have a local copy of the page’s structure, allowing us to extract specific elements without repeatedly sending requests to the website.

2.Identifying and Extracting Article Blocks

On the California Aggie website, each article in the “Features” section is contained within a <div> element with the class "tdb_module_loop td_module_wrap td-animation-stack td-cpt-post". We use the xml_find_all() function to locate these article blocks:
  
  feature_blocks = xml_find_all(aggie1, '//div[@class="tdb_module_loop td_module_wrap td-animation-stack td-cpt-post"]')

This function searches the aggie1 HTML document using an XPath query to find all <div> elements that match the specified class. These elements serve as containers for article details, such as titles and links.

To extract article titles, we identify <h3> elements with the class "entry-title td-module-title" inside the article blocks:
  
  feature_block_headers = xml_find_all(feature_blocks, './/h3[@class="entry-title td-module-title"]')

This query selects all <h3> tags within the previously identified article blocks, which contain the article titles.

Each title contains a hyperlink (<a> tag) pointing to the full article. We extract these links using another xml_find_all() function:
  
  feature_block_links = xml_find_all(feature_block_headers, './/a')

Finally, we extract the actual URLs from these hyperlinks using the xml_attr() function:
  
  feature_urls = xml_attr(feature_block_links, 'href')

This step retrieves the href attribute, which contains the article’s URL. The result is a list of links leading to individual articles in the “Features” section.

3.Defining a Function for URL Extraction

To streamline the process and make it reusable, the script defines a function called scrape_urls(), which extracts article URLs from a given page.
  
This function performs the following tasks:
  (1).	Finds article blocks using xml_find_all(page, '//div[...]'), ensuring that all relevant article containers are identified.
(2).	Extracts article titles using xml_find_all(blocks, './/h3[...]'), locating the headers within these containers.
(3).	Finds hyperlinks by selecting <a> tags within the extracted headers.
(4).	Retrieves URLs using xml_attr(block_links, 'href'), storing the list of article links in the urls variable.
(5).	Returns the list of URLs, making it easy to reuse the function for multiple pages.

4.Executing the Function

To test the function, the script reads the HTML content of the California Aggie “Features” page again:
  
  prep <- read_html(aggie_url)

This step ensures that we have an up-to-date version of the webpage stored in the prep variable. Then, the function scrape_urls() is applied to extract the article links:
  
  ulrs <- scrape_urls(prep)
ulrs

This call returns a list of article URLs, which can be used for further analysis, such as text mining, sentiment analysis, or trend identification in journalism.

This R script demonstrates how to extract structured data from a news website using web scraping techniques. The script systematically:
	Identifies article blocks using XPath queries.
	Extracts article titles and links from relevant HTML elements.
	Uses a function (scrape_urls()) to automate and generalize the process.




 #the code from course reader

	
	
	
	parse_article_links = function(page) {
	  # Get article URLs
	  div = xml_find_all(page, "//div[@id = 'tdi_113']")
	  links = xml_find_all(div, ".//h3/a")
	  urls = xml_attr(links, "href")
	  
	  # Get next page URL
	  nav = xml_find_all(page, "//div[contains(@class, 'page-nav')]")
	  next_page = xml_find_all(nav, ".//a[contains(@aria-label, 'next-page')]")
	  if (length(next_page) == 0) {
	    next_url = NA
	  } else {
	    next_url = xml_attr(next_page, "href")
	  }
	  
	  # Using a list allows us to return two objects
	  list(urls = urls, next_url = next_url)
	}
	url = "https://theaggie.org/category/features/"
	article_urls = list()
	i = 1
	
	# On the last page, the next URL will be `NA`.
	while (!is.na(url)) {
	  # Download and parse the page.
	  page = read_html(url)
	  result = parse_article_links(page)
	  
	  # Save the article URLs in the `article_urls` list. The variable `i` is the
	  # page number.
	  article_urls[[i]] = result$url
	  i = i + 1
	  
	  # Set the URL to the next URL.
	  url = result$next_url
	  
	  # Sleep for 1/30th of a second so that we never make more than 30 requests
	  # per second.
	  Sys.sleep(1/30)
	}

	
1.Defining the Web Scraping Function
	
	At the heart of this script is the parse_article_links() function, which is responsible for extracting article URLs and identifying the next page for continued scraping. The function takes a parsed HTML page as input and performs the following tasks:
	  
	  a.Extracting Article URLs
	
	The first step in retrieving articles is identifying the relevant section of the webpage where articles are listed. The script accomplishes this using an XPath query that locates a <div> element with the ID "tdi_113", which serves as the container for article entries:
	  
	  div = xml_find_all(page, "//div[@id = 'tdi_113']")
	
	Once the script has found this container, it extracts all <h3> elements that contain article titles and associated hyperlinks:
	  
	  links = xml_find_all(div, ".//h3/a")
	urls = xml_attr(links, "href")
	
	This sequence of operations ensures that only article links are captured, avoiding unrelated content. The xml_attr() function extracts the href attribute from the <a> tags, which holds the actual URLs of the articles.
	
	b.Identifying the Next Page
	
	Since the goal is to scrape multiple pages until the last available page, the script must detect the presence of a “Next Page” button. It does so by searching for a navigation <div> containing pagination elements:
	  
	  nav = xml_find_all(page, "//div[contains(@class, 'page-nav')]")
	
	Within this navigation section, the script looks for an <a> element that contains "next-page" in its aria-label attribute:
	  
	  next_page = xml_find_all(nav, ".//a[contains(@aria-label, 'next-page')]")
	
	If no such element exists, it means the last page has been reached. In that case, next_url is set to NA to signal the end of the process:
	  
	  if (length(next_page) == 0) {
	    next_url = NA
	  } else {
	    next_url = xml_attr(next_page, "href")
	  }
	
	By structuring the function in this way, it ensures that both article URLs and the next page URL are extracted. These results are returned in a list, allowing for flexible handling of multiple outputs:
	  
	  list(urls = urls, next_url = next_url)
	
	
2.Automating the Scraping Process
	
	To automate the extraction of articles from all available pages, the script initializes the starting URL and sets up a loop that continues until no more pages are left to scrape:
	  
	  url = "https://theaggie.org/category/features/"
	article_urls = list()
	i = 1
	
	The loop operates under the condition that url is not NA, ensuring it stops when there are no more pages to process:
	  
	  while (!is.na(url)) {
	    
	    Inside the loop, the script downloads and parses the current page:
	      
	      page = read_html(url)
	      result = parse_article_links(page)
	      
	      The extracted article URLs from this page are then stored in a list, indexed by the page number (i):
	        
	        article_urls[[i]] = result$url
	      i = i + 1
	      
	      Finally, the script updates url to point to the next page, ensuring continuity in the scraping process:
	        
	        url = result$next_url
	      
	      To prevent excessive requests that could burden the website’s server, the script includes a short delay:
	        
	        Sys.sleep(1/30)
	      
	      This ensures that no more than 30 requests are made per second, following ethical web scraping practices.
	      

This R script efficiently automates the extraction of article URLs from The California Aggie, leveraging structured web scraping techniques. By breaking the process into modular components, the script:
	Identifies article blocks and extracts relevant URLs.
  Detects pagination elements to determine if more pages exist.
	Uses a loop to scrape multiple pages until all articles have been retrieved.

	
		      
part 2	


The task of scraping article links from a website involves extracting specific data from web pages in an automated and structured way. In this case, the objective was to scrape the “Features” section from the Cal Aggie website. The process begins by using libraries such as rvest and xml2 to parse HTML content and navigate through the website. The initial step is to define the starting URL and initialize variables to store the scraped data, such as article links and page counters.

The core of the solution lies in creating a function that extracts article links from the current page. By identifying the relevant HTML elements, such as article blocks and titles, the function captures the URLs of the articles. Additionally, it identifies the link to the next page, allowing the scraper to move to subsequent pages. To avoid overloading the server, a sleep interval is added between requests, ensuring that no more than 30 requests are sent per second.

The loop continues until the scraper has processed the first five pages, collecting and storing the URLs in a list. The collected data is then flattened into a single vector, and the results are saved in a CSV file for future analysis. This approach is efficient, respectful to the server, and ensures accurate data extraction.

# Load necessary libraries
library("xml2")    # To parse HTML/XML content
library("rvest")   # For web scraping and parsing

# Define the starting URL for scraping the 'Features' section
url = "https://theaggie.org/category/features/"
article_urls = list()  # List to store the article URLs
i = 1  # Counter to keep track of list index
max_pages = 5  # Limit to scrape only the first 5 pages
page_count = 0  # Initialize page counter

# Function to parse article links and the next page URL from a single page
parse_article_links = function(page) {
  
  # Find all blocks containing article links on the page
  feature_blocks = xml_find_all(page, '//div[@class="tdb_module_loop td_module_wrap td-animation-stack td-cpt-post"]')
  
  # Find article title headers within those blocks
  feature_block_headers = xml_find_all(feature_blocks, './/h3[@class="entry-title td-module-title"]')
  
  # Find links associated with those headers (articles URLs)
  feature_block_links = xml_find_all(feature_block_headers, './/a')
  feature_urls = xml_attr(feature_block_links, 'href')  # Extract the URLs of the articles
  
  # Debugging: Print the extracted URLs to check if they are correct
  print("Extracted URLs:")
  print(feature_urls)
  
  # Find the next page URL
  nav = xml_find_all(page, "//div[contains(@class, 'page-nav')]")  # Locate the navigation section
  next_page = xml_find_all(nav, ".//a[contains(@aria-label, 'next-page')]")  # Find the 'next page' link
  
  # If there is no next page, return NA, otherwise return the next page URL
  next_url = if (length(next_page) == 0) NA else xml_attr(next_page, "href")
  
  # Debugging: Print the next page URL to check
  print("Next Page URL:")
  print(next_url)
  
  # Return a list containing the article URLs and the next page URL
  list(urls = feature_urls, next_url = next_url)
}

# Loop through pages and scrape article URLs, limit to max_pages
while (!is.na(url) && page_count < max_pages) {
  
  # Download and parse the page HTML
  page = read_html(url)
  
  # Call the function to extract article URLs and next page URL
  result = parse_article_links(page)
  
  # Store the extracted article URLs in the `article_urls` list
  article_urls[[i]] = result$urls
  i = i + 1  # Increment the index for the list
  
  # Update the URL to the next page's URL
  url = result$next_url
  
  # Increment the page counter
  page_count = page_count + 1
  
  # Sleep for 1/30th of a second to avoid sending too many requests in a short time (to be respectful to the server)
  Sys.sleep(1/30)
}

# Flatten the list of article URLs into a single vector
all_article_urls <- unlist(article_urls)

# Debugging: Print the first few URLs to verify they were captured correctly
print("Collected Article URLs:")
print(head(all_article_urls))

# Save the collected article URLs to a CSV file for further analysis or use
write.csv(all_article_urls, "cal_aggie_features_first_5_pages.csv", row.names = FALSE)

# Print the first few article URLs to the console for inspection
head(all_article_urls)

Upon reviewing the code from the study guide, I identified a key issue that prevented the scraper from functioning as intended. Specifically, the class used to find all blocks containing article links was outdated. After inspecting the website using the web development tools, I discovered that the class for the relevant HTML elements had been updated. As a result, the original code, which relied on the old class, failed to locate the article links correctly.

To resolve this, I simply updated the class selector in the original code to reflect the current class used on the website. This change allowed the scraper to function properly and extract the desired article links.
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	