# Library readr # Read csv file
ozone <- read_csv("US EPA data 2017.csv")
# Remove spaces from col names
names(ozone) <- make.names(names(ozone))
# Number of rows 66869
nrow(ozone)
# Number of columns 55
ncol(ozone)
str(ozone)

############## since data set is different column names will differ from the book but functions are same


# Top of data for column 6,7 and 31
head(ozone[, c(6:7, 31)])
# Bottom of data
tail(ozone[, c(6:7, 31)])
# Filter data based on different variables
filter(ozone, Parameter.Name == "Ozone") %>%  select(State.Name, County.Name, Sample.Duration)
filter(ozone, State.Code == "36" & County.Code == "033" ) %>% select(Sample.Duration, Method.Name) %>% as.data.frame
# Unique states
select(ozone, State.Name) %>% unique %>% nrow
# Uniques state name
unique(ozone$State.Name)
# Summary
summary(ozone$X1st.Max.Value)
# quantile
quantile(ozone$X1st.Max.Value, seq(0, 1, 0.1))
# Ranking based on state and county
ranking <- group_by(ozone, State.Name, County.Name) %>% summarize(ozone = mean(X1st.Max.Value)) %>% as.data.frame %>%  arrange(desc(ozone))
# Top 10
head(ranking, 10)
# Filter for mariposa and california
filter(ozone, State.Name == "California" & County.Name == "Mariposa") %>% nrow
# Mutation as date
ozone <- mutate(ozone, X1st.Max.DateTime = as.Date(X1st.Max.DateTime))
# split by month
filter(ozone, State.Name == "California" & County.Name == "Mariposa") %>% mutate(month = factor(months(X1st.Max.DateTime), levels = month.name)) %>% group_by(month) %>%  summarize(ozone = mean(X1st.Max.Value ))
# Bootstrap sample
set.seed(10234)
N <- nrow(ozone)
idx <- sample(N, N, replace = TRUE)
ozone2 <- ozone[idx, ]
# Reconstruct ranking
ranking2 <- group_by(ozone2, State.Name, County.Name) %>% summarize(ozone = mean(X1st.Max.Value)) %>% as.data.frame %>% arrange(desc(ozone))
# Compare with original
cbind(head(ranking, 10),  head(ranking2, 10))