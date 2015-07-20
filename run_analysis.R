# The purpose of this project is to demonstrate your ability to collect, 
# work with, and clean a data set. The goal is to prepare tidy data that can be used 
# for later analysis. You will be graded by your peers on a series of yes/no questions 
# related to the project. You will be required to submit: 1) a tidy data set as 
# described below, 2) a link to a Github repository with your script for performing 
# the analysis, and 3) a code book that describes the variables, the data, and 
# any transformations or work that you performed to clean up the data called CodeBook.md. 
# You should also include a README.md in the repo with your scripts. This repo explains 
# how all of the scripts work and how they are connected.  
#
#One of the most exciting areas in all of data science right now is wearable computing - 
#  - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to 
# develop the most advanced algorithms to attract new users. The data linked to from the course 
# website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
# A full description is available at the site where the data was obtained: 
#  
#  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
#
#Here are the data for the project: 
#  
#  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#
#You should create one R script called run_analysis.R that does the following. 
# 1 Merges the training and the test sets to create one data set.
# 2 Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3 Uses descriptive activity names to name the activities in the data set
# 4 Appropriately labels the data set with descriptive variable names. 
# 5 From the data set in step 4, creates a second, independent tidy data set with the average of 
# each variable for each activity and each subject.
#
#  Good luck!

require(reshape2)

# Download the zip file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
temp <- paste(tempfile(), ".zip", sep = "")
download.file(fileUrl,temp)

# Extract the training and test data sets
train         <- read.table(unz(temp,"UCI HAR Dataset/train/X_train.txt"))
subjectsTrain <- read.table(unz(temp,"UCI HAR Dataset/train/subject_train.txt"))
activityTrain <- read.table(unz(temp,"UCI HAR Dataset/train/y_train.txt"))

test          <- read.table(unz(temp,"UCI HAR Dataset/test/X_test.txt"))
subjectsTest  <- read.table(unz(temp,"UCI HAR Dataset/test/subject_test.txt"))
activityTest  <- read.table(unz(temp,"UCI HAR Dataset/test/y_test.txt"))

# Extract features.txt
features <- read.table(unz(temp,"UCI HAR Dataset/features.txt"))
features[ , 2] <- paste("Group", features[ , 2])

# Extract the list of activities
activities <- read.table(unz(temp,"UCI HAR Dataset/activity_labels.txt"))

unlink(temp)

# Merge the train and test sets
mergedData <- rbind(train, test)

# Add column names 
names(mergedData) <- features[,2]

# And merge the subject vectors
mergedSubjects <- rbind(subjectsTrain, subjectsTest)
names(mergedSubjects) <- c("subject")

# And merge the activity vectors
mergedActivities <- rbind(activityTrain, activityTest)
mergedActivities <- as.data.frame(activities[mergedActivities[ , 1], 2])
colnames(mergedActivities) <- c("activity")

# Identify the columns with mean() and std()
x <- grepl("mean()", features[ , 2]) | grepl("std()", features[ , 2])
mergedData <- mergedData[ , x]

# Merge the Subjects with the Data
merged <- cbind(mergedSubjects, mergedActivities, mergedData)

# Recast and summarize
x <- melt(merged, id = c("subject", "activity") )
finalData <- dcast(x, subject + activity ~ ..., mean)

write.table(finalData, "~/Spectrum-R/tidyData.txt", row.names = FALSE)Enter file contents here
