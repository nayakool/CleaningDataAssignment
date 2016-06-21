# CleaningDataAssignment
##Below are the steps followed come up with the tidy data from raw sensor data
1. Read the training and testing data sets "X_train.txt and X_test.txt" individually
2. Concatenate training and testing data set to create complete data set named completeData
3. Read the feature names features.txt into a vector featureNames and clean the names to just retain feature vector variable names
4. Assign feature vector variable names as column names to the complete data set created earlier
5. Find the feature names representing only the mean and standard deviation from featureNames
6. Filter out only the feature variables representing the mean and std into a new data frame mean_std_data
7. Read the testing and training activity list "y_test.txt,y_train.txt" and concatenate into a data frame activityList
8. Read the testing and training subject list "subject_test.txt,subject_train.txt" and concatenate into a data frame subjectList
9. Read the activity lables "activity_labels.txt" as a look up data frame activityLookup and assign it some column names
10. Merge the activityList and activityLookup to create the named list of activity as a data frame activityNamedList
11. Add named activityList and subjectList to the mean_std_data data frame created earlier
12. Find the mean of all the feature vector variables aggredated by activity and subject from mean_std_data
13. Write the aggregated data into a tidy_data.txt file
