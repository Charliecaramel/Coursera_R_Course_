data <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv",colClasses = "character")
tapply(dat, factor, functioin)
factor <- States
function <- ranking section
dat <- filterd data


ranksort <- function(name, num, data){
  dat <- as.data.frame(matrix(nrow = 0,ncol = 2, dimnames = list(NULL, c(Hospital.Name, issue)) ))
  if(class(num) == "numeric"){
    name <- data$Hospital.Name[num]
  }else{
    if(num == "best"){
      name <- data$Hospital.Name[1]
    }else if(num == "worst"){
      m <- max(data$issue, na.rm = TRUE)
      name <- data$Hospital. Name[data[,2] == m]
    }
  }
} 


data$State <- as.factor(data$State)


data <- split(data[,c(2,11,17,32)],data$State)
