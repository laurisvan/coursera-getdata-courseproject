# Getting and Cleaning Data Course Project Code Book

This dataset is a part of [Coursera Getting and Cleaning Data](https://class.coursera.org/getdata-015/) course project for tidying up the original dataset of [Human Activity Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) by UCI Machine Learning Repository.

## The Variables and Data

The original dataset contains 10299 readings with 561 attributes of 30 volunteer test subjects wearing Samsung Galaxy S II smartphone on their waist, and performing WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING activities. 3-axis linear and velocity readings have been captured in 50Hz. The original data has been pre-processed with noise and Butterworth low-pass filters. Please read full description of the original data from [the original paper](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Transformations Performed

The original data has been modified as follows:
1. The original training (7352 samples) and test data (2947 samples) have been combined together to form a single data set (10299 samples)
2. The original attribute names have been removed for their parentheses and commas to follow R norms (e.g. tBodyAcc-mean()-X becomes tBodyAcc-mean-X and angle(tBodyAccMean,gravity) becomes angle-tBodyAccMean-gravity)
3. The mean and standard deviation measurements (82 attributes) are selected from the original 561 attributes
4. A single dataset, consisting of subject number, activity label and their related mean and standard deviation measurements of sensor readings have been combined into a single table
5. The means of standard deviations and means computed for each activity of each subject.

The resulting data contains 180 rows and 84 attributes, each row containing
* Subject number (anonymous)
* Activity performed
* 82 variables of means of mean or standard deviation of sensor readings for that subject for that activity

The original accelerometer readings are labeled tAcc-XYZ and gyroscope readings t-Gyro-XYZ. The readings are normalized within [-1, 1] range. The t prefix denotes time (this is time series data with 50Hz frequency), whereas X, Y and Z denote the axes for the reading. Jerk signals (attributes with "Jerk" in their name) and magnitudes of those signals ("Mag" in their name) have been derived from their euclidenan norms.  The original paper describes the filtering as follows: "Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz." ... "Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals)."

The means of the original attributes have been calculated by averaging the readings within 2.56s (128 rading) window. It should be noted that in the new dataset, the resulting attributes are means of standard deviations and means of means.

The resulting attributes are as follows:
* subject
* activity
* tBodyAcc.mean.X
* tBodyAcc.mean.Y
* tBodyAcc.mean.Z
* tBodyAcc.std.X
* tBodyAcc.std.Y
* tBodyAcc.std.Z
* tGravityAcc.mean.X
* tGravityAcc.mean.Y
* tGravityAcc.mean.Z
* tGravityAcc.std.X
* tGravityAcc.std.Y
* tGravityAcc.std.Z
* tBodyAccJerk.mean.X
* tBodyAccJerk.mean.Y
* tBodyAccJerk.mean.Z
* tBodyAccJerk.std.X
* tBodyAccJerk.std.Y
* tBodyAccJerk.std.Z
* tBodyGyro.mean.X
* tBodyGyro.mean.Y
* tBodyGyro.mean.Z
* tBodyGyro.std.X
* tBodyGyro.std.Y
* tBodyGyro.std.Z
* tBodyGyroJerk.mean.X
* tBodyGyroJerk.mean.Y
* tBodyGyroJerk.mean.Z
* tBodyGyroJerk.std.X
* tBodyGyroJerk.std.Y
* tBodyGyroJerk.std.Z
* tBodyAccMag.mean
* tBodyAccMag.std
* tGravityAccMag.mean
* tGravityAccMag.std
* tBodyAccJerkMag.mean
* tBodyAccJerkMag.std
* tBodyGyroMag.mean
* tBodyGyroMag.std
* tBodyGyroJerkMag.mean
* tBodyGyroJerkMag.std
* fBodyAcc.mean.X
* fBodyAcc.mean.Y
* fBodyAcc.mean.Z
* fBodyAcc.std.X
* fBodyAcc.std.Y
* fBodyAcc.std.Z
* fBodyAcc.meanFreq.X
* fBodyAcc.meanFreq.Y
* fBodyAcc.meanFreq.Z
* fBodyAccJerk.mean.X
* fBodyAccJerk.mean.Y
* fBodyAccJerk.mean.Z
* fBodyAccJerk.std.X
* fBodyAccJerk.std.Y
* fBodyAccJerk.std.Z
* fBodyAccJerk.meanFreq.X
* fBodyAccJerk.meanFreq.Y
* fBodyAccJerk.meanFreq.Z
* fBodyGyro.mean.X
* fBodyGyro.mean.Y
* fBodyGyro.mean.Z
* fBodyGyro.std.X
* fBodyGyro.std.Y
* fBodyGyro.std.Z
* fBodyGyro.meanFreq.X
* fBodyGyro.meanFreq.Y
* fBodyGyro.meanFreq.Z
* fBodyAccMag.mean
* fBodyAccMag.std
* fBodyBodyAccJerkMag.mean
* fBodyBodyAccJerkMag.std
* fBodyBodyGyroMag.mean
* fBodyBodyGyroMag.std
* fBodyBodyGyroJerkMag.mean
* fBodyBodyGyroJerkMag.std
* angle.tBodyAccMean.gravity
* angle.tBodyAccJerkMean..gravityMean
* angle.tBodyGyroMean.gravityMean
* angle.tBodyGyroJerkMean.gravityMean
* angle.X.gravityMean
* angle.Y.gravityMean
* angle.Z.gravityMean

Sample results have been recorded into R readable text file [analysis.txt](analysis.txt). For instructions on reading the data, the code that produced it, and how to repeat the study, please see [README.md](README.md).



