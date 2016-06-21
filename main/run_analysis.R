library(dplyr)
#Read the training and testing data sets individually
trainData<-read.table("X_train.txt",sep="",header = FALSE)
testData<-read.table("X_test.txt",sep="",header = FALSE)

#Concatenate training and testing data set to create complete data set
completeData<-rbind(testData,trainData)

#Read the feature names into a vector featureNames and clean the names to just retain 
#feature vector variable names
featureNames<-readLines("features.txt")
featureNames<-featureNames<-sub("^[0-9]*",'\\1',featureNames)
featureNames<-trimws(featureNames,which = "left")

#Assign feature vector variable names as column names to the complete data set created earlier
colnames(completeData)<-featureNames

#find the feature names representing only the mean and standard deviation 
mean_std_index<-grep("(*mean*|*std*)",featureNames)

#filter out only the feature variables representing the mean and std into a new data frame mean_std_data
mean_std_data<-completeData[,mean_std_index]

#Read the testing and training activity list and concatenate into a data frame
activityList_test<-as.numeric(readLines("y_test.txt"))
activityList_train<-as.numeric(readLines("y_train.txt"))
activityList<-c(activityList_test,activityList_train)
activityList<-as.data.frame(activityList)

#Read the testing and training subject list and concatenate into a data frame
subjectList_test<-as.numeric(readLines("subject_test.txt"))
subjectList_train<-as.numeric(readLines("subject_train.txt"))
subjectList<-c(subjectList_test,subjectList_train)
subjectList<-as.data.frame(subjectList)

#Read the activity lables as a look up data frame and assign it some column names
activityLookup<-read.table("activity_labels.txt",sep = "", header = FALSE)
colnames(activityLookup)<-c('activityID','activityName')

#Merge the activity list and activity lookup to create the named list of activity as a data frame
activityNamedList<-merge(activityList,activityLookup,by.x = 'activityList',by.y = 'activityID')

#Add named activity list and subject list to the mean_std_data data frame created earlier
mean_std_data$activity<-activityNamedList$activityName
mean_std_data$subject<-subjectList$subjectList

#Find the mean of all the feature vector variables aggredated by activity and subject 
aggregate_tidy_data<-mean_std_data%>%group_by(activity,subject)%>%summarise_each(funs(mean))

#Write the aggregated data into a tidy_data.txt file
write.table(aggregate_tidy_data,file="tidy_data.txt",row.names = FALSE)



