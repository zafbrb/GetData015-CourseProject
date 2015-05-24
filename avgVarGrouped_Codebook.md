##Codebook for the file avgVarGrouped.txt

Created as part of course project work for for the Coursera course
Getting and Cleaning Data - getdata-014  
Created by ZAFBRB
24 May 2015

This codebook describes the structure and orgins of the variables contained in 
the file avgVarGrouped.txt and also explains the companion file 
avgVarGrouped_Dict.txt.

avgVarGrouped.txt and the file <avgVarGrouped_Dict.txt> are the result of a data extract and cleaning script called run_analysis.R. This R script does the following steps:

1. Downloads the file <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> into the working directory
2. Unpacks the file into a directory called 'UCI HAR Dataset' in the working directory
3. The 'UCI HAR Dataset' directory contains a number of files relating to the data collected for 'Human Activity Recognition Using Smartphones' experiment conducted by the following 
	Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
	Smartlab - Non Linear Complex Systems Laboratory
	DITEN - Università degli Studi di Genova.
	Via Opera Pia 11A, I-16145, Genoa, Italy.
	activityrecognition@smartlab.ws
	www.smartlab.ws
The directory contains both 'test' and 'train' data in seperate sub-directories
4. The script assembles a data file from each of the 'train' and 'test' locations, and then combines the files into a tidy data set called avgVarGrouped.txt

##avgVarGrouped.txt - variables description

Number of variables in the file = 68  
Format of file: text, with fields delimited by "" and separated by spaces

#####Subject_ID  
	A identifier of the subject who performed the experiment
	Integer - range [1 to 30]	

#####Activity.Decription
	The descriptive name of the activity performed whilst measurement was carried out
	Character - values can be one of 6  
		WALKING
		WALKING_UPSTAIRS
		WALKING_DOWNSTAIRS
		SITTING
		STANDING
		LAYING

#####AVG-tBodyAcc.mean...X	
	The average of the Mean value of X axis measurements of Body Acceleration. 
	Time domain  signals used. Averaging done by Subject ID and Activity.Description.  
	Original variable name from Source data is -- tBodyAcc-mean()-X  
	Type: numeric 

#####AVG-tBodyAcc.mean...Y	
	The average of the Mean value of Y axis measurements of Body Acceleration. Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tBodyAcc-mean()-Y
	Type: numeric 

#####AVG-tBodyAcc.mean...Z	
	The average of the Mean value of Z axis measurements of Body Acceleration. Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tBodyAcc-mean()-Z
	Type: numeric 

#####AVG-tBodyAcc.std...X	
	The average of the Standard Deviation of X axis measurements of Body Acceleration. Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tBodyAcc-std()-X
	Type: numeric 

#####AVG-tBodyAcc.std...Y	
	The average of the Standard Deviation of Y axis measurements of Body Acceleration. Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tBodyAcc-std()-Y
	Type: numeric 

#####AVG-tBodyAcc.std...Z	
	The average of the Standard Deviation of Z axis measurements of Body Acceleration. Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tBodyAcc-std()-Z
	Type: numeric 

#####AVG-tGravityAcc.mean...X	
	The average of the Mean value of X axis measurements of Gravity Acceleration. Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tGravityAcc-mean()-X
	Type: numeric 

#####AVG-tGravityAcc.mean...Y	
	The average of the Mean value of Y axis measurements of Gravity Acceleration. Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tGravityAcc-mean()-Y
	Type: numeric 

#####AVG-tGravityAcc.mean...Z	
	The average of the Mean value of Z axis measurements of Gravity Acceleration. Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tGravityAcc-mean()-Z
	Type: numeric 

#####AVG-tGravityAcc.std...X	
	The average of the Standard Deviation of X axis measurements of Gravity Acceleration. Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tGravityAcc-std()-X
	Type: numeric 

#####AVG-tGravityAcc.std...Y	
	The average of the Standard Deviation of Y axis measurements of Gravity Acceleration. Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tGravityAcc-std()-Y
	Type: numeric 

#####AVG-tGravityAcc.std...Z	
	The average of the Standard Deviation of Z axis measurements of Gravity Acceleration. Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tGravityAcc-std()-Z
	Type: numeric 

#####AVG-tBodyAccJerk.mean...X	
	The average of the Mean value of X axis measurements of Body Acceleration. Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tBodyAccJerk-mean()-X
	Type: numeric 

#####AVG-tBodyAccJerk.mean...Y	
	The average of the Mean value of Y axis measurements of Body Acceleration. Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tBodyAccJerk-mean()-Y
	Type: numeric 

#####AVG-tBodyAccJerk.mean...Z	
	The average of the Mean value of Z axis measurements of Body Acceleration. Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tBodyAccJerk-mean()-Z
	Type: numeric 

#####AVG-tBodyAccJerk.std...X	
	The average of the Standard Deviation of X axis measurements of Body Acceleration. Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tBodyAccJerk-std()-X
	Type: numeric 

#####AVG-tBodyAccJerk.std...Y	
	The average of the Standard Deviation of Y axis measurements of Body Acceleration. Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tBodyAccJerk-std()-Y
	Type: numeric 

