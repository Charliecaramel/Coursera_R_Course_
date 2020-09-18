# HDF5 - Heirecial Data Format is used to strore large data sets, it generally
#        consist of groups with group headers with names and a list of attributes
#        or group tables with lists objects in a group
# To read HDF5 datasets into R we need to use the following packages
install.packages("BiocManager")
BiocManager::install("rhdf5")
library(rhdf5)

# - Creating a HDF5 file
file <- h5createFile("example.h5")
file
# - Creating a HDF5 group
file <- h5createGroup("example.h5","foo")
file <- h5createGroup("example.h5","baa")
file <- h5createGroup("example.h5","foo/foobaa") # - Creating a sub-group
h5ls("example.h5")

# - Wirting the data in to these groups
A <- matrix (1:10, nr = 5, nc = 2)
h5write(A, "example.h5", "foo/A")

B <-  array(seq(0.1, 2.0, by = 0.1), dim = c(5,2,2))
attr(B, "scale") <- "liter"
h5write(B, "example.h5", "foo/foobaa/B")
h5ls("example.h5")

# - Writing data to the top level as a group
df = data.frame(1L:5L,seq(0,1, length.out = 5), 
                c("ab", "cde", "fghi","a", "s"), 
                stringsAsFactors = FALSE)
h5write(df, "example.h5", "df")
h5ls("example.h5")

# -- Reading specific data sets
readA = h5read("example.h5", "foo/A")
readB = h5read("example.h5","foo/foobaa/B")
readdf = h5read("example.h5", "df")
readA

# -- Wiriting data to a specifc group
# - In here, we are specifying the dimesions in which we want the data to be
# - substitued into. For example, we want 12,13,14 to be replacing the first
# - three rows entry in the first coloum. thus list(1:3,1)

h5write(c(12,13,14), "example.h5", "foo/A", index = list(1:3,1))
h5read("example.h5", "foo/A")



