library(plyr)
##---------- Reading data files

data_train = read.table("C:/Users/Henry/Documents/DataScience/coursera/c03/p/data/train/X_train.txt", header = FALSE, sep = "")
activity_train=read.table("C:/Users/Henry/Documents/DataScience/coursera/c03/p/data/train/y_train.txt", header = FALSE, sep = "")
subject_train=read.table("C:/Users/Henry/Documents/DataScience/coursera/c03/p/data/train/subject_train.txt", header = FALSE, sep = "")
data_test = read.table("C:/Users/Henry/Documents/DataScience/coursera/c03/p/data/test/X_test.txt", header = FALSE, sep = "")
activity_test=read.table("C:/Users/Henry/Documents/DataScience/coursera/c03/p/data/test/y_test.txt", header = FALSE, sep = "")
subject_test=read.table("C:/Users/Henry/Documents/DataScience/coursera/c03/p/data/test/subject_test.txt", header = FALSE, sep = "")
features = read.table("C:/Users/Henry/Documents/DataScience/coursera/c03/p/data/features.txt", header = FALSE, sep = "")
activities = read.table("C:/Users/Henry/Documents/DataScience/coursera/c03/p/data/activity_labels.txt", header = FALSE, sep = "")

##----- 1. Merges the training and the test sets 
data=rbind(data_train,data_test)
activity=rbind(activity_train,activity_test)
subject=rbind(subject_train,subject_test)
rm(activity_train,data_train,subject_train,activity_test,data_test,subject_test)

#----- 2. Appropriately labels the data set with descriptive variable names. 
activity = rename(activity, c("V1"="activity"))
subject = rename(subject, c("V1"="subject"))
names(data) = features[,2]

##----- 3.Extracts only the measurements on the mean and standard deviation for each measurement. 
mean_std <- grep("-(mean|std)\\(\\)", features[, 2])
data = data[, mean_std]

##----- 4. Uses descriptive activity names to name the activities in the data set
activity[, 1] <- activities[activity[, 1], 2]

##----- 5. Merging data,activiy and subject data sets to create one tidy data set
data=cbind(subject,activity,data)
rm(activities, activity,subject,features,mean_std)

##------6. Averages by activity and subject
data_averages <- ddply(data, .(subject, activity), function(x) colMeans(x[, 3:68]))

##------7. Write data to disk
write.table(data, "C:/Users/Henry/Documents/DataScience/coursera/c03/p/data.txt", row.name=FALSE)/
write.table(data_averages, "C:/Users/Henry/Documents/DataScience/coursera/c03/p/data_averages.txt", row.name=FALSE)


