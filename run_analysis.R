# run script from UCI HAR Dataset directory
# setwd("~/UCI HAR Dataset")

# read in train and test datasets 
train<-read.table("train/X_train.txt", colClasses="numeric", quote="", comment.char="")
test<-read.table("test/X_test.txt", colClasses="numeric", quote="", comment.char="")

# combine train and test subsets
mergedData<-rbind(train, test)

# get column names and corresponding column numbers
features<-read.table("features.txt", sep=" ", quote="", comment.char="", stringsAsFactors=FALSE)

# search for mean() and std() columns
meanColumns<-grep("mean()", features[,2], fixed=TRUE)
stdColumns<-grep("std()", features[,2], fixed=TRUE)
extractColumns<-c(meanColumns, stdColumns)
extractColumns<-sort(extractColumns)

# extract mean() and std() columns
mergedData<-mergedData[,extractColumns]

# create descriptive column names for mean() and std() columns
features[extractColumns,2]<-gsub("-", "_", features[extractColumns,2])
features[extractColumns,2]<-gsub("()", "", features[extractColumns,2], fixed=TRUE)
names(mergedData)<-features[extractColumns,2]

# read in the activity and subject data for train and test data sets
trainSubject<-read.table("train/subject_train.txt", colClasses="numeric", quote="", comment.char="")
testSubject<-read.table("test/subject_test.txt", colClasses="numeric", quote="", comment.char="")
trainActivity<-read.table("train/y_train.txt", colClasses="numeric", quote="", comment.char="")
testActivity<-read.table("test/y_test.txt", colClasses="numeric", quote="", comment.char="")

# add activity and subject to combined dataset
mergedActivity<-rbind(trainActivity, testActivity)
mergedData$Activity<-mergedActivity[,1]
mergedSubject<-rbind(trainSubject, testSubject)
mergedData$Subject<-mergedSubject[,1]

# map activity number to activity name
activityLabels<-read.table("activity_Labels.txt", quote="", comment.char="", stringsAsFactors=FALSE)
names(activityLabels)<-c("ActivityCode", "ActivityLabel")
mergedData<-merge(mergedData, activityLabels, by.x="Activity", by.y="ActivityCode", all.x=TRUE)

# get average for mean() and std() columns by activity and subject
avgByActivitySubj<-aggregate(mergedData[2:67], by=list(mergedData$ActivityLabel, mergedData$Subject), mean)
names(avgByActivitySubj)[1:2] <- c("Activity", "Subject")

# create descriptive column names for aggregated data
aggregateNames<-names(avgByActivitySubj)[3:68]
aggregateNames<-paste("avg", aggregateNames, sep="_")
names(avgByActivitySubj)[3:68]<-aggregateNames

# save aggregated data in tab-delimited text file
write.table(avgByActivitySubj, file="TidyAverages.txt", sep="\t", quote=FALSE, row.names=FALSE)

