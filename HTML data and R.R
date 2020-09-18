# Reading Data from Web base data base

# Websracping : a systematic web to extract data from the HTML code of websites
#      - It can be a great way to get data
#      - All websites typically has information you want to read
#      - But notice that there are some websites that you cannot read webistes 
#        based on their terms of services 


# - Getting data off from webpages using the url() function
con <- url("https://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
htmlCode <- readLines(con)
close(con)
htmlCode  

# - To make reading html code more efficident, we should use the XML package
# - Does not work for me
library(XML)
url <- "https://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
html <- htmlTreeParse(url, useInternalNodes = T)
xpathSApply(html, "//title", xmlValue)
xpathSApply(html,  "//td[@id='col-citedby']", xmlValue)

# Using httr package, does work for me
install.packages("httr")
library(httr)
html2 = GET(url)
content2 <- content(html2, as= "text")
parsedHTml <- htmlParse(content2, asText = T)
xpathSApply(parsedHTml, "//title", xmlValue)
