# Editing Text Variables 
# Texts in data sets needs to follow the following data-cleaning principles
# 1. Names of Variables 
#    - All Lower case if possible
#    - Descprtive, avoid shorthand
#    - Not Duplicated 
#    - Not have ubdeescores, dots or white space
# 2. Variables with character values 
#    - Shoudl usualy be made intor factors, depedning on the situation
#    - should be descprtive (when coding the levels, the factor lables needs to
#      be english reaable) 

fileurl <- "https://data.baltimorecity.gov/api/views/aqgr-xx9h/rows.csv?accessType=DOWNLOAD"
download.file(fileurl,destfile = "./data_cleaning/cameras.csv", method = "curl")
data <- read.csv("./data_cleaning/cameras.csv")
names(data)

#Character Manipualtions

#1. Change all column names to lower case or all upper case
tolower(names(data))
toupper(names(data))

#2. Adjusting the coloumn names that are incorrectly improrted
splitName <- strsplit(names(data), "\\.")
splitName[[5]]
splitName[[6]]
# -- Suppose we want R to print out the frist element in a vector or a list 
splitName[[6]][1]
fristelement <- function(x){
  x[1]
}
# Remember, sapply would apply the function to each elemnt of the list, therefore
# we do not need to instruct R to spit out teh element and then acess teh first element
sapply(splitName, fristelement)

#3.  Replacing Variable names with incorrct spacing 
testName <- "this_is_a_test_name"
sub("_","",testName) # Here the sub( ) function replaced teh first located _ with nothing
# alternatively if we want to make it quicker, we can do this 
gsub("_", " ", testName) #In here we ask R to replace all _ with a space 

names(data)
# In here, we have a lot of dots that are supposed to be spaces, to change simply
# use what we have discovered, since #. is a reserved variable for NA, we use \\.
# to indicate the character |\\ .| , not the missing value| . |
gsub("\\."," ", names(data)) 


# 4. Searching for values in variable names and variables 
# -- grep("character string", location of search)
grep("Alameda", data$intersection) # Returns the interger loaction
grep("Alameda", data$intersection, value = T) # returns the row name
#If you are looking at whether or not somthing appears, it will return an 
#interger list of 0 if it does not exsit.
grep("Tauranga", data$intersection)
length(grep("Tauranga", data$crossStreet))
# --grepl("character string", location of search), returns a vector of 0,1 based on 
#   True or False 
grepl("Alameda", data$intersection)
sum(grepl("Alameda", data$intersection))
table(grepl("Alameda", data$intersection))
# You can also use this to subset, for exanple, suppose we only want the data
# where Alaeda isnt the intercetion, as subsetting is based on logical variables 
data2 <- data[!grepl("Alameda", data$intersection), ]


# 4. Other useful functions 
install.packages("stringr")
library("stringr")
# -- nchar() function
nchar("Tauranga Sounth")
# -- substr() function
substr("Jeffery Leek",1,7)
substr("Jeffery Leek",1,2)
# -- paste() function
paste("Charlotte", "Meiling", "Van", "Herwijnen")
paste("Charlotte", "Meiling", "Van", "Herwijnen", sep = ".")
paste("Charlotte", "Meiling", "Van", "Herwijnen", sep = "@")
# -- paste0()
paste0("Charlotte", "Meiling", "Van", "Herwijnen")
# --str_trim()
str_trim("Jeff       ")