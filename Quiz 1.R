
setwd("G:/Coursera/Getting and cleaning data")

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "quiz1.csv")

data <- read.csv("quiz1.csv")


#Q1
sum(data$VAL == 24, na.rm = T)
#3290

#Q2
#Tidy data has one variable per column.