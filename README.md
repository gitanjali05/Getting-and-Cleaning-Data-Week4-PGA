# Getting-and-Cleaning-Data-Week4-PGA

This repository was created for the week 4 assignment of Getting and Cleaning Data Coursera course.
### Steps involved are:
* Download and unzip the data file into your R working directory.
* Download the R source code into your R working directory.
* Execute R source code to generate tidy data file.

## Data Described
The variables in the data X indicates the sensor signals measured with waist-mounted smartphone from 30 subjects. The variable in the data Y indicates activity type the subjects performed during recording.

## Code Explained
The code basically combines the training dataset and testing dataset,  and extracts the partial variables to create another dataset with the averages of each variable for each activity.
The new generated dataset contains variables calculated based on the mean and standard deviation. Each row is an average of each activity type.

### The code was written based on the instructions:
Read training and test dataset into R environment.
Read variable names into R envrionment.
Read subject index into R environment.

1. For merging the training and testing sets to create one data set.
Use command rbind to combine training and test set.
2. For extracting only the measurements on the mean and standard deviation for each measurement.
Use grep command to get column indexes for variable name contains "mean()" or "std()"
3. Use descriptive activity names to name the activities in the data set
Convert activity labels to characters and add a new column as factor
4. Labels the data set with descriptive variable names.
Give the selected descriptive names to variable columns
5. From the appropriatey labelled data set, creates a second, independant tidy data set with the average of each variable for each activity and each subject.
Use the pipeline command to create a new tidy dataset with command group_by and summarize_each in dplyr package.
