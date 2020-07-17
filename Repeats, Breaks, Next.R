# Control Stuctures - Repeats, Breaks, Next

#1. Repeats
# Repeats initates a loop that repeats indefinatley, the only way to exit a repeat loop is to use the Break function
# Most repeat loops will look something like this, the aim is usually to stop the loop once a condition is met

# repeat{
#   repeat commands
#      break
#}

#2. Nexts 

# Next is used to stop and move on to the next irriterations within a loop
# for example

x <- 1:5
for (val in x) {
  if (val == 3){
    next
  }
  val = val + 3
  print(val)
}
