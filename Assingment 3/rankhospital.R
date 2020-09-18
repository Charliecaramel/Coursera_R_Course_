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
      state_hos <- state_hos[order(as.numeric(state_hos$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia),state_hos$Hospital.Name),]
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


