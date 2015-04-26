# GettingandCleaningProject
##Course project for the JHU/coursera Getting and Cleaning Data class

The script does not solve all of the project requirement step by step. Instead it fills each requirement out of order because it make the program simpler.

We first load in labels for activities and variable names for later use.

We then load in the files x_test.txt, y_test.txt, subject_test.txt, x_train.txt, y_train.txt, and subject_train.txt. We rename each of the variables based on the labels found in features.txt and then column bind the test and training sets respectively.

We then merge/rbind the training and test sets together so we can have all of the information organized in one table identified by "subject" and "activity" with the measurements in wide form.

We use the data from activity_labels.txt to relabel the activities column from a set of intergers 1-6, the descriptive labels such as "walking". 

From this single table, we select only variables that measure mean and standard deviation and our identifying columns, "subject" and "activity". In other words, we keep features that are labelled with "mean()" or "std()".

Every row corresponds to precisely one activity done by a single person, so we have a tidy data form and export it to the file tidy_data.txt
