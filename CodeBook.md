
Summary

This project performs data transformations on the UCI HAR Dataset to create a single output file "tidyData.txt". 
The source data for the project is spread out into 7 different files which are part of the following zip file:

   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
   
The "run_analysis.R" script associated with this project provides the required transformations on the data.

The source data includes:

- 'train/X_train.txt'         The Training set.
- 'train/y_train.txt'         The Training labels.
- 'test/X_test.txt'           The Test set.
- 'test/y_test.txt'           The Test labels.

X_train.txt and X_test.txt together contain 10,299 observations of 561 numeric which are the detailed output of the
experiment. Each column represents a single observation by one subject for one particular activity _or_ a summary of several
observations.

In addition, the following files are used

- 'train/subject_train.txt'   Identifies the subject who performed the activity for each window sample.
- 'test/subject_test.txt'     Similar information for the test data set
- 'activity_labels.txt'       Links the class labels with the activity name.
- 'features.txt'              A list of all the features in the X_train.txt data set.
   
The original data is processed as follows:

- download the zip file to a temp file
- unpack all the files from the zip file
- merge the training and test sets using rbind
- assign column names to the features in the merged data set using the contents of features.txt
- Separately, merge subject_train.txt and subject_test.txt, and set the column name to "subject"
- Merge y_train.txt and y_test.txt and set the column name to "activity"
- Use grepl to extrace just the columns that include "mean()" or "std()" in the column name.
- Merge the Subjects, Activities and the Data set into a single data frame
- Use melt/dcast to summarize the data by subject and activity
- Write the result to the file "tidyData.txt"

The tidyData.txt file contains the following fields:
 - subject - a number in the range 1-30 indicating the particular subject performing the activity
 - activity - one of LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS,WALKING_UPSTAIRS
 - 79 measurements of the particular subject performing the particular activity

The 79 measurements include the following:

Group tBodyAcc-mean()-X
Group tBodyAcc-mean()-Y
Group tBodyAcc-mean()-Z
Group tBodyAcc-std()-X
Group tBodyAcc-std()-Y
Group tBodyAcc-std()-Z
Group tGravityAcc-mean()-X
Group tGravityAcc-mean()-Y
Group tGravityAcc-mean()-Z
Group tGravityAcc-std()-X
Group tGravityAcc-std()-Y
Group tGravityAcc-std()-Z
Group tBodyAccJerk-mean()-X
Group tBodyAccJerk-mean()-Y
Group tBodyAccJerk-mean()-Z
Group tBodyAccJerk-std()-X
Group tBodyAccJerk-std()-Y
Group tBodyAccJerk-std()-Z
Group tBodyGyro-mean()-X
Group tBodyGyro-mean()-Y
Group tBodyGyro-mean()-Z
Group tBodyGyro-std()-X
Group tBodyGyro-std()-Y
Group tBodyGyro-std()-Z
Group tBodyGyroJerk-mean()-X
Group tBodyGyroJerk-mean()-Y
Group tBodyGyroJerk-mean()-Z
Group tBodyGyroJerk-std()-X
Group tBodyGyroJerk-std()-Y
Group tBodyGyroJerk-std()-Z
Group tBodyAccMag-mean()
Group tBodyAccMag-std()
Group tGravityAccMag-mean()
Group tGravityAccMag-std()
Group tBodyAccJerkMag-mean()
Group tBodyAccJerkMag-std()
Group tBodyGyroMag-mean()
Group tBodyGyroMag-std()
Group tBodyGyroJerkMag-mean()
Group tBodyGyroJerkMag-std()
Group fBodyAcc-mean()-X
Group fBodyAcc-mean()-Y
Group fBodyAcc-mean()-Z
Group fBodyAcc-std()-X
Group fBodyAcc-std()-Y
Group fBodyAcc-std()-Z
Group fBodyAcc-meanFreq()-X
Group fBodyAcc-meanFreq()-Y
Group fBodyAcc-meanFreq()-Z
Group fBodyAccJerk-mean()-X
Group fBodyAccJerk-mean()-Y
Group fBodyAccJerk-mean()-Z
Group fBodyAccJerk-std()-X
Group fBodyAccJerk-std()-Y
Group fBodyAccJerk-std()-Z
Group fBodyAccJerk-meanFreq()-X
Group fBodyAccJerk-meanFreq()-Y
Group fBodyAccJerk-meanFreq()-Z
Group fBodyGyro-mean()-X
Group fBodyGyro-mean()-Y
Group fBodyGyro-mean()-Z
Group fBodyGyro-std()-X
Group fBodyGyro-std()-Y
Group fBodyGyro-std()-Z
Group fBodyGyro-meanFreq()-X
Group fBodyGyro-meanFreq()-Y
Group fBodyGyro-meanFreq()-Z
Group fBodyAccMag-mean()
Group fBodyAccMag-std()
Group fBodyAccMag-meanFreq()
Group fBodyBodyAccJerkMag-mean()
Group fBodyBodyAccJerkMag-std()
Group fBodyBodyAccJerkMag-meanFreq()
Group fBodyBodyGyroMag-mean()
Group fBodyBodyGyroMag-std()
Group fBodyBodyGyroMag-meanFreq()
Group fBodyBodyGyroJerkMag-mean()
Group fBodyBodyGyroJerkMag-std()
Group fBodyBodyGyroJerkMag-meanFreq()
