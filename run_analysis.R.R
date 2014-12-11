

xTrain <- read.table("UCI HAR DATASET/train/X_train.txt")
xTest <- read.table("UCI HAR DATASET/test/X_test.txt")
xData <- rbind(xTrain, xTest)

sTrain <- read.table("UCI HAR DATASET/train/subject_train.txt")
sTest <- read.table("UCI HAR DATASET/test/subject_test.txt")
sData <- rbind(sTrain, sTest)

yTrain <- read.table("UCI HAR DATASET/train/y_train.txt")
yTest <- read.table("UCI HAR DATASET/test/y_test.txt")
yData <- rbind(yTrain, yTest)



features <- read.table("UCI HAR DATASET/features.txt")

meanVariableNumbers <- grep("mean()", features[, 2])
stdVariableNumbers <- grep("std()", features[, 2])

xData <- xData[, c(meanVariableNumbers, stdVariableNumbers)]
names(xData) <- features[c(meanVariableNumbers, stdVariableNumbers), 2]




activities <- read.table("UCI HAR DATASET/activity_labels.txt")
yData[, 1] = activities[yData[, 1], 2]
names(yData) <- "activity"
head(yData)


names(sData) <- "subject"
tidyData <- cbind(sData, yData, xData)
head(tidyData)

tidyDataSummary <- colMeans(tidyData[ , 3:ncol(tidyData)])
tidyDataSummary <- data.frame(t(unname(tidyDataSummary)))
names(tidyDataSummary) <- names(tidyData[ , 3:ncol(tidyData)])

write.table(tidyDataSummary, "summarised data.txt", row.names = F)
