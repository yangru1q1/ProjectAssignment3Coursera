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

One thing should be noticed is, for step 4 "Appropriately labels the data set with descriptive variable names", I used make.names() to create column names. After checking the return value of the make.names() function, I found R replace "(", ")" and "-" to dot ".", so I used sub() and gsub() function to create a more readable.

## Variables:

"activites": 6 different activities peformed by each volunteers.  
"subjects": 30 different volunteers.
All the following variable name indicate the value is the mean of corresponding feature for each subject and activity.
"fBodyAcc.MeanX" 
"fBodyAcc.MeanY" 
"fBodyAcc.MeanZ" 
"fBodyAcc.StdX" 
"fBodyAcc.StdY"  
"fBodyAcc.StdZ"   
"fBodyAccJerk.MeanX"  
"fBodyAccJerk.MeanY"    
"fBodyAccJerk.MeanZ"    
"fBodyAccJerk.StdX"     
"fBodyAccJerk.StdY"     
"fBodyAccJerk.StdZ"             
"fBodyAccMag.Mean"          
"fBodyAccMag.Std"       
"fBodyBodyAccJerkMag.Mean"    
"fBodyBodyAccJerkMag.Std"     
"fBodyBodyGyroJerkMag.Mean"  
"fBodyBodyGyroJerkMag.Std"  
"fBodyBodyGyroMag.Mean"  
"fBodyBodyGyroMag.Std"   
"fBodyGyro.MeanX"       
"fBodyGyro.MeanY"          
"fBodyGyro.MeanZ"     
"fBodyGyro.StdX"       
"fBodyGyro.StdY"    
"fBodyGyro.StdZ"           
"tBodyAcc.MeanX"    
"tBodyAcc.MeanY"       
"tBodyAcc.MeanZ"       
"tBodyAcc.StdX"            
"tBodyAcc.StdY"      
"tBodyAcc.StdZ"       
"tBodyAccJerk.MeanX"    
"tBodyAccJerk.MeanY"       
"tBodyAccJerk.MeanZ"    
"tBodyAccJerk.StdX"     
"tBodyAccJerk.StdY"    
"tBodyAccJerk.StdZ"        
"tBodyAccJerkMag.Mean"  
"tBodyAccJerkMag.Std"   
"tBodyAccMag.Mean"     
"tBodyAccMag.Std"          
"tBodyGyro.MeanX"    
"tBodyGyro.MeanY"     
"tBodyGyro.MeanZ"     
"tBodyGyro.StdX"           
"tBodyGyro.StdY"      
"tBodyGyro.StdZ"    
"tBodyGyroJerk.MeanX"    
"tBodyGyroJerk.MeanY"      
"tBodyGyroJerk.MeanZ"  
"tBodyGyroJerk.StdX"   
"tBodyGyroJerk.StdY"    
"tBodyGyroJerk.StdZ"       
"tBodyGyroJerkMag.Mean"  
"tBodyGyroJerkMag.Std"   
"tBodyGyroMag.Mean"    
"tBodyGyroMag.Std"         
"tGravityAcc.MeanX"    
"tGravityAcc.MeanY"    
"tGravityAcc.MeanZ"    
"tGravityAcc.StdX"         
"tGravityAcc.StdY"    
"tGravityAcc.StdZ"     
"tGravityAccMag.Mean"    
"tGravityAccMag.Std"  

