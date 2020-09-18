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
        
head(rankall("heart attack", 20), 10)
tail(rankall("pneumonia", "worst"),3)
tail(rankall("heart failure"), 10)

