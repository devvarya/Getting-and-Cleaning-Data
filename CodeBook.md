##CODEBOOK - Human Activity Recognition using Smartphones

###Feature Selection

The features selected for this data frame came from the transformation of the data in the "Human Activity Recognition Using Smartphones Dataset Version 1.0", which in turn have been taken from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years.  
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz data were captured. Look here for <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">detailed info</a>

These signals were used to estimate variables of the feature vector for each pattern('-XYZ' is used to denote 3-axial signals in the X, Y and Z directions):

-tBodyAcc-XYZ  
-tGravityAcc-XYZ  
-tBodyAccJerk-XYZ  
-tBodyGyro-XYZ  
-tBodyGyroJerk-XYZ  
-tBodyAccMag  
-tGravityAccMag  
-tBodyAccJerkMag  
-tBodyGyroMag  
-tBodyGyroJerkMag  
-fBodyAcc-XYZ  
-fBodyAccJerk-XYZ  
-fBodyGyro-XYZ  
-fBodyAccMag  
-fBodyAccJerkMag  
-fBodyGyroMag  
-fBodyGyroJerkMag  

angle(): Angle between two vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

-gravityMean  
-tBodyAccMean  
-tBodyAccJerkMean  
-tBodyGyroMean  
-tBodyGyroJerkMean  

###Feature Vector variables:

<b>mean():</b> Mean values of multiple measurements of the original variables

<b>std():</b> Standard deviation of multiple measurements of the original variables

<b>activity_id:</b> Identifier for identifying the activity of each subject type. Integer Values (1 : 6)

<b>activity_name:</b> Descriptive name of each subject's activity type. Factor Values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

<b>subject_id:</b> Identifier for identifying each subject type. Integer Values (1 : 30)