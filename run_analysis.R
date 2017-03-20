#0. Download all the data and place into data directory
##############################################

if(!file.exists("./data")) {dir.create("./data")}
dataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(dataURL, destfile = "./data/Dataset.zip")
unzip("./data/Dataset.zip", exdir ="./data")

#1. Merge the train and test data sets
##############################################

#Pull lables and features
features_table <- read.table("./data/UCI HAR Dataset/features.txt")
activities_table <-read.table("./data/UCI HAR Dataset/activity_labels.txt")
#Pull train data
x_train_table <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train_table <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train_table <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
#Pull test data
x_test_table <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test_table <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test_table <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

#Set column names of test and train set
colnames(x_train_table) <- features_table[,2]
colnames(y_train_table) <- "activityID"
colnames(subject_train_table) <- "subjectID"
colnames(x_test_table) <- features_table[,2]
colnames(y_test_table) <- "activityID"
colnames(subject_test_table) <- "subjectID"

colnames(activities_table) <- c("activityID", "activity")
#Merge all the data
train_data <- cbind(x_train_table, y_train_table, subject_train_table)
test_data <- cbind(x_test_table, y_test_table, subject_test_table)
complete_data <- rbind(train_data, test_data)

#2. Extract only the measurements on the mean and standard deviation for each measurement
##############################################
measurementNames <- colnames(complete_data)

mean_std_logic_vector <- (grepl("activityID", measurementNames) | grepl("subjectID", measurementNames) |
                            grepl("mean..", measurementNames) | grepl("std..", measurementNames))

mean_std_dataset <- complete_data[,mean_std_logic_vector == TRUE]

#3. Use descriptive activity names to name the activities in the data set
##############################################

mean_std_with_activity_label <- merge(mean_std_dataset, activities_table, by= 'activityID', all.x = TRUE)
complete_data_set_with_activityLabel <- merge(complete_data, activities_table, by ='activityID', all.x = TRUE)

#4.Appropriately label the data set with descriptive variable names
##############################################

#Use gsub to replace string values
colnames(complete_data_set_with_activityLabel) <- gsub("\\()","", colnames(complete_data_set_with_activityLabel))
colnames(complete_data_set_with_activityLabel) <- gsub("Acc", "Acceleration", colnames(complete_data_set_with_activityLabel))
colnames(complete_data_set_with_activityLabel) <- gsub("Mag", "Magnitude", colnames(complete_data_set_with_activityLabel))
colnames(complete_data_set_with_activityLabel) <- gsub("Gyro", "AngularSpeed", colnames(complete_data_set_with_activityLabel))
colnames(complete_data_set_with_activityLabel) <- gsub("^t", "TimeDomain.", colnames(complete_data_set_with_activityLabel))
colnames(complete_data_set_with_activityLabel) <- gsub("^f", "FrequnecyDomain.", colnames(complete_data_set_with_activityLabel))
colnames(complete_data_set_with_activityLabel) <- gsub("\\.mean", "Mean", colnames(complete_data_set_with_activityLabel))
colnames(complete_data_set_with_activityLabel) <- gsub("\\.std", "StandardDev", colnames(complete_data_set_with_activityLabel))

#5 From the data set created in step 4 create a second independent tidy data set with the average for each variable for
#  each activity and each subject. 

#Use aggregate to apply mean function across data and then order by activity and subjectID
tidyData <- aggregate(. ~subjectID + activity, complete_data_set_with_activityLabel, mean)
tidyData <- tidyData[order(tidyData$subjectID, tidyData$activity)]

#Write data to txt file in working directory
write.table(tidyData, file = "tidyData.txt", append = FALSE, row.names = FALSE, col.names = TRUE)




                        

