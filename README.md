
#Getting and Cleaning Data Course Project
##This file describes how run_analysis.R script works.

* First, unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and extract the following txt files into your current working directory
  1. X_train.tx
  2. X_test.txt
  3. features.txt
  4. y_test.txt
  5. y_train.txt
  6. subject_test.txt
  7. subject_train.txt
  8. activity_labels.txt
* Make sure all the above data files and run_analysis.R is in your current working directory
* Use source("run_analysis.R") command in RStudio. 
* you will find "tidy_data.txt" output file generated in the current working directory 
* Use data <- read.table("tidy_data.txt", header=TRUE) command in RStudio to read the file. Since we are required to get the average of each variable for each activity and each subject, and there are 6 activities in total and 30 subjects in total, we will notice 35 observation and 81 variabless in the final data set.
