## Getting and Cleaning Data - Project Readme file
==================================================

Please find the content of the Project folder:

1. README.md - contains description of the project files content and description of the steps taken 
2. codebook.md - is the codebook that describes the data set saved to "tidyData.txt".
3. run_analysis.R - is the R script that take the relevant data files from the "UCI HAR Dataset" and generates the data sets as required in the project assignment.
4. tidyData.txt - is the tidy data as required in the project assignment (output of question 5 from the project).

## Details
==========

# tidyData.txt
The data set is built from merging and sorting the data from "/UCI HAR Dataset/test/X_test.txt" and "/UCI HAR Dataset/train/X_train.txt".
The activity for which these measurements were taken for were merged and sorted from "/UCI HAR Dataset/test/y_test.txt" and "/UCI HAR Dataset/train/y_train.txt".
The data set also includes the "Subject" column indicating the ID of the subject for which the measurements for the activities were taken from.
As requested by the instruction in the project, the data columns (columns except "Subject" and "Activity") are the measurements for the "mean" and "std". Meaning that from the possible 561 features only 79 were selected.
The Columns are numbered with prefix "V". The number included in the column name is also the index of the selected feature from the original features list.
The whole data set is sorted by the subject ID (the "Subject" column).

As required in the asignment the data should be the mean for each variable selected (data column), for each subject and for each activity type.
This data set was reorganized in order to answer the requirements and therefore it was constucted in the following way.
For each subject ID there are 6 activity types (sorted for each subject) as they were defined in "activity_labels.txt".
For each activity (of each subject) each column contains the average of the measurements relating to that subject and activity.