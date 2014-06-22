setwd("C:/Users/Pat/Documents/Programming/coursera/DataAnalysis/GettingData/UCI HAR Dataset")

## read in the metadata
trainSubject<-read.table("train/subject_train.txt", colClasses="numeric", quote="", comment.char="")
trainActivity<-read.table("train/y_train.txt", colClasses="numeric", quote="", comment.char="")
testSubject<-read.table("test/subject_test.txt", colClasses="numeric", quote="", comment.char="")
testActivity<-read.table("test/y_test.txt", colClasses="numeric", quote="", comment.char="")
 
train<-read.table("train/X_train.txt", colClasses="numeric", quote="", comment.char="")
dim(train)
# [1] 7352  561
test<-read.table("test/X_test.txt", colClasses="numeric", quote="", comment.char="")
dim(test)
#[1] 2947  561

# get column names and corresponding column numbers
features<-read.table("features.txt", sep=" ", quote="", comment.char="", stringsAsFactors=FALSE)
dim(features)
# [1] 561   2

# search for mean() and std() columns
meanColumns<-grep("mean()", features[,2], fixed=TRUE)
stdColumns<-grep("std()", features[,2], fixed=TRUE)
extractColumns<-c(meanColumns, stdColumns)
extractColumns<-sort(extractColumns)

# extract mean() and std() columns
train<-train[,extractColumns]
test<-test[,extractColumns]
dim(train)
# [1] 7352   66
dim(test)
# [1] 2947   66
nrow(train)+nrow(test)
# [1] 10299

# combine train and test subsets
mergedData<-rbind(train, test)
dim(mergedData)
# [1] 10299    66

# create descriptive column names
features[extractColumns,2]<-gsub("-", "_", features[extractColumns,2])
features[extractColumns,2]<-gsub("()", "", features[extractColumns,2], fixed=TRUE)
names(mergedData)<-features[extractColumns,2]

mergedActivity<-rbind(trainActivity, testActivity)
mergedData$Activity<-mergedActivity[,1]
mergedSubject<-rbind(trainSubject, testSubject)
mergedData$Subject<-mergedSubject[,1]
names(mergedData)[67:68]
# [1] "Activity" "Subject" 

# map y_train/test numbers to activity name
activityLabels<-read.table("activity_Labels.txt", quote="", comment.char="", stringsAsFactors=FALSE)
names(activityLabels)<-c("ActivityCode", "ActivityLabel")
mergedData<-merge(mergedData, activityLabels, by.x="Activity", by.y="ActivityCode", all.x=TRUE)
dim(mergedData)
# [1] 10299    69

write.table(mergedData, "trainAndTest.txt", quote=FALSE, row.names=FALSE)

avgByActivitySubj<-aggregate(mergedData[2:67], by=list(mergedData$ActivityLabel, mergedData$Subject), mean)
names(avgByActivitySubj)[1:2] <- c("Activity", "Subject")
aggregateNames<-names(avgByActivitySubj)[3:68]
aggregateNames<-paste("avg", prettyNames, sep="_")
names(avgByActivitySubj)[3:68]<-aggregateNames

write.table(avgByActivitySubj, file="TidyAverages.txt", sep="\t", quote=FALSE, row.names=FALSE)
