
#Lets create a matrix 
x <- 1:5
y <- 6:10
z <- 11:15
# Matrix with 3 columns x,y,z
cbind(x, y, z)
# Matrix with 3 rows x,y,z
rbind(x, y, z)
# Matrix with numeric and char column where everything is char
cbind(c(1, 2, 3, 4, 5), c("a", "b", "c", "d", "e"))
#Matrix with 2 column and 5 rows
matrix(data = 1:10, nrow = 5, ncol = 2)
#Matrix with 2 row and 5 column
matrix(data = 1:10, nrow = 2,ncol = 5)
# Matrix filled by row
matrix(data = 1:10, nrow = 2, ncol = 5, byrow = TRUE)
# Create Data Frame
survey <- data.frame("index" = c(1, 2, 3, 4, 5),  "sex" = c("m", "m", "m", "f", "f"),"age" = c(99, 46, 23, 54, 23))
# See structure of data frame
str(survey)
# Data frame without factors
survey <- data.frame("index" = c(1, 2, 3, 4, 5), "sex" = c("m", "m", "m", "f", "f"), "age" = c(99, 46, 23, 54, 23), stringsAsFactors = FALSE)
# See structure of data frame
str(survey)
# see first few rows of data frame
head(ChickWeight)
# see last few rows of data frame
tail(ChickWeight)
#view entire data frame
View(ChickWeight)
# print summary statistics of data frame
summary(ToothGrowth)
# see additional info
str(ToothGrowth)
# Column Names in data Frame
names(ToothGrowth)
# Only len Column in data frame
ToothGrowth$len
# Mean of len column
mean(ToothGrowth$len)
# table of supp column in df
table(ToothGrowth$supp)
#len and supp column of df
head(ToothGrowth[c("len", "supp")])
#create new df 
survey <- data.frame("index" = c(1, 2, 3, 4, 5),"age" = c(24, 25, 42, 56, 22))
# add new column sex in df
survey$sex <- c("m", "m", "f", "f", "m")
survey
# Name change for column
names(survey)[1] <- "participant.number"
survey
names(survey)[names(survey) == "age"] <- "years"
survey
### Slicing od df
# Row 1:6 and column 1
ToothGrowth[1:6, 1]
# Row 1:3 and column 1 and 3
ToothGrowth[1:3, c(1,3)]
# First Row
ToothGrowth[1, ]
# 2nd Column
ToothGrowth[, 2]
# New df where supp = VC
ToothGrowth.VC <- ToothGrowth[ToothGrowth$supp == "VC", ]
# Subsetting
subset(x = ToothGrowth,subset = len < 20 & supp == "OJ" & dose >= 1)
subset(x = ToothGrowth, subset = len > 30 & supp == "VC", select = c(len, dose))
# New subsetted df
oj <- subset(x = ToothGrowth, subset = supp == "OJ")
# Mean of len from that df
mean(oj$len)
# Mean by referring column vector
mean(ToothGrowth$len[ToothGrowth$supp == "OJ"])
# Health df
health <- data.frame("age" = c(32, 24, 43, 19, 43),"height" = c(1.75, 1.65, 1.50, 1.92, 1.80), "weight" = c(70, 65, 62, 79, 85))
# with function
with(health, height / weight ^ 2)

#############################--------Vector----------------##########################
# Library tidyverse
library(tidyverse)
#  Type of Vector
typeof(letters)
typeof(1:10)
# Logical Vector
1:10 %% 3 == 0
c(TRUE, TRUE, FALSE, NA)
# Numeric Vector
typeof(1)
typeof(1L)
# Install package pryr
install.packages("pryr")
# Character Size
x <- "This is a reasonably long string."
pryr::object_size(x)
y <- rep(x, 1000)
pryr::object_size(y)
# Coercion
x <- sample(20, 100, replace = TRUE)
y <- x > 10
# Sum is number of trues
sum(y)
# Mean is proportion > 10
mean(y)
#  Scalar and Recycling
sample(10) + 100
runif(10) > 0.5
1:10 + 1:2
# Vecotrise function gives error when recycling
tibble(x = 1:4, y = 1:2)
# Add rep to do recycling
tibble(x = 1:4, y = rep(1:2, each = 2))
# Vector Naming
set_names(1:3, c("a", "b", "c"))
# Subsetting
x <- c("one", "two", "three", "four", "five")
x[c(3, 2, 5)]
# subsetting with for all non missing values
x <- c(10, 3, NA, 5, 8, 1, NA)
x[!is.na(x)]
# Named vector subset with char vec
x <- c(abc = 1, def = 2, xyz = 5)
x[c("xyz", "def")]
# List
x <- list(1, 2, 3)
x
str(x)
x_named <- list(a = 1, b = 2, c = 3)
str(x_named)
# List with  mixed objects
y <- list("a", 1L, 1.5, TRUE)
str(y)
# subsetting list
a <- list(a = 1:3, b = "a string", c = pi, d = list(-1, -5))
str(a[1:2])
str(a[[1]])
a$a
# Attributes
attr(x, "greeting") <- "Hi!"
attr(x, "farewell") <- "Bye!"
attributes(x)
# Factors
x <- factor(c("ab", "cd", "ab"), levels = c("ab", "cd", "ef"))
typeof(x)
attributes(x)
# Date Time
x <- lubridate::ymd_hm("1970-01-01 01:00")
unclass(x)
typeof(x)
attributes(x)
# Tibbles are augmented lists
