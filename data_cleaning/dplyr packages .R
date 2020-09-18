# dplyr package introduction and basic commands 

# Basic commands of dplyr is as follows
library(dplyr)
# select() - return a subset of the columns of a data frame
# filter() - extract a subset of rows from a data frame based on logical statements
# arrange() - reprder rows of a data frame
# rename()  - rename variables in a data frame
# mutate() - add new variables in a data frame
# summarise() / summarize - generate summary statistics of different varaibels in the data frame 

# -- Example Data set loading
data <- datasets::USArrests
dim(data)
str(data)
names(data)

# 1. Select() function
head(select(data, Murder))
head(select(data,-Murder))

# 2. Filter function() creates a new df
popdat <- filter(data, UrbanPop > 60)
head(popdat)
popdat <- filter(data, UrbanPop > 60 & Murder >3)
popdat

# 3. Arrange(), order based on values of the column 
urban <- arrange(data, UrbanPop)
urban
urbandesc <- arrange(data, desc(UrbanPop))
urbandesc

# 4. Rename() function
data <- rename(data, mu = Murder)
head(data)

# 5. Mutate()
data <- mutate(data, murderdetrend = Murder - mean(Murder, na.rm = T))
head(select(data, Murder,murderdetrend))

data <- mutate(data, popyes = factor(1*(UrbanPop >60), labels = c("not pop","pop")))
popnot <- group_by(data, popyes)
popnot
summarize(popnot, Murder = mean(Murder))
