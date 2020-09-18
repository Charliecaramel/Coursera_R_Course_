library(readr)
outcome <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv",colClasses = "character")
View(outcome)
source("rankall.R")
source("best.R")
source("rankhospital.R")

best("SC", "heart attack") 
best("NY", "pneumonia")
best("AK", "pneumonia")

rankhospital("NC", "heart attack", "worst") #Wane memorail hospital
rankhospital("WA", "heart attack", 7)
rankhospital("TX", "pneumonia", 10)
rankhospital("NY", "heart attack", 7)

outcome$State <- as.factor(outcome$State)
r <- rankall("heart attack", 4)
as.character(subset(r, state == "HI")$hospital)

r <- rankall("pneumonia", "worst")
r <- rankall("heart failure", 10)
as.character(subset(r, state == "NV")$hospital)
