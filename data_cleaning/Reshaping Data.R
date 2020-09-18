# ------------Reshaping Databases -----------------#

# Packages we used to reshape data
library(reshape)
library(reshape2)

# Example dataset mtcars
library(datasets)
head(mtcars)
data <- datasets::mtcars

# -- Melting Data Frames
# -- melt() command 
# melt(data = ,id = c(), measure.vars = c())
data$carname <- rownames(data)
carMelt <- melt(data, id = c("carname", "gear", "cyl"), measure.vars = c("mpg","hp"))
head(carMelt, n=3)

# -- Casting Data Frames
cyldata <- dcast(carMelt, cyl~variable) # defaulting to length, ie, counting function
cyldata <- dcast(carMelt, cyl~variable, mean)

# ----- Averaging Values within Factors (loop commands)

# M1 : Tapply functions
head(InsectSprays)
tapply(InsectSprays$count, InsectSprays$spray, sum)

# M2: Split Function into Lists
spIns <- split(InsectSprays$count,InsectSprays$spray)
spIns
sprCount <- lapply(spIns,sum)
sprCount
sprCount2 <- unlist(sprCount)

# M3: plyr package
ddply(InsectSprays, .(spray),summarize,sum=sum(count))

spraysums <- ddply(InsectSprays,.(spray), summarize, sum = ave(count,FUN = sum))
spraysums
