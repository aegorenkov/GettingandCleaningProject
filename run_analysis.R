##Run analysis on the Samsung Galaxy S Accelerometer data
library(dplyr)

activity_labels <- read.table("Data/UCI HAR Dataset/activity_labels.txt")
activityDictionary <- activity_labels$V2
names(activityDictionary) <- activity_labels$V1

features <- read.table("Data/UCI HAR Dataset/features.txt")
featureDictionary <- features$V2
names(featureDictionary) <- features$V1 

#Bind and rename Test dataset
x_test <- read.table("Data/UCI HAR Dataset/test/X_test.txt")
names(x_test) <- featureDictionary

y_test <- read.table("Data/UCI HAR Dataset/test/y_test.txt")
y_test <- y_test %>%
  rename(activity = V1) 

subject_test <- read.table("Data/UCI HAR Dataset/test/subject_test.txt")
subject_test <- subject_test %>% rename(subject = V1)

testing <- cbind(subject_test, y_test, x_test)

#Bind and rename Training dataset
x_train <- read.table("Data/UCI HAR Dataset/train/X_train.txt")
names(x_train) <- featureDictionary

y_train <- read.table("Data/UCI HAR Dataset/train/y_train.txt")
y_train <- y_train %>%
  rename(activity = V1) 

subject_train <- read.table("Data/UCI HAR Dataset/train/subject_train.txt")
subject_train <- subject_train %>% rename(subject = V1)
training <- cbind(subject_train, y_train, x_train)

#Merge Test and Training Dataset
full_set <- rbind(testing, training)

#Relabel activities with descriptive activity names
full_set$activity <- activityDictionary[full_set$activity]

#Extract mean and standard deviation for each measure
#The names in the origianl files contain ducplicates, but not among the means or
#standard deviations

mean_var_list <- features$V2[grep(pattern = 'mean\\(\\)',features$V2)] %>% unique() %>% as.character()
std_var_list <- features$V2[grep(pattern = 'std\\(\\)',features$V2)] %>% unique() %>% as.character()
var_list <- c("subject", "activity", mean_var_list, std_var_list)

tidy_data <- full_set[var_list]
#summarise each variable to show mean by subject and activity
tidy_data <- tidy_data %>% group_by(subject, activity) %>% summarise_each(funs(mean))
  
write.table(x = tidy_data, file = "tidy_data.txt", row.names = FALSE)