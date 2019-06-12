# Code book for "Getting and Cleaning Date" project assingment

## Analysis Process

In the run_analysis.R script, I proform the the data cleaning in two parts. This first part is loading data sets; the second part is cleaning data using the 5 steps in course project, and get the result tidy data. 

### part one: data loading
All data sets I used during the analysis process:
1. "/UCI HAR Dataset/train/X_train.txt": training set for features
2. "/UCI HAR Dataset/train/y_train.txt": training labels for activities
3. "/UCI HAR Dataset/train/subject_train.txt": Each row identifies the subject who performed the activity for each window sample for training set. Its range is from 1 to 30. 
4. "/UCI HAR Dataset/test/X_test.txt": test set for features
5. "/UCI HAR Dataset/train/y_train.txt": test labels for activities
6. "/UCI HAR Dataset/test/subject_test.txt": Each row identifies the subject who performed the activity for each window sample for test set. Its range is from 1 to 30. 
7. "/UCI HAR Dataset/features.txt": List of all features.
8. "/UCI HAR Dataset/activity_labels.txt": Links the class labels with their activity name.
Since the required tidy data asks for column with "mean()" or "std()" contained in name, we can ignore all data sets in "intetial Signal" folder in both train and test folder.

### part two: analysis
For the full analysis process, please check the run_analysis.R script, I've wrote comments for each steps to create the required tidy data set.

One thing should be noticed is

