
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
