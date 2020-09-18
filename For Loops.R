# Control Sturctures 2 - For Loops

# For loops allows you to repeat specific commands for a set amount of time, to construct a loop you have to specify the condition
# in which the loops is going to be repeated. In the case of For Loops you have to specify an For Loop Index, for example

# for( i in 1:10){
#    for loop commands
#}

# For example
i = vector("numeric", 100) #note here, you have to specify the index frist, before R can use it.
for(i in 1:10){
  print(i)
}

#For loops in R are also very flexible in how it extracts information, for example

x = c("charlotte","james","wendy","ally","lily","kiran","Tommy","sally")
length(x)

for (i in 1:length(x)){
  print(x[i])
}

for (i in seq_along(x)){
  print(x[i])
}

y = c("a","b","c")
for (letter in y){
  print(letter)
}

# You can also nest for loops, for example

m1 = matrix(1:6,2,ncol = 3)
m1

for (i in seq_len(nrow(m1))){
  for (j in seq_len(ncol(m1))){
    print(m1[i,j])
  }
}



