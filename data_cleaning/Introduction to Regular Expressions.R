# Regular Expressions 
# -- Regular expressions can be thought as a combination of the literals and
#    metacharacters. 
# Think of literals as the words, and metacharacters as Grammar (pattenrs)
# Supppse we want to identify patterns in our data that consits of strings, we
# essentially need to find a way to express the following 
#     - White Spaces and word boundaris
#     - Set of literals
#     - the begining and the end of a line
#     - alternatives ("War" or "Peace")

# Metacharacters in R 
# 1. Start of the Line 
# "^" reprsents start of the line
# 2. End of the line of the Line 
# "$" reprsents start of the line
# 3. Character Classes with [][]
# For example, if we want to match the word Bush, no matter location or capitalisation 
# [Bb][Uu][Ss][Hh]
# -- Range of characters 
# ^[0-9][a-z]
# ^[0-9][a-zA-Z]
# -- "." is used to refer to any character
# for example 9.11 will match 9, followed by any possible character, and 11
# -- "|" will be similar to Or operators 
#^([Gg]ood|[Bb]ad). note if you dont put () in the condition, the ^ will only
# apply to the [Gg]ood literal match 
# -- Poential Charcters 
# [Gg]eorge( [Ww]\.)? [Bb]ush this will find all possible combinations of G.W.B
#      - note that when refering to a ., we need to use "\." becasue it is also
#        a metacharacter index

