# Script Setting and Resources 
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Data Import and Cleaning 
raw_df <- read.csv("week3.csv", header = TRUE)
raw_df$timeStart <- as.POSIXct(raw_df$timeStart)
raw_df$timeEnd <- as.POSIXct(raw_df$timeEnd)
clean_df <- subset(raw_df, timeStart > as.POSIXct("2017-07-01 00:00:00"))
clean_df <- subset(clean_df, q6 == 1)