#####AVG-tBodyAccJerk.std...Z	
	The average of the Standard Deviation of Z axis measurements of Body Acceleration. Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tBodyAccJerk-std()-Z
	Type: numeric 

#####AVG-tBodyGyro.mean...X	
	The average of the Mean value of X axis measurements of Body Gyro. Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tBodyGyro-mean()-X
	Type: numeric 

#####AVG-tBodyGyro.mean...Y	
	The average of the Mean value of Y axis measurements of Body Gyro. Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tBodyGyro-mean()-Y
	Type: numeric 

#####AVG-tBodyGyro.mean...Z	
	The average of the Mean value of Z axis measurements of Body Gyro. Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tBodyGyro-mean()-Z
	Type: numeric 

#####AVG-tBodyGyro.std...X	
	The average of the Standard Deviation of X axis measurements of Body Gyro. Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tBodyGyro-std()-X
	Type: numeric 

#####AVG-tBodyGyro.std...Y	
	The average of the Standard Deviation of Y axis measurements of Body Gyro. Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tBodyGyro-std()-Y
	Type: numeric 

#####AVG-tBodyGyro.std...Z	
	The average of the Standard Deviation of Z axis measurements of Body Gyro. Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tBodyGyro-std()-Z
	Type: numeric 

#####AVG-tBodyGyroJerk.mean...X	
	The average of the Mean value of X axis measurements of Body Gyro Jerk. Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tBodyGyroJerk-mean()-X
	Type: numeric 

#####AVG-tBodyGyroJerk.mean...Y	
	The average of the Mean value of Y axis measurements of Body Gyro Jerk. Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tBodyGyroJerk-mean()-Y
	Type: numeric 

#####AVG-tBodyGyroJerk.mean...Z	
	The average of the Mean value of Z axis measurements of Body Gyro Jerk. Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tBodyGyroJerk-mean()-Z
	Type: numeric 

#####AVG-tBodyGyroJerk.std...X	
	The average of the Standard Deviation of X axis measurements of Body Gyro Jerk. Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tBodyGyroJerk-std()-X
	Type: numeric 

#####AVG-tBodyGyroJerk.std...Y	
	The average of the Standard Deviation of Y axis measurements of Body Gyro Jerk. Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tBodyGyroJerk-std()-Y
	Type: numeric 

#####AVG-tBodyGyroJerk.std...Z	
	The average of the Standard Deviation of Z axis measurements of Body Gyro Jerk. Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tBodyGyroJerk-std()-Z
	Type: numeric 

#####AVG-tBodyAccMag.mean..	
	The average of the Mean value of  axis measurements of  magnitude of Body Acceleration . Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tBodyAccMag-mean()
	Type: numeric 

#####AVG-tBodyAccMag.std..	
	The average of the Standard Deviation of  axis measurements of  magnitude of Body Acceleration . Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tBodyAccMag-std()
	Type: numeric 

#####AVG-tGravityAccMag.mean..	
	The average of the Mean value of  axis measurements of  magnitude of Gravity Acceleration . Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tGravityAccMag-mean()
	Type: numeric 

#####AVG-tGravityAccMag.std..	
	The average of the Standard Deviation of  axis measurements of  magnitude of Gravity Acceleration . Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tGravityAccMag-std()
	Type: numeric 

#####AVG-tBodyAccJerkMag.mean..	
	The average of the Mean value of  axis measurements of  magnitude of Body Acceleration Jerk. Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tBodyAccJerkMag-mean()
	Type: numeric 

#####AVG-tBodyAccJerkMag.std..	
	The average of the Standard Deviation of  axis measurements of  magnitude of Body Acceleration Jerk. Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tBodyAccJerkMag-std()
	Type: numeric 

#####AVG-tBodyGyroMag.mean..	
	The average of the Mean value of  axis measurements of  magnitude of Body Gyro . Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tBodyGyroMag-mean()
	Type: numeric 

#####AVG-tBodyGyroMag.std..	
	The average of the Standard Deviation of  axis measurements of  magnitude of Body Gyro . Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tBodyGyroMag-std()
	Type: numeric 

#####AVG-tBodyGyroJerkMag.mean..	
	The average of the Mean value of  axis measurements of  magnitude of Body Gyro Jerk. Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tBodyGyroJerkMag-mean()
	Type: numeric 

#####AVG-tBodyGyroJerkMag.std..	
	The average of the Standard Deviation of  axis measurements of  magnitude of Body Gyro Jerk. Time domain  signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- tBodyGyroJerkMag-std()
	Type: numeric 

#####AVG-fBodyAcc.mean...X	
	The average of the Mean value of X axis measurements of Body Acceleration. Frequency domain signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- fBodyAcc-mean()-X
	Type: numeric 

#####AVG-fBodyAcc.mean...Y	
	The average of the Mean value of Y axis measurements of Body Acceleration. Frequency domain signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- fBodyAcc-mean()-Y
	Type: numeric 

#####AVG-fBodyAcc.mean...Z	
	The average of the Mean value of Z axis measurements of Body Acceleration. Frequency domain signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- fBodyAcc-mean()-Z
	Type: numeric 

