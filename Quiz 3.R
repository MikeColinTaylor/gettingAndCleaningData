
setwd("G:/Coursera/Getting and cleaning data")


#Q1
q1Data <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv")

head(q1Data$ACR == 3)
head(q1Data$AGS == 6)
head(which(q1Data$ACR == 3 & q1Data$AGS == 6), 3)
#125 238 262 


#Q2
#install.packages("jpeg")
library(jpeg)
?download.file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg", destfile = "quiz3Q2.jpg", mode = "wb")
q2File <- readJPEG("quiz3Q2.jpg", native = TRUE)
quantile(sort(q2File), c(0.3, 0.8))
#      30%       80% 
#-15259150 -10575416 

#Q3
options(stringsAsFactors = F)
gdp <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", skip = 5, header = F, nrows = 190)
edu <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv")

str(gdp)
str(edu)

gdpEdu <- merge(x = gdp, y = edu, by.x = "V1", by.y = "CountryCode")
nrow(gdpEdu)
#189

install.packages("stringr")
library(stringr)
gdpEdu$V5 = str_trim(gdpEdu$V5)
gdpEdu$V5 = str_replace_all(gdpEdu$V5, ",", "")

gdpEdu <- gdpEdu[order(as.numeric(gdpEdu$V5)), ]
gdpEdu$V4[13]
#St. Kitts and Nevis


#Q4
summary(as.factor(gdpEdu$Income.Group))
mean(gdpEdu$V2[gdpEdu$Income.Group == "High income: nonOECD"])
mean(gdpEdu$V2[gdpEdu$Income.Group == "High income: OECD"])
#32.96667, 91.91304


#Q5
summary(as.factor(gdpEdu$Income.Group[gdpEdu$V2 <= 38]))
#5

