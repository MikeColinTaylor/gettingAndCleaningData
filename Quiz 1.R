
setwd("G:/Coursera/Getting and cleaning data")


#Q1
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "quiz1.csv")

data <- read.csv("quiz1.csv")

sum(data$VAL == 24, na.rm = T)
#3290


#Q2
#Tidy data has one variable per column.


#Q3
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx", destfile = "quiz1_3.csv")
