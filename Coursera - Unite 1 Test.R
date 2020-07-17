data_1 = read.csv("hw1_data.csv")

#basic subsetting rules
x = c("1","2","3","4","5")
x[1]
y = c(1:5)
y[y>2]
greaterthan = y > 2
y[greaterthan]

list_1 = list(foo = 1:4, bar = 0.6)
list_1
list_1[1]
list_1[[1]]
list_1$foo
list_1$bar
list_1["bar"]

list_2 = list(a =list(10,12,13), b = c(3.14,2))
list_2[[c(1,2)]]
list_2[[1]][[3]] #double subsetting
list_2[[2]][[1]]

is.na(data_1$Ozone)
missing_Ozone = is.na(data_1$Ozone)
#creating a new data fame with the missing rows removed
data_2 = data_1[!missing_Ozone, ]

#calculating the mean of Ozone when we discard the missing values

mean(data_1$Ozone[!missing_Ozone])
#OR we can use the new data set created
mean(data_2$Ozone)
remove(data_2)

#calculating the mean of Solar.R when Ozone is >31, and temp > 90
#first consider the missing values in the variable we try to calculate
missing_Solar = is.na(data_1$Solar.R)
mean(data_1$Solar.R[!missing_Solar]) #Now we have calculated the mean of the variable
# lets now subset our mean
# Essentially we have to create a logical vector that will take the value True when conditions are met
Ozone_31 = data_1$Ozone > 31
Temp_90 = data_1$Temp > 90
#To have both conditions satisfied, we simply use &
Ozone_31 & Temp_90

mean(data_1[Ozone_31 & Temp_90, "Solar.R"][!is.na(data_1[Ozone_31 & Temp_90, "Solar.R"])])


mean(data_1$Temp[data_1$Month == 6])
max(data_1$Ozone[!missing_Ozone][data_1$Month == 5])


