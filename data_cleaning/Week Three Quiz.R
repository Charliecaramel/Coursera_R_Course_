# Week 3 Quiz 

# -- Loading Dataset and Packages --#
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url, "./data_cleaning/quiz3data.csv")
data <- read.csv("./data_cleaning/quiz3data.csv")
library(dplyr)
library(plyr)

# -- Logical Variable: agricultureLogical ---

table(data$ACR, useNA = "ifany")
table(data$AGS, useNA = "ifany")
table(data$AGS, data$ACR, useNA = "ifany")

data$agricultureLogical <-ifelse(data$ACR == 3 & data$AGS == 6, T, F)
sum(data$agricultureLogical, na.rm = T)
agricultureLogical <- data$agricultureLogical

# - Question One
which(agricultureLogical)

# - Question Two
install.packages("jpeg")
library(jpeg)
jpegurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(jpegurl, "c")
jpg <- readJPEG("./data_cleaning/quizjepg.jpg")
quantile(jpg, probs = c(0.3,0.8))

# - Question Three

file1url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
file2url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(file1url, "./data_cleaning/gdp.csv")
download.file(file2url, "./data_cleaning/educationdata.csv")
gdpdata <- read.csv("./data_cleaning/gdp.csv")
edudata <- read.csv("data_cleaning/educationdata.csv")
# -- data cleaning

names(gdpdata)
gdpdata <- rename(gdpdata,CountryCode = X, ranking = Gross.domestic.product.2012, country_name = X.2, gdp_in_m = X.3)
gdpdata$ranking <- as.numeric(gdpdata$ranking)
gdpdata$gdp_in_m <- as.numeric(gdpdata$gdp_in_m)
gdpdata <- filter(gdpdata, ranking > 0) %>% select(c(1,2,4,5))

names(edudata)
edudata$Income.Group <- as.factor(edudata$Income.Group)
class(edudata$Income.Group)
class(dat$gdp_in_m)
levels(edudata$Income.Group)
table(edudata$Income.Group)

dat <- merge(edudata, gdpdata,by.x = "CountryCode", by.y = "CountryCode")
class(dat$ranking)
sort(dat$ranking, decreasing = T)
class(dat)
dat <- arrange(dat, desc(ranking))
dat[13,2]

summarize(dat, Income.Group, gdp_in_m)
dat$gdp_in_m <- as.numeric(dat$gdp_in_m)
summarize(dat, gdp_in_m = mean(gdp_in_m, na.rm = T), Income.Group)

tapply(dat$gdp_in_m, dat$Income.Group, mean, na.rm=T)
