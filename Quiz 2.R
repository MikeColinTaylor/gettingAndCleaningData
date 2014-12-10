
setwd("G:/Coursera/Getting and cleaning data")
getwd()

#Q1
#2013-11-07T13:25:07Z


#Q2
#sqldf("select pwgtp1 from acs where AGEP < 50")


#Q3
#sqldf("select distinct AGEP from acs")


#Q4
webData <- readLines("http://biostat.jhsph.edu/~jleek/contact.html")
nchar(webData[c(10, 20, 30, 100)])
#45 31  7 25


#Q5
fixedWidth <- read.fwf(
  file = url("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"),
  skip = 4,
  widths = c(12, 7,4, 9,4, 9,4, 9,4))

head(fixedWidth)
sum(fixedWidth$V4)
#32426.7
