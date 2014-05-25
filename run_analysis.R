# setwd("~/Documents/online course
# /Data Specializations/reading and cleaning data/clean data project")
#####################################################################
########## Step1. Merges the training and the test sets to create one data set.

### load six data sets
X.train <- read.table("./UCI HAR Dataset/train/X_train.txt", sep = "") 
# dim(X.train)  7352*561
subject.train <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep = "") 
# dim(subject.train)  7352*1
y.train <- read.table("./UCI HAR Dataset/train/y_train.txt", sep = "") 
# dim(y.train)  7352*1
X.test <- read.table("./UCI HAR Dataset/test/X_test.txt", sep = "") 
# dim(X.test)  2947*561
subject.test <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep = "") 
# dim(subject.test) 2947*1
y.test <- read.table("./UCI HAR Dataset/test/y_test.txt", sep = "") 
# dim(y.test)  2947*1

### combine the train and test respectively
train <- data.frame(subject.train, y.train, X.train)
# dim(train)  7325*563
test <- data.frame(subject.test, y.test, X.test)
# dim(test)   2947*563
 
### load feature names
features <- read.table("./UCI HAR Dataset/features.txt", sep = "")
### load activity names
activity <- read.table("./UCI HAR Dataset/activity_labels.txt", sep = "")
colnames(activity) <- c("activity.id", "activity.label")

### now merge the training data set and combine it as one data set
### and name the colnames of the merged data set.
merged <- rbind(test, train)
colnames(merged) <- c("subject", "activity.id", as.character(features[, 2]))
# dim(merged) 10299*563

#############################################################
######### Step 2, Extracts only the measurements 
######### on the mean and standard deviation for each measurement.

index <- grepl("mean\\(\\)|std\\(\\)", colnames(merged))
### sum(index) = 66
### But if:  index <- grepl("mean()|std()", colnames(merged)),
### then:    sum(index) = 79
### as this will include meanFreq()...

merged <- merged[ ,  c(1, 2, which(index == TRUE))]
# take the columns of means and std measurments with reserving the subject
# and activity.id in the data.frame.


#############################################################
######### Step 3 and 4, Uses descriptive activity names to 
######### name the activities in the data set, 
######### Appropriately labels the data set with 
######### descriptive activity names. 

###  this has been done partially in step 1 where I use activity 
###  id rather than activity.label, so first merge data.frame activity 
###  and merged
merged <- merge(activity, merged, by = "activity.id")
# dim(merged) =  10299 * 69

# put the subject into the first column as the subject is in third column.
merged <- merged[ , c(3, 1:2, 4:69)]

# reorder the rows of the merged data.frame based on
# first, the subject number
# second, the activity.id
merged <- merged[with(merged, order(subject, activity.id)) ,    ] 

# delete the activity.id as we alreeady have 
# activity.label in merged data.frame.
merged$activity.id <- NULL
# dim(merged) = 10299 * 68

### Next, as the column name of the data.frame is sth like
###  "tBodyAcc-mean()-X" or  "tBodyAcc-std()-X" which looks
### really awkward, change that as "tBodyAcc.mean.X" and 
### "tBodyAcc.std.X"
col.names <- colnames(merged)
col.names <- gsub("()", "", col.names, fixed = TRUE)
col.names <- gsub("-", ".", col.names, fixed = TRUE)
colnames(merged) <- col.names

######################################################
########  Step 5, Creates a second, independent tidy data set with 
########  the average of each variable for each activity and each subject.
library(reshape2)
merged.melt <- melt(merged, id = c("subject", "activity.label"))
# dim(merged.melt) = 679734 * 4
merged.avg <- dcast(merged.melt, subject + activity.label ~ variable, mean)
# dim(merged.avg)  =  180 * 68

### save the file and upload
write.table(merged, "merged.txt", row.names= FALSE)
write.csv(merged, "merged.csv", row.names= FALSE)
write.table(merged.avg, "merged.avg.txt", row.names= FALSE)
write.csv(merged.avg, "merged.avg.csv", row.names= FALSE)
