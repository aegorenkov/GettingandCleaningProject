##run analysis on the Samsung Galaxy S Accelerometer data
library(dplyr)

activity_labels <- read.table("Data/UCI HAR Dataset/activity_labels.txt")
features <- read.table("Data/UCI HAR Dataset/features_info.txt")


#Test
x_test <- read.table("Data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("Data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("Data/UCI HAR Dataset/test/subject_test.txt")
testing <- cbind(subject_test, y_test, x_test)

#Train
x_train <- read.table("Data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("Data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("Data/UCI HAR Dataset/train/subject_train.txt")
training <- cbind(subject_train, y_train, x_train)
