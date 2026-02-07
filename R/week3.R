# Script Setting and Resources 
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Data Import and Cleaning 
raw_df <- read.csv("week3.csv", header = TRUE)
raw_df$timeStart <- as.POSIXct(raw_df$timeStart)
raw_df$timeEnd <- as.POSIXct(raw_df$timeEnd)
clean_df <- subset(raw_df, timeStart > as.POSIXct("2017-07-01 00:00:00"))
clean_df <- subset(clean_df, q6 == 1)

# Analysis 
clean_df$timeSpent <- difftime(clean_df$timeEnd, clean_df$timeStart, units = c("secs"))
hist(as.numeric(clean_df$timeSpent))
frequency_tables_list <- lapply(clean_df[,5:14], table)
lapply(frequency_tables_list, barplot)
sum(clean_df$q1 >= clean_df$q2 & clean_df$q2 != clean_df$q3)
for(var in frequency_tables_list) 
  { barplot(var) }