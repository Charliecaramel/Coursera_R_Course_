# MySQL's relational database managemnet with R programming 

# it is possible to conduct data analysis using SQL language on R, here we must
# use the RSQL package called "RMySQL" to conduct queries 

library(RMySQL)

# Step One :  Connect to MySQL server 
ucscDb <- dbConnect(MySQL(), user = "genome", host = "genome-mysql.cse.ucsc.edu")
results <- dbGetQuery(ucscDb, "show databases;");dbDisconnect(ucscDb)
results

# Step Two : Extract the relational database of interest, in this case hg19
hg19 <- dbConnect(MySQL(), user = "genome", db = "hg19", host = "genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)
allTables[1:5]

# Step Three : Extract the table within the database that we are trying to analyse
# A key feauture is that, SQL queries are passed as a string in ""
# -- Getting the Dimensions (list of cololum names for that table)
dbListFields(hg19,"affyU133Plus2")

# -- Findning the rows in a table
dbGetQuery(hg19,"select count(*) from affyU133Plus2")

# -- Extracting table to a data frame
# - a) Entire Table
affyData <- dbReadTable(hg19, "affyU133Plus2")
head(affyData)
# - b) Subset of a table, since relational data bases are generally big
query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis <- fetch(query)
quantile(affyMis$misMatches)
# OR
affyMisSmall <- fetch(query,n = 10);dbClearResult(query)
dim(affyMisSmall)


# Closing Connections
dbDisconnect(hg19)
