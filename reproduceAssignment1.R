#Empty the console and environment
cat("\014")
rm(list=ls()) 

## Set the working directory
setwd("~/Documents/R Working Directory/ReproducibleAssignment1")

activity<-read.csv("activity.csv")
library(dplyr)

#There are 288 intervals per day (24*60/5); confirm that NA values that are present extend for
#ENTIRE day so summary can be done by day accurately.
noStepsData<-filter(activity,is.na(steps))
noStepsData<-group_by(noStepsData, date)
summarize(noStepsData, naSteps = n())  #Confirmed!


activity <- group_by(activity, date)
stepsPerDay<-summarize(activity, dailySteps = sum(steps, na.rm = FALSE))
hist(stepsPerDay$dailySteps,main="Number of Steps per Day",
     xlab="Steps",col = "red",breaks=6,ylim = c(0, 30))
summary(stepsPerDay$dailySteps)