#####AVG-fBodyAcc.std...X	
	The average of the Standard Deviation of X axis measurements of Body Acceleration. Frequency domain signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- fBodyAcc-std()-X
	Type: numeric 

#####AVG-fBodyAcc.std...Y	
	The average of the Standard Deviation of Y axis measurements of Body Acceleration. Frequency domain signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- fBodyAcc-std()-Y
	Type: numeric 

#####AVG-fBodyAcc.std...Z	
	The average of the Standard Deviation of Z axis measurements of Body Acceleration. Frequency domain signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- fBodyAcc-std()-Z
	Type: numeric 

#####AVG-fBodyAccJerk.mean...X	
	The average of the Mean value of X axis measurements of Body Acceleration Jerk. Frequency domain signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- fBodyAccJerk-mean()-X
	Type: numeric 

#####AVG-fBodyAccJerk.mean...Y	
	The average of the Mean value of Y axis measurements of Body Acceleration Jerk. Frequency domain signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- fBodyAccJerk-mean()-Y
	Type: numeric 

#####AVG-fBodyAccJerk.mean...Z	
	The average of the Mean value of Z axis measurements of Body Acceleration Jerk. Frequency domain signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- fBodyAccJerk-mean()-Z
	Type: numeric 

#####AVG-fBodyAccJerk.std...X	
	The average of the Standard Deviation of X axis measurements of Body Acceleration Jerk. Frequency domain signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- fBodyAccJerk-std()-X
	Type: numeric 

#####AVG-fBodyAccJerk.std...Y	
	The average of the Standard Deviation of Y axis measurements of Body Acceleration Jerk. Frequency domain signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- fBodyAccJerk-std()-Y
	Type: numeric 

#####AVG-fBodyAccJerk.std...Z	
	The average of the Standard Deviation of Z axis measurements of Body Acceleration Jerk. Frequency domain signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- fBodyAccJerk-std()-Z
	Type: numeric 

#####AVG-fBodyGyro.mean...X	
	The average of the Mean value of X axis measurements of  magnitude of Body Gyro . Frequency domain signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- fBodyGyro-mean()-X
	Type: numeric 

#####AVG-fBodyGyro.mean...Y	
	The average of the Mean value of Y axis measurements of  magnitude of Body Gyro . Frequency domain signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- fBodyGyro-mean()-Y
	Type: numeric 

#####AVG-fBodyGyro.mean...Z	
	The average of the Mean value of Z axis measurements of  magnitude of Body Gyro . Frequency domain signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- fBodyGyro-mean()-Z
	Type: numeric 

#####AVG-fBodyGyro.std...X	
	The average of the Standard Deviation of X axis measurements of  magnitude of Body Gyro . Frequency domain signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- fBodyGyro-std()-X
	Type: numeric 

#####AVG-fBodyGyro.std...Y	
	The average of the Standard Deviation of Y axis measurements of  magnitude of Body Gyro . Frequency domain signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- fBodyGyro-std()-Y
	Type: numeric 

#####AVG-fBodyGyro.std...Z	
	The average of the Standard Deviation of Z axis measurements of  magnitude of Body Gyro . Frequency domain signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- fBodyGyro-std()-Z
	Type: numeric 

#####AVG-fBodyAccMag.mean..	
	The average of the Mean value of  axis measurements of  magnitude of Body Acceleration . Frequency domain signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- fBodyAccMag-mean()
	Type: numeric 

#####AVG-fBodyAccMag.std..	
	The average of the Standard Deviation of  axis measurements of  magnitude of Body Acceleration . Frequency domain signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- fBodyAccMag-std()
	Type: numeric 

#####AVG-fBodyBodyAccJerkMag.mean..	
	The average of the Mean value of  axis measurements of  magnitude of Body Acceleration Jerk. Frequency domain signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- fBodyBodyAccJerkMag-mean()
	Type: numeric 

#####AVG-fBodyBodyAccJerkMag.std..	
	The average of the Standard Deviation of  axis measurements of  magnitude of Body Acceleration Jerk. Frequency domain signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- fBodyBodyAccJerkMag-std()
	Type: numeric 

#####AVG-fBodyBodyGyroMag.mean..	
	The average of the Mean value of  axis measurements of  magnitude of Body Gyro . Frequency domain signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- fBodyBodyGyroMag-mean()
	Type: numeric 

#####AVG-fBodyBodyGyroMag.std..	
	The average of the Standard Deviation of  axis measurements of  magnitude of Body Gyro . Frequency domain signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- fBodyBodyGyroMag-std()
	Type: numeric 

#####AVG-fBodyBodyGyroJerkMag.mean..	
	The average of the Mean value of  axis measurements of  magnitude of Body Gyro Jerk. Frequency domain signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- fBodyBodyGyroJerkMag-mean()
	Type: numeric 

#####AVG-fBodyBodyGyroJerkMag.std..	
	The average of the Standard Deviation of  axis measurements of  magnitude of Body Gyro Jerk. Frequency domain signals used. Averaging done by Subject ID and Activity.Description. Original variable name from Source data is -- fBodyBodyGyroJerkMag-std()
	Type: numeric 

