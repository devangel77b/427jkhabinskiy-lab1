library(dplyr)

raw <- read.csv("droptimes.csv",header=TRUE)
data <- tibble(raw)
data <- mutate(data,a_ms=2*5.0/time_s^2) #why 4.5?
grouped <- group_by(data,type)

print(summarise(grouped,
	mt=mean(time_s),
	sdt=sd(time_s),
	ma=mean(a_ms),
	sda=sd(a_ms)))

model1 <- aov(time_s~type,data)
model2 <- aov(a_ms~type,data)
print(summary(model1))
print(summary(model2))
