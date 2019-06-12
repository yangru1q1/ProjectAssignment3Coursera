
# Part one: load the datasets

## train sets, from: X_train.txt, y_train.txt, subject_train.txt
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt",
                      col.names = "labels") # set column name be "lebels"
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",
                            col.names = "subjects") # column name; "subject"

## test sets, from: X_test.txt, y_test.txt and subject_test.txt
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt",
                     col.names = "labels")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",
                           col.names = "subjects")

## column names: from features.txt
colName <- read.table("./UCI HAR Dataset/features.txt", 
                      # only take the first column from features.txt
                      # and set the type of each element be "character"
                      colClasses = c("NULL", "character"), 
                      sep = '')
## pre-processing the colName
colName <- colName[, 1] # convert into vector

## activities and labels: from activity_labels.txt
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")


# Part 2: Getting and cleaning the data

## Step 1: Merges the training and the test sets to  create one data set.
library(dplyr)
data <- rbind(cbind(X_train, y_train, subject_train),
              cbind(X_test, y_test, subject_test))
data <- tbl_df(data)
### test the performance
dim(data) # 12099 563

## step 2: Extract only the measurements on the mean and standard deviation
##         for each measurement.
### search in the colName(all measurement) with mean() or Mean() or std() or 
### Std() in side each name in all names, and return the index
selectedCol <- grep("([Mm]ean|[Ss]td)\\(\\)", colName)
### creat new data frame with only columns wanted from orignal data
selectedData <- data %>% select(c("labels", "subjects"), selectedCol)

### test
dim(selectedData) # 10299 68

## step 3: use the descriptive activity names to name the activities
### acitivity_labels contain 2 column
### the first column contains integers from 1 - 6
### the second column contains corresponding activity for each integer
selectedData$labels <- sapply(selectedData$labels, 
                              # a fiuntion with element in labels as input
                              # the output is the corresponding activity
                              function(x) filter(activity_labels, V1 == x)$V2)
### test
levels(selectedData$labels) # labels column with 6 levels

## step 4: approperiately label the data set with descriptvie varaible names
### Create a new vector called nd with all selected string with mean() and std()
### and use make.name() function to make thses strings a proper name for R
### to read
nd <- colName[selectedCol] %>% make.names()
### after checking the names in nd, understand that R replace "(", ")" and "-"
### to ".", and number of dots from 1 to 3 in each name from 1 to 3
### use sub function to get rid of these dots
nd <- gsub('(\\.){1,3}', '', nd)
### It is a little bit hard for user to check where a name is a mean of 
### standard deviation, so make it clearly by change m to .M, s to .S in
### mean and std
nd <- sub("mean", "\\.Mean", nd); nd <- sub("std", "\\.Std", nd)
### assign the name to the data set we create
names(selectedData)[-c(1, 2)] <- nd

## step 5, create a second independent tidy data set with the average of each
##         variable for each activity and each subject
library(tidyr)
result <- selectedData %>%
  gather(key=variable, value=count, -(1:2)) %>%
    group_by(labels, subjects, variable) %>%
      summarize(mean=mean(count)) %>%
        spread(variable, mean)

## write the result data set
write.table(result, "./result.txt", row.names = FALSE)

## read the file
file <- read.table("./result.txt", header = TRUE)


