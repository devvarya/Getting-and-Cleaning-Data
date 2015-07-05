## Getting and Cleaning Data - COURSERA

### README for run_analysis.R

The run_analysis.R script reads data from the "Human Activity Recognition Using Smartphones Dataset Version 1.0" and produces a new tidy dataset to extract the average means and standard deviations of each variable for a given subject and activity.

###Credits

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. Smartlab - Non Linear Complex Systems Laboratory DITEN - Universit√ degli Studi di Genova. Via Opera Pia 11A, I-16145, Genoa, Italy.  
Email:<a href="activityrecognition@smartlab.ws">activityrecognition@smartlab.ws</a>  
Website:<a href="http://www.smartlab.ws">www.smartlab.ws</a>

Data can be accessed from here: <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">Human Activity Recognition Using Smartphones Dataset Version 1.0</a>

### The HAR dataset includes the following data files:

* <b>features.txt:</b> List of all features

* <b>activity_labels.txt:</b> List of class labels and their activity name

* <b>train/X_train.txt:</b> Training set

* <b>train/y_train.txt:</b> Training labels

* <b>train/subject_train.txt:</b> ID's of subjects in the training data

* <b>test/X_test.txt:</b> Test set

* <b>test/y_test.txt:</b> Test labels

* <b>test/subject_test.txt:</b> ID's of subjects in the training data


### A brief description of the script:

The run_analysis.R script merges data from a number of .txt files and produces a tidy data set for further analysis

* The script checks if the required "reshape2" package has been installed and then loads the package

* Reads all the required .txt files and labels the datasets by the columns named from the features.txt file

* The appropriate "activity_id"'s and "subject_id"'s are appended to the "test" and the "training" data, which are then combined into one single data frame

* Using the "grep" function for string matching, all the columns with mean() and std() values are extracted and then a new data frame, including only the "activity_id", the "subject_id" and the mean() and std() columns, is created

* Using the "merge" function, descriptive activity names are merged with the mean/std values dataset, to get one dataset with descriptive activity names

* Lastly, with the help of the "melt" and "dcast" functions of the "reshape2" package, the data is converted into a table containing mean values of all the included features, ordered by the activity name and the subject id, and the data is written to the "tidy_movement_data.txt" file
