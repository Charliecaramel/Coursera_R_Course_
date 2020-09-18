library(readr)
hospital <- read_csv("rprog-data-ProgAssignment3-data/hospital-data.csv")
View(hospital)
outcome <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv",colClasses = "character")
View(outcome)

# -- Simple plot of the 30 day Mortaility rates from Heart Attacks
heart_attack <- as.numeric(outcome[,11])
hist(heart_attack)

# -- Finding the best hospital in the state
best <- function(state,issue){
  state_hos <- subset(outcome, State == state)
  if(nrow(state_hos) == 0){
    print("invalid state")
    break
  }else{
    if(issue == "heart attack"){
      min <- min(state_hos[,11], na.rm = T)
      name <- state_hos$Hospital.Name[state_hos[,11] == min]
    }else if(issue == "heart failure"){
      min <- min(as.numeric(state_hos[,17]), na.rm = T)
      name <- state_hos$Hospital.Name[state_hos[,17] == min]
    }else if(issue == "pneumonia"){
      min <- min(as.numeric(state_hos[,23]), na.rm = T)
      name <- state_hos$Hospital.Name[state_hos[,23] == min]
    }else{
      print("invalid outcome")
      break
    }
  }
  name
  }

# -- Ranking Hospitals by outcome in a state

rankhospital <- function(state,issue,num){
  state_hos <- subset(outcome, State == state)
  if(nrow(state_hos) == 0){
    print("invalid state")
    break
  }else{
    if(issue == "heart attack"){
      state_hos <- state_hos[order(as.numeric(state_hos$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack),state_hos$Hospital.Name), ]
      if(class(num) == "numeric"){
        name <- state_hos$Hospital.Name[num]
      }else if(num == "best"){
        name <- state_hos$Hospital.Name[1]
      }else if(num == "worst"){
        m <- max(as.numeric(state_hos[,11]), na.rm = T)
        name <- state_hos$Hospital.Name[state_hos[,11] == m]
      }
    }else if(issue == "heart failure"){
      state_hos <- state_hos[order(as.numeric(state_hos$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure),state_hos$Hospital.Name),]
      if(class(num) == "numeric"){
        name <- state_hos$Hospital.Name[num]
      }else if(num == "best"){
        name <- state_hos$Hospital.Name[1]
      }else if(num == "worst"){
        m <- max(as.numeric(state_hos[,17]), na.rm = T)
        name <- state_hos$Hospital.Name[state_hos[,17] == m]
      }
    }else if(issue == "pneumonia"){
      state_hos <- state_hos[order(as.numeric(state_hos$Hospital.30.Day.Readmission.Rates.from.Pneumonia),state_hos$Hospital.Name),]
      if(class(num) == "numeric"){
        name <- state_hos$Hospital.Name[num]
      }else if(num == "best"){
        name <- state_hos$Hospital.Name[1]
      }else if(num == "worst"){
        m <- max(as.numeric(state_hos[,23]), na.rm = T)
        name <- state_hos$Hospital.Name[state_hos[,23] == m]
      }
    }else{
      print("invalid outcome")
      break
    }
  }
  name
}

# -- Ranking hospital across states
rankall <- function(issue, num = "best"){
  data <- as.data.frame(matrix(nrow = 0, ncol = 2, dimnames = list(NULL, c("Hospital Name","State"))))
  if(issue == "pneumonia"){
    for(i in levels(outcome$State)){
      state_i <- subset(outcome,State == i)
      state_i <- state_i[order(as.numeric(state_i[,23]), state_i$Hospital.Name),]
      if(class(num) == "numeric"){
        name <- state_i$Hospital.Name[num]
      }else if(num == "best"){
        name <- state_i$Hospital.Name[1]
      }else if(num == "worst"){
        m <- max(as.numeric(state_i[,23]), na.rm = T)
        name <- state_i$Hospital.Name[state_i[,23] == m]
      }
      data[i, ] = c(name, i)
    }
  }else if(issue == "heart failure"){
    for(i in levels(outcome$State)){
      state_i <- subset(outcome,State == i)
      state_i <- state_i[order(as.numeric(state_i[,17]), state_i$Hospital.Name),]
      if(class(num) == "numeric"){
        name <- state_i$Hospital.Name[num]
      }else if(num == "best"){
        name <- state_i$Hospital.Name[1]
      }else if(num == "worst"){
        m <- max(as.numeric(state_i[,23]), na.rm = T)
        name <- state_i$Hospital.Name[state_i[,23] == m]
      }
      data[i, ] = c(name, i)
    }
  }else if(issue == "heart attack"){
    for(i in levels(outcome$State)){
      state_i <- subset(outcome,State == i)
      state_i <- state_i[order(as.numeric(state_i[,11]), state_i$Hospital.Name),]
      if(class(num) == "numeric"){
        name <- state_i$Hospital.Name[num]
      }else if(num == "best"){
        name <- state_i$Hospital.Name[1]
      }else if(num == "worst"){
        m <- max(as.numeric(state_i[,11]), na.rm = T)
        name <- state_i$Hospital.Name[state_i[,11] == m]
      }
      data[i, ] = c(name, i)
    }
  }
  data
}













