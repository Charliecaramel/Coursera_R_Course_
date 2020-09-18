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
