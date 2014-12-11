
setwd("G:/Coursera/Getting and cleaning data")

options(stringsAsFactors = F)

#Q1
q1Data <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv")
strsplit(colnames(q1Data), "wgtp")[123]


#Q2
q2Data <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", skip = 5, header = F, nrows = 190)
#install.packages("stringr")
library(stringr)
q2Data$V5 = str_trim(q2Data$V5)
q2Data$V5 = as.numeric(str_replace_all(q2Data$V5, ",", ""))
mean(q2Data$V5)


#Q3
q2Data$V4[grep("^United", q2Data$V4)]


#Q4
gdp <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", skip = 5, header = F, nrows = 190)
edu <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv")

gdpEdu <- merge(x = gdp, y = edu, by.x = "V1", by.y = "CountryCode")
gdpEdu$Special.Notes[grep("^Fiscal.*June", gdpEdu$Special.Notes)]
length(grep("^Fiscal.*June", gdpEdu$Special.Notes))


#Q5
#install.packages("quantmod")
library(quantmod)
amzn <- getSymbols("AMZN", auto.assign = F)
sampleTimes <- index(amzn)
sum(format(sampleTimes, "%Y") == 2012)
#250
sum(format(sampleTimes, "%a") == "Mon" & format(sampleTimes, "%Y") == 2012)
#47
