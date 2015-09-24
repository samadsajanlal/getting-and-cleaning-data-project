# getting-and-cleaning-data-project
## CodeBook.md

## Data
The data used for this script was originally obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones (UCI Machine Learning Repository) but adapted for the Coursera course. The coursera data can be found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The files contain data relating to an experiment that was carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a Samsung Galaxy S II smartphone on their waist. The accelerometer and gyroscope sensors of the device were used to capture 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 70% of the volunteers were selected to generate training data, while 30% generated the test data.

The features selected for the original database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

The files used from the data set are:

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


## Transformation

In order to obtain a tidy data set, the following was performed:

1) Read in the features 

2) Read in the activity labels

3) Read in the three training data files

	- These were merged together and the columns were labeled. 
	
	- The first column is activityId. 
	
	- The second column is subjectId
	
	- The remaining columns were labeled using features.txt's second column. Each column received its matching row's field from the 2nd column. So column 4 of x_train.txt received row 4 column 2 value of features.txt, column 8 received row 8 column 2 value, and so on
	
4) The same transformation was performed on the test data

5) The two data sets were merged to make one large data set

6) A logical vector was created to return TRUE for columns that had "mean" (but not meanFreq) and "std" (but not std()) values

7) The merged data set was then filtered against this logical vector in order to return only the values I am interested in

8) The activity labels were merged onto the data set from 7 by matching the activityId's

9) The column headers were cleaned up to make it a bit easier to understand what each variable is

10) To obtain the tidy data set, I removed the activity label and used the aggregate() function to collect the stats required for the project

11) The activity labels are then merged onto the tidy data set

12) The data set is written to a file called tidy2.txt


## Variables

The following variables are present in tidy2.txt

    "activityId" : the activity identifier
    "subjectId" : the participant identifier
    "timeBodyAccMagMean" : the mean value of the time for the body acceleration magnitude 
    "timeBodyAccMagStdDev" : the standard deviation of the time for the body acceleration magnitude
    "timeGravityAccMagMean" : the mean value of the time for the gravity acceleration magnitude
    "timeGravityAccMagStdDev" : the standard deviation of the time for the gravity acceleration magnitude
    "timeBodyAccJerkMagMean" : the mean value of the time for the body acceleration jerk magnitude
    "timeBodyAccJerkMagStdDev" : the standard deviation of the time for the body acceleration jerk magnitude
    "timeBodyGyroMagMean" : the mean value of the time for the body gyroscopic magnitude (angular speed)
    "timeBodyGyroMagStdDev" : the standard deviation of the time of the gyroscopic magnitude (angular speed)
    "timeBodyGyroJerkMagMean" : the mean value of the time for the body gyroscopic jerk magnitude (angular acceleration)
    "timeBodyGyroJerkMagStdDev" : the standard deviation of the time of the body gyroscopic jerk magnitude (angular acceleration)
    "freqBodyAccMagMean" : the mean frequency of the acceleration magnitude
    "freqBodyAccMagStdDev": the standard deviation of the frequency of the acceleration magnitude
    "freqBodyBodyAccJerkMagMean" : the mean frequency of the acceleration jerk magnitude
    "freqBodyBodyAccJerkMagStdDev": the standard deviation of the frequency of the acceleration jerk magnitude
    "freqBodyBodyGyroMagMean" : the mean frequency of the gyroscopic magnitude (angular speed)
    "freqBodyBodyGyroMagStdDev": the standard deviation of the frequency of the gyroscopic magnitude (angular speed)
    "freqBodyBodyGyroJerkMagMean" : the mean frequency of the gyroscopic jerk magnitude (angular acceleration)\
    "freqBodyBodyGyroJerkMagStdDev": the standard deviation of the frequency of the gyroscopic jerk magnitude (angular acceleration)
    "activityLabels" : the activity that was performed
