#Coursera: Getting and Cleaning Data - Peer Assessment 
#Submitted by : Devvrat Arya

# This project is based on the publication "Human Activity Recognition on Smartphones 
# using a Multiclass Hardware-Friendly Support Vector Machine" by Davide Anguita, 
# Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz at the International
# workshop of Ambient Assisted Living in Vitoria-Gasteiz, Spain(Dec 2012)

# Check for the required package
if (!("reshape2" %in% rownames(installed.packages())) ) 
  {
  print("Please install required package \"reshape2\" before proceeding")
  } 
  else 
  {
  library(reshape2)
  
  ## Read all the required .txt files and label the datasets
  
  # Read all the activities and their names and label the respective columns 
  activity_labels <- read.table("./activity_labels.txt",col.names=c("activity_id","activity_name"))
  
  # Read the column names in the dataframe
  features <- read.table("features.txt")
  feature_names <-  features[,2]
  
  # Read the test data and label the columns of the dataframe
  testdata <- read.table("./test/X_test.txt")
  colnames(testdata) <- feature_names
  
  # Read the training data and label the columns of the dataframe
  traindata <- read.table("./train/X_train.txt")
  colnames(traindata) <- feature_names
  
  # Read the ids of the test subjects and label the columns of the dataframe
  test_subject_id <- read.table("./test/subject_test.txt")
  colnames(test_subject_id) <- "subject_id"
  
  # Read the activity id's of the test data and label the columns of the dataframe
  test_activity_id <- read.table("./test/y_test.txt")
  colnames(test_activity_id) <- "activity_id"
  
  # Read the ids of the train subjects and label the columns of the dataframe
  train_subject_id <- read.table("./train/subject_train.txt")
  colnames(train_subject_id) <- "subject_id"
  
  # Read the activity id's of the training data and label the columns of the dataframe 
  train_activity_id <- read.table("./train/y_train.txt")
  colnames(train_activity_id) <- "activity_id"
  
  # Combine the test subject id's, the test activity id's and the test data into one dataframe
  newtestdata <- cbind(test_subject_id , test_activity_id , testdata)
  
  # Combine the train subject id's, the train activity id's and the train data into one dataframe
  newtraindata <- cbind(train_subject_id , train_activity_id , traindata)
  
  # Combine the test data and the train data into one dataframe
  completedata <- rbind(newtraindata,newtestdata)
  
  # Seperating the columns refering to mean() or std() values
  meancolindex <- grep("mean",names(completedata),ignore.case=TRUE)
  meancolnames <- names(completedata)[meancolindex]
  stdcolindex <- grep("std",names(completedata),ignore.case=TRUE)
  stdcolnames <- names(completedata)[stdcolindex]
  meanstddata <-completedata[,c("subject_id","activity_id",meancolnames,stdcolnames)]
  
  # Merge the activities dataset with the mean/std values database to get one dataset with descriptive activity names
  descriptivenames <- merge(activity_labels,meanstddata,by.x="activity_id",by.y="activity_id",all=TRUE)
  
  # Breakdown the dataset with the descriptive activity names
  breakdata <- melt(descriptivenames,id=c("activity_id","activity_name","subject_id"))
  
  # Arrange this broken dataset according to the average of each variable for each activity and each subject
  meandata <- dcast(breakdata,activity_id + activity_name + subject_id ~ variable,mean)
  
  ## Create a file with the new tidy dataset
  write.table(meandata,"./tidy_movement_data.txt")
  
}