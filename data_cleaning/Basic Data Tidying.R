# Data Tidying and Organisation
library(dplyr)
library(plyr)

# Summarise Datasets
#Most typically you would want to get a sense of what you are dealing with before
#you proceed with analysis. To do this, we can use the head() or tail() function
head(arrest)
tail(arrest)
summary(arrest)
str(arrest)

# Sorting Missing Values 
# As pointed out before, we know that we can fine missing values with the is.na()
# command, and we can use sum(is.na()) to find the number of missing values, for example
any(is.na(arrest$ArrestDate))
any(is.na(arrest$Race))
sum(is.na(arrest$Race))
# We can also use loop commands to make things faster
colSums(is.na(arrest))
# Sso from this we can see the number of missing values in each individual coloumn
# We might also want to know the size of the data set
print(object.size(arrest))

# Tabulation Commands
# Suppose you are only interested in a small subset of the data set for now, and dont
# want to remove variables or observations just yet. To do this, we have to use tabulation
# a) Simple Tabulation
table(arrest$Race)
# b) Two-Way Tabulation
table(arrest$Sex, arrest$Race)
# c) Complex Logical Tabulation
table(arrest$Race %in% c("B"))
table(arrest$Race %in% c("B","U")) # Race that is either B or U
arrest[arrest$Race %in% c("B"), ]

#Cross Tabs (2 way tabulations)
data("UCBAdmissions")
dat <- as.data.frame(UCBAdmissions)
summary(dat)
ctab <- xtabs(Freq~Gender + Admit, data = dat)
ctab
