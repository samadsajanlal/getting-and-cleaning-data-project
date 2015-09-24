# Coursera Getting and Cleaning Data Course Project
# Samad Sajanlal

# runAnalysis.r
# this file will:
# clean up almost everything left in memory
# set the working directory
# read each *_train file individually to its own variable
# read each *_test file individually to its own variable
# combine the two datasets
# extract only the measurements on the mean and standard deviation for each measurement
# export the final data to a file called tidy2.txt

setwd('~/bigdata/class3/project/')

features = read.table('./UCI HAR Dataset/features.txt',header=FALSE)
activityLabels = read.table('./UCI HAR Dataset/activity_labels.txt',header=FALSE)
colnames(activityLabels) = c('activityId','activityLabels')

trainSubject = read.table('./UCI HAR Dataset/train/subject_train.txt',header=FALSE)
trainX = read.table('./UCI HAR Dataset/train/x_train.txt',header=FALSE)
trainY = read.table('./UCI HAR Dataset/train/y_train.txt',header=FALSE)
colnames(trainSubject) = "subjectId"
colnames(trainX) = features[,2] 
colnames(trainY) = "activityId"
trainingData = cbind(trainY,trainSubject,trainX)

testSubject = read.table('./UCI HAR Dataset/test/subject_test.txt',header=FALSE)
testX = read.table('./UCI HAR Dataset/test/x_test.txt',header=FALSE)
testY = read.table('./UCI HAR Dataset/test/y_test.txt',header=FALSE)
colnames(testSubject) = "subjectId"
colnames(testX) = features[,2]
colnames(testY) = "activityId"
testingData = cbind(testY,testSubject,testX)

myData = rbind(trainingData,testingData)
myDataColNames = colnames(myData); 

# Create a vector (toUse) that contains TRUE for only the ID, mean, and stdev columns
toUse = (grepl("activity..",myDataColNames) | 
           grepl("subject..",myDataColNames) | 
           grepl("-mean..",myDataColNames) & 
           !grepl("-meanFreq..",myDataColNames) & 
           !grepl("mean..-",myDataColNames) | 
           grepl("-std..",myDataColNames) & 
           !grepl("-std()..-",myDataColNames))

myData = myData[toUse==TRUE] # filter our myData set against the TRUE values toUse
myData = merge(myData,activityLabels,by='activityId',all.x=TRUE)
myDataColNames = colnames(myData)

for (i in 1:length(myDataColNames)) # regular expressions to tidy up column names
{
  myDataColNames[i] = gsub("\\()","",myDataColNames[i])
  myDataColNames[i] = gsub("-std$","StdDev",myDataColNames[i])
  myDataColNames[i] = gsub("-mean","Mean",myDataColNames[i])
  myDataColNames[i] = gsub("^(t)","time",myDataColNames[i])
  myDataColNames[i] = gsub("^(f)","freq",myDataColNames[i])
}

colnames(myData) = myDataColNames
myDataNoLabels  = myData[,names(myData) != 'activityLabels'] # remove labels
tidyDataSet = aggregate(myDataNoLabels[,names(myDataNoLabels) != c('activityId','subjectId')],
                     by=list(activityId=myDataNoLabels$activityId,subjectId = myDataNoLabels$subjectId),
                     mean)

tidyDataSet = merge(tidyDataSet,activityLabels,by='activityId',all.x=TRUE) # re-add the labels

# export
write.table(tidyDataSet, './tidy2.txt',row.names=FALSE,sep='\t')
