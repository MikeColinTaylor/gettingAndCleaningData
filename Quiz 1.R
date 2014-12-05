
setwd("G:/Coursera/Getting and cleaning data")
getwd()

#Q1
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "quiz1.csv")

data <- read.csv("quiz1.csv")

sum(data$VAL == 24, na.rm = T)
#3290


#Q2
#Tidy data has one variable per column.


#Q3
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx", destfile = "quiz1q3.xlsx", mode = "wb")
#install.packages("xlsx")
library("xlsx")
?read.xlsx
q3 <- read.xlsx("quiz1q3.xlsx", sheetIndex = 1, rowIndex = c(18:23), colIndex = c(7:15))
q3
sum(q3$Zip * q3$Ext, na.rm = T) 
#36534720


#Q4
#install.packages("XML")
library("XML")
?xmlTreeParse
q4 <- xmlTreeParse("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml", useInternal = T)
