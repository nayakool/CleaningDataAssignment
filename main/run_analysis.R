library(dplyr)
trainData<-read.table("X_train.txt",sep="",header = FALSE)
testData<-read.table("X_test.txt",sep="",header = FALSE)

completedData<-rbind(testData,trainData)
featureNames<-readLines("features.txt")
featureNames<-featureNames<-sub("^[0-9]*",'\\1',featureNames)
featureNames<-trimws(featureNames,which = "left")
colnames(completeData)<-featureNames
mean_std_index<-grep("(*mean*|*std*)",featureNames)
mean_std_data<-completeData[,mean_std_index]

activityList_test<-as.numeric(readLines("y_test.txt"))
activityList_train<-as.numeric(readLines("y_train.txt"))
activityList<-c(activityList_test,activityList_train)
activityList<-as.data.frame(activityList)

subjectList_test<-as.numeric(readLines("subject_test.txt"))
subjectList_train<-as.numeric(readLines("subject_train.txt"))
subjectList<-c(subjectList_test,subjectList_train)
subjectList<-as.data.frame(subjectList)

activityLookup<-read.table("activity_labels.txt",sep = "", header = FALSE)
colnames(activityLookup)<-c('activityID','activityName')

activityNamedList<-merge(activityList,activityLookup,by.x = 'activityList',by.y = 'activityID')
mean_std_data$activity<-activityNamedList$activityName
mean_std_data$subject<-subjectList$subjectList
aggregate_tidy_data<-mean_std_data%>%group_by(activity,subject)%>%summarise_each(funs(mean))

write.table(aggregate_tidy_data,file="tidy_data.txt",row.names = FALSE)



