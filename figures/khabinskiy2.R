library(dplyr)

raw <- read.csv("droptimes.csv",header=TRUE)
data <- tibble(raw)
grouped <- group_by(data,type)

