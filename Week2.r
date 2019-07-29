# Print working directory
getwd()

# Set working directory
setwd(dir = "/Users/shreymahajan/downloads")

# Print all objects in workspace
ls()

# Trying to print something which is not available in workspace
Saving1
# Got Error: object 'Saving1' not found

#.R datafiles
# Create few objects to save later
study1.df <- data.frame(id = 1:5, sex = c("m", "m", "f", "f", "m"),score = c(51, 20, 67, 52, 42))

score.by.sex <- aggregate(score ~ sex, FUN = mean, data = study1.df)

study1.htest <- t.test(score ~ sex, data = study1.df)

# Save object as new .RData file
save(study1.df, score.by.sex, study1.htest, file = "/Users/shreymahajan/study1.RData")

# Use save image to save all objects
save.image(file = "/Users/shreymahajan/projectimage.RData")

# Load objects in study1.RData
load(file = "/Users/shreymahajan/study1.RData")

# Load objects in projectimage.RData
load(file = "/Users/shreymahajan/projectimage.RData")

# Remove object from workspace
rm(list = ls())
# Warning: It removes all the objects from working directory we can not restore them back without
# running original code which generated them

# Read file from url
fromweb <- read.table(file = 'http://goo.gl/jTNf6P',sep = '\t', header = TRUE)

