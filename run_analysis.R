library(tools) ## md5sum
library(utils) ## unzip
## Cheking the presence of the data file

if (!file.exists('getdata-projectfiles-UCI HAR Dataset.zip')) {
    stop('Data file must be in the project folder!')
}
## Cheking the consistency of the data file
if md5sum('getdata-projectfiles-UCI HAR Dataset.zip') != "d29710c9530a31f303801b6bc34bd895" {
    stop('Invalid data file!')
}
## Unzip the data file
unzip('getdata-projectfiles-UCI HAR Dataset.zip')
## Loading small data files
features <- read.table('UCI HAR Dataset/features.txt')
subjecttrain <- read.table('UCI HAR Dataset/train/subject_train.txt')
subjecttest <- read.table('UCI HAR Dataset/test/subject_test.txt')
activitienames <- read.table('UCI HAR Dataset/activity_labels.txt')
activitytrain <- read.table('UCI HAR Dataset/train/y_train.txt')
activitytest <- read.table('UCI HAR Dataset/test/y_test.txt')
## Loading data sets
traindata <- read.table('UCI HAR Dataset/train/X_train.txt')
testdata <- read.table('UCI HAR Dataset/test/X_test.txt')
## Getting features to be used
featuresneeded <- grepl('mean[()]|std[()]', features$V2)
## Renaming feature name
featurenames <- gsub('[-(),]', '', features$V2)
## Subsetting necessary columns in both data sets
smalltestdata <- testdata[,featuresneeded]
smalltraindata <- traindata[,featuresneeded]
## Merging the two datasets including subjects and activities 
data <- merge(smalltestdata, smalltraindata, all=TRUE, sort=FALSE)
subject <- c(subjecttest$V1, subjecttrain$V1)
activity <- c(activitytest$V1, activitytrain$V1)
## Creating factors from activity codes
activityfactor <- factor(activity, levels = activitienames$V1, labels = activitienames$V2)
## Adding subject and activity columns
data <- cbind(subject, activityfactor, data)
## Set column names as per the feature names
names(data) <- c("subject", "activity", featurenames[featuresneeded])
## Writing tidy data set to file
write.table(data, "tidy.txt")
## Creating the second dataset
data2<-aggregate(data[,3:68], by = list (data$subject, data$activity), FUN = mean)
write.table(data2, "tidy2.txt")
