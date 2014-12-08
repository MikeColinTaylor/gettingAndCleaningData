
setwd("G:/Coursera/Getting and cleaning data")
getwd()

#Q1
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "quiz1.csv")

data <- read.csv("quiz1.csv")

sum(data$VAL == 24, na.rm = T)
#53


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
rootNodeQ4 <- xmlRoot(q4)
names(rootNodeQ4)
zipcodes <- xpathSApply(rootNodeQ4, "//zipcode", xmlValue)
sum(zipcodes == "21231")
#127

#Q5
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", destfile = "quiz1Q5.csv")
#install.packages("data.table")
library(data.table)
DT <- fread("quiz1Q5.csv")
str(DT)
start <- proc.time()
for (i in c(1:1000)) {
  mean(DT$pwgtp15,by=DT$SEX)
}
proc.time() - start

#rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2] errors
#sapply(split(DT$pwgtp15,DT$SEX),mean) 0.88s
#mean(DT$pwgtp15,by=DT$SEX) 0.05s
#DT[,mean(pwgtp15),by=SEX] 0.96s
#tapply(DT$pwgtp15,DT$SEX,mean) 1.38s
#mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15) stopped before finished

#mean(DT$pwgtp15,by=DT$SEX)