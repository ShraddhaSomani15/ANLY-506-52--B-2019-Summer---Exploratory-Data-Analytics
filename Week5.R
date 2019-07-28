# Chapter 12
# Library tidyverse
# Data organised in different ways
table1
table2
table3
table4a
table4b
# In this example only table1 is tidy
# How we work with tidy data few examples
# Rate per 10,000
table1 %>% mutate(rate = cases / population * 10000)
# Cases per year
table1 %>% count(year, wt = cases)
# Visulization
library(ggplot2)
ggplot(table1, aes(year, cases)) + geom_line(aes(group = country), colour = "grey50") + geom_point(aes(colour = country))
# Now lets take untidy data and make it tidy
table4a
# Gathering function to gather columns into new variable for table4a with key as year and value as cases
tidy4a <- table4a %>% gather(`1999`, `2000`, key = "year", value = "cases")
# Lets do gather for table4b with value population
tidy4b <- table4b %>% gather(`1999`, `2000`, key = "year", value = "population")
# Lets combine tidied version
left_join(tidy4a, tidy4b)

# Spreading is opposite of gathering here data is scattered example table2
table2
tidy2 <- table2 %>% spread(key = type, value = count)
tidy2

# Seprating
# Lets tidy table3
#In this table we have one column rate with two variables case and population so here we need to split
table3
tidy3 <- table3 %>% separate(rate, into = c("cases", "population"))
tidy3
# But case and population are left as char so lets convert those
tidy3 <- table3 %>% separate(rate, into = c("cases", "population"), convert = TRUE)
tidy3
# Unite combines multiple columns into single column
# Lets take table 5
tidy5 <- table5 %>% unite(new, century, year)
tidy5

# Missing values
# Lets take some stocks data
stocks <- tibble(year = c(2015, 2015, 2015, 2015, 2016, 2016, 2016), qtr = c(1,2,3,4,2,3,4), return = c(1.88, 0.59, 0.35, NA, 0.92, 0.17, 2.66))
# There are 2 missing values in above data set
stocks %>% spread(year, return)
# We can make explicit missing values implicit
stocks %>% spread(year, return) %>% gather(year, return, `2015`:`2016`, na.rm = TRUE)
# Or we can do tidy data with complete function
stocks %>% complete(year, qtr)
# Sometimes for missing value we have to carryforward previous value so we use fill function
treatment <- tribble(
  ~ person,           ~ treatment, ~response,
  "Derrick Whitmore", 1,           7,
  NA,                 2,           10,
  NA,                 3,           9,
  "Katherine Burke",  1,           4
)
treatment
# So we need to carry derrick so we will use fill function
treatment %>% fill(person)

