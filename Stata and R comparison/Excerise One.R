# Excersise Sheet 1 - STATA

# Question 1 -- Loading Data Sets
data = read_dta(file.choose())

# Question 2 --  Find the value of plevel2 for Haverstock School
data$plevel2[data$name == "Haverstock School"]

# Question 3 -- Find the number of schools with lea code = 331
sum(with(data, data$lea == 331))

# Question 7 -- Load Six_dta data set
library(haven)
sixform <- read_dta("~/Desktop/Stata Learning Folder/Data/six_2009.dta")
View(data2)
 
# Question 8 -- Find the average point scored for students in Harverstock School
sixform$nave_pts[data$name == "Haverstock School"]

# Question 9 -- Count the number of schools in Coventry that has six-form
sum(with(sixform, sixform$lea == 331))

# Question 10 -- Merge the two data files together 
colnames(data)
colnames(sixform)
data_file = merge(data, sixform, all.x = TRUE)

# Question 11 -- Does Haverstock School have both six forms and secondary school
is.na(data_file$plevel2[data_file$name == "Haverstock School"] & 
        data_file$nave_pts[data_file$name == "Haverstock School"] )

sum(!is.na(data_file$nave_pts))

# Question 12 -- Meger the existing data set with LEA spedning
lea_dat = read_dta("~/Desktop/Stata Learning Folder/Data/lea.dta")
dataset = merge(lea_dat, data_file, by.y = "lea", by.x = "LEA")

# Quetsion 13 -- Merge the values from 2009 with 2008
dat_2 = read_dta("~/Desktop/Stata Learning Folder/Data/secondary_2008.dta")
colnames(dat_2)
colnames(dataset)
addcol_1 = data.frame(matrix(nrow = 5550, ncol = 1, dimnames = list(NULL, c("psen"))))
addcol_2 = data.frame(matrix(nrow = 4985, ncol = 6, dimnames = list(NULL, c("gender","n1618","nall",
                                                                            "nave_pts","p15sen","spend"))))
dataset = cbind(dataset, addcol_1)
dat_2 = cbind(dat_2, addcol_2)
dataset = rbind(dataset, dat_2)


# Question 14 -- Assinging labels to LEA codes

