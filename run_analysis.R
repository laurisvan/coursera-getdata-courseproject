# If you don't have these packages, install them:
# e.g. install.packages("readr")
library(readr)
library(data.table)

analyse <- function() {
  # Read column names & labels. Replace the parentheses and commans in column
  # names with '-'.
  # tBodyAcc-mean()-X becomes tBodyAcc-mean-X
  # angle(tBodyAccMean,gravity) becomes angle-tBodyAccMean-gravity
  colNamesRaw <- read.csv('features.txt', sep=" ", header=F)[[2]]
  colNames <- gsub(",", "-", gsub("\\((.+)\\)", "-\\1", gsub("\\(\\)", "", colNamesRaw)))
  
  labels <- read.csv('activity_labels.txt', sep=" ", header=F)[[2]]
  
  # Read data
  positions <- c(rep(16, 561))
  trainingData <- read_fwf("train/X_train.txt", fwf_widths(positions, colNames))
  testData <- read_fwf("test/X_test.txt", fwf_widths(positions, colNames))
  trainingLabels <- read.csv('train/y_train.txt', sep=" ", header=F, col.names=c("label")) 
  testLabels <- read.csv('test/y_test.txt', sep=" ", header=F, col.names=c("label"))
  trainingSubjects <- read.csv('train/subject_train.txt', header=F, col.names=c("subject"))
  testSubjects <- read.csv('test/subject_test.txt', header=F, col.names=c("subject"))
 
  # Bind it together
  allLabelsAsIntegers <- rbindlist(list(trainingLabels, testLabels), use.names=F, fill=F)
  labels <- factor(allLabelsAsIntegers[[1]], labels=labels)
  allData <- rbindlist(list(trainingData, testData), use.names=F, fill=F)
  subjects <- rbindlist(list(trainingSubjects, testSubjects), use.names=F, fill=F)
  
  # Then only select the subset of data well'be using
  selectedPositions <- c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215,
                         227:228, 240:241, 253:254, 266:271, 294:296, 345:350,
                         373:375, 424:429, 452:454, 503:504, 516:517, 529:530,
                         542:543, 555:561)
  filteredData <- data.frame(allData, check.names=F)[selectedPositions]
  
  # Squash everything together
  allReadings <- data.frame(subject=subjects, activity=labels, check.names=F, filteredData)
  
  # Calculate the mean of each measurement by grouping of subject & label
  means <-aggregate(. ~ subject + activity, allReadings, mean, na.rm=T)
}

# Call the function and store its results
write.table(analyse(), file="analysis.txt", row.names=F)