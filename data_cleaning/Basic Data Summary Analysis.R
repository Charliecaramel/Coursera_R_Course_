
# -- Summarising Data Commands

# Example used for notes, Baltimore city open data on Resutaurants in the city 
url <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(url, destfile = "./data_cleaning/restaurants.csv")
resdata <- read.csv("data_cleaning/restaurants.csv")

# --- Basic Summary info about the data set ---#
head(resdata, n=3)
summary(resdata)
str(resdata)        
quantile(resdata$councilDistrict, na.rm = T)
quantile(resdata$councilDistrict, probs = c(0.5, 0.75,0.9))

# --- Making Tables -----#
table(resdata$zipCode, useNA = "ifany") 
# In here, we used the useNa = "ifany" command to tell R to include a seprate
# coloumn in the table for couting missing values, by defalut, it does not do this
dim_table <- table(resdata$zipCode, resdata$councilDistrict)
dim_table

# --- Checking for Missing Values ----#
sum(is.na(resdata$councilDistrict))
any(is.na(resdata$councilDistrict))
all(resdata$zipCode > 0)

# --- Coloum and Row sums -----#
colSums(is.na(resdata))
all(colSums(is.na(resdata)) == 0)

# --- Tables and Subsetting ----#
table(resdata$zipCode %in% c("21212"))
table(resdata$zipCode %in% c("21212", "21213"))
resdata[resdata$zipCode %in% c("21212","21213"),]

# --- Cross Tabs ----#
data(UCBAdmissions)
df = as.data.frame(UCBAdmissions)
summary(df)

xt <- xtabs(Freq ~ Gender + Admit, data = df)
xt

# --- Flat Tables (Cross Tables for many)-----#
warpbreaks$replicate <- rep(1:9, len = 54)
xt = xtabs(breaks ~.,data = warpbreaks)
xt
ftable(xt)

# ---- Size of a data set ----#
fakedata <- rnorm(25)
object.size(fakedata)
