# GettingData
Coursera Getting Data Project Submission

The run_analysis.R script retrieves a zip file with data for this project downloading it to a temp file. The source of the data is the following zip file: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Several files are unpacked from the zip file including:
 - X_train.txt        
 - y_train.txt
 - subject_train.txt
 - X_test.txt
 - y_test.txt
 - subject_test.txt
 - features.txt
 - activity_labels.txt

The script merges the train and test data along with the associated subject and activity data.The features.txt file is used 
to assign column names, and the activity_labels.txt file is used to create readable activity names.

Columns in the data associated with means and standard deviation (identified via "mean()" and "std()" respectively are 
consolidated and the result is exported into a file "tidyData.txt".
