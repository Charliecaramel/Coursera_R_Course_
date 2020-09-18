# - Downloading a file from the website 
# - CSV files
fileUrl <- "https://data.baltimorecity.gov/api/views/grg2-t9ws/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./data_cleaning/arrest.csv", method = "curl")
list.files("./data_cleaning")
dateDownloaded <- date()
# -- Now the data file is in our workong directory 
# -- Loading Data 

dataset <- read.csv("data_cleaning/arrest.csv")
summary(dataset)
str(dataset)
# -- Suppose you only want the row = 1:4, and columns = 1:6 to be loaded
colindex <- 1:6
rowindex <- 1:4
read_csv("data_cleaning/arrest.csv", )

# XML Files
# XML, short for Extensively marked up Language, is a organised text file that 
# embeds cods such that the program is human readable as well as machine reable
library(XML)
xmlfile <- "https://www.w3schools.com/xml/simple.xml"
download.file(xmlfile, "data_cleaning/xmltest.xml")
doc <- xmlParse(xmlfile, useInternalNodes = T)
rootNode <- xmlRoot(doc)


# JSON files