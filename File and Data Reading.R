# This document is used to record the notes on reading and downloading files and
# data sets from different sources and platform. 

#  -- Downloading files from a website
# Typically you need to instruct R to download files from the Internet by using 
# an object.
# For example: downloading a csv file from this website 
# "https://www.ons.gov.uk/generator?format=csv&uri=/economy/grossdomesticproductgdp/timeseries/ihyq/pn2"

fileurl <- "https://www.ons.gov.uk/generator?format=csv&uri=/economy/grossdomesticproductgdp/timeseries/ihyq/pn2"
download.file(fileurl, destfile = "./data_cleaning/grossdomesticproduct.csv")
# Notice that now the file is in our data_cleaning folder.

# -- Reading Files of different format

# 1. Comma Separted Value Files
#   Generally speaking, we can use the command read.csv("relative path of file")
#   to load the file onto R as a data frame
gdpdata <- read.csv("data_cleaning/grossdomesticproduct.csv")
gdpdata <- read.csv("data_cleaning/grossdomesticproduct.csv", skip = 7) 
# the skip variable in here, is telling R to skip the first 7 entries of the 
# data set. If you want to load more specific rows and coloumn, as we will show
# you will need to utilise subsetting rules (bare in mind the T/F nature of this)

# 2.Excel files (xls, xlsx formats)
library(readxl)
xlurl <- "https://www.ons.gov.uk/generator?format=xls&uri=/economy/grossdomesticproductgdp/timeseries/ihyq/pn2"
download.file(url = xlurl, destfile = "./data_cleaning/gdpdata.xls")
gdpdata <- read_excel("data_cleaning/gdpdata.xls")

#Notes on importing specific rows and coloumns 
# 1. Using the package data.tables
library(data.table)
# - Loading pre-seleced coloums, use "select = "column names/colindex"
gdpdata <- fread("data_cleaning/grossdomesticproduct.csv", sep = ",", header = T,select = "Title")
# 2. Using the package sqldf
library(sqldf)
gdpdata <- read.csv.sql("data_cleaning/grossdomesticproduct.csv", sql = "select Title from file", sep = ",")
sqlnotes <- read.csv.sql("data_cleaning/grossdomesticproduct.csv", sql = "select * from file LIMIT 7", sep = ",")
# The bebefits of using sqldf, is the avaliablity of using sql commands to make 
# data managements more efficient. 

# 3. Reading XML files
library(XML)
library(RCurl)
xmlfile <- "https://www.w3schools.com/xml/simple.xml"
download.file(xmlfile, "data_cleaning/xmltest.xml")
xmldata <- getURL(xmlfile)
xmldoc <- xmlTreeParse(xmldata, useInternalNodes = T) #-- Now we have a structured file object, xml class
rootNode <- xmlRoot(xmldoc)
# Setting the root node to the top level node of the XML doc 
# ie, setting rootNoode to the document name
xmlName(rootNode)
# xmlName extracts the tage name of the object, in this case, the document name 
# would be printed
names(rootNode)
# XML objects are essnetially a listed objects with different tages and structures
# thus, accessing indicidual items in the XML doc, we can apply the same subsetting rules
rootNode[[1]]
rootNode[[1]][[2]]
# Loop Function also apply to these subsetting, for example
# xmlSapply(rootnode, function())
xmlSApply(rootNode,xmlValue)
# If yu want to extract a specic sestion of an element of the top level node, you will have to
# use the XPath language
fooditems <- xpathSApply(rootNode,"//name", xmlValue)
foodprices <- xpathSApply(rootNode, "//price", xmlValue)

# 4. Reading JSON Files
library(rjson)
library(jsonlite)
jasurl <- "https://api.github.com/users/jtleek/repos"
jasonsata <-fromJSON(jasurl)
# R will read Jason Data as a structured data frame, not lists 
names(jasonsata$owner)
names(jasonsata$owner$id)
# -Notes on writing to a JSON file for API interactions
myjson <- toJSON(iris, pretty = T)
cat(myjson)
mydata <- fromJSON(myjson)

# 5. Loading Data from SQL data sets
library(RMySQL)
# - S1 : Connect to SQL server
ucscDb <- dbConnect(MySQL(), user = "genome", host = "genome-mysql.cse.ucsc.edu")
results <- dbGetQuery(ucscDb, "show databases;") # Asing SQL to list all datasets on the SQL server
# - S2 : Extract the SQL relational data base we are intesretd in
hg19 <- dbConnect(MySQL(), user = "genome", db = "hg19", host = "genome-mysql.cse.ucsc.edu")
hg19AllTable <- dbListTables(hg19)
# - S3 : Extract the Table within the data set we want to analyse
affyData <- dbReadTable(hg19, "affyU133Plus2")
# -- Suppose we want a subset of this table, we can use the sendquery and fetch commands
names(affyData)
dbListFields(hg19,"affyU133Plus2") # Listing the column names, equiv to names()

query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis <- fetch(query)
# - S5: After all data sets have been extracted, must disconnect to SQL server
dbDisconnect(hg19)

# 6. Loading Data from HDF5 serves 
library(rhdf5)
# see HDF5 and R notes

#7. HTML amd Webscraping data 
# - M1 : sourcing data from a webpage using url()
connection <- url("https://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
htmlCode <- readLines(connection)
close(connection)
htmlCode
# - M2 : Using XML package
library(XML)
url <- "https://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
htmlurl <- getURL(url)
htmlcode <- htmlTreeParse(htmlurl, useInternalNodes = T)
# Now the htmlcode is stored in a list object, and we can subset to get information
# just like xml files
xpathSApply(htmlcode,"//title",xmlValue)
cite <- xpathSApply(htmlcode, "//td[@id='col-citedby']", xmlValue)

# M3 : Using httr package
library(httr)
html2 <-GET(url)
htmlcont <- content(html2, as = "text")
parsedcont <- htmlParse(htmlcont, asText = T)# This is part of XML to make it a structured list object
xpathSApply(parsedcont, "//title", xmlValue)


# 8. API interaction and data collection

