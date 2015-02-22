# Codebook

## Data Source and Description

The sorce of the data and much of the data explanation come from the following source:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm. 

The set of variables that were estimated from these signals are: 

* Mean: Mean value
* Std: Standard deviation
* MeanFreq: Weighted average of the frequency components to obtain a mean frequency

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle variable (angle between two vectors):

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

Two variables measure the activity associated with the measurements and the identification number of the subject:

* Activity: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING
* Subject ID: 1 - 30

**The complete list of variables of each feature vector is below:**

1. Activity
2.	SubjectID
3.	tBodyAccMeanX
4.	tBodyAccMeanY
5.	tBodyAccMeanZ
6.	tGravityAccMeanX
7.	tGravityAccMeanY
8.	tGravityAccMeanZ
9.	tBodyAccJerkMeanX
10.	tBodyAccJerkMeanY
11.	tBodyAccJerkMeanZ
12.	tBodyGyroMeanX
13.	tBodyGyroMeanY
14.	tBodyGyroMeanZ
15.	tBodyGyroJerkMeanX
16.	tBodyGyroJerkMeanY
17.	tBodyGyroJerkMeanZ
18.	tBodyAccMagMean
19.	tGravityAccMagMean
20.	tBodyAccJerkMagMean
21.	tBodyGyroMagMean
22.	tBodyGyroJerkMagMean
23.	fBodyAccMeanX
24.	fBodyAccMeanY
25.	fBodyAccMeanZ
26.	fBodyAccMeanFreqX
27.	fBodyAccMeanFreqY
28.	fBodyAccMeanFreqZ
29.	fBodyAccJerkMeanX
30.	fBodyAccJerkMeanY
31.	fBodyAccJerkMeanZ
32.	fBodyAccJerkMeanFreqX
33.	fBodyAccJerkMeanFreqY
34.	fBodyAccJerkMeanFreqZ
35.	fBodyGyroMeanX
36.	fBodyGyroMeanY
37.	fBodyGyroMeanZ
38.	fBodyGyroMeanFreqX
39.	fBodyGyroMeanFreqY
40.	fBodyGyroMeanFreqZ
41.	fBodyAccMagMean
42.	fBodyAccMagMeanFreq
43.	fBodyBodyAccJerkMagMean
44.	fBodyBodyAccJerkMagMeanFreq
45.	fBodyBodyGyroMagMean
46.	fBodyBodyGyroMagMeanFreq
47.	fBodyBodyGyroJerkMagMean
48.	fBodyBodyGyroJerkMagMeanFreq
49.	tBodyAccStdX
50.	tBodyAccStdY
51.	tBodyAccStdZ
52.	tGravityAccStdX
53.	tGravityAccStdY
54.	tGravityAccStdZ
55.	tBodyAccJerkStdX
56.	tBodyAccJerkStdY
57.	tBodyAccJerkStdZ
58.	tBodyGyroStdX
59.	tBodyGyroStdY
60.	tBodyGyroStdZ
61.	tBodyGyroJerkStdX
62.	tBodyGyroJerkStdY
63.	tBodyGyroJerkStdZ
64.	tBodyAccMagStd
65.	tGravityAccMagStd
66.	tBodyAccJerkMagStd
67.	tBodyGyroMagStd
68.	tBodyGyroJerkMagStd
69.	fBodyAccStdX
70.	fBodyAccStdY
71.	fBodyAccStdZ
72.	fBodyAccJerkStdX
73.	fBodyAccJerkStdY
74.	fBodyAccJerkStdZ
75.	fBodyGyroStdX
76.	fBodyGyroStdY
77.	fBodyGyroStdZ
78.	fBodyAccMagStd
79.	fBodyBodyAccJerkMagStd
80.	fBodyBodyGyroMagStd
81.	fBodyBodyGyroJerkMagStd

## Data Transformations

1. Download and unzip data from: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

2. Import X_test.txt and X_train.txt data, then combine them using rbind().

3. Import features labels from features.txt, then use them as variable names for the dataset using colnames().

4. Extract only the mean, standard deviation, and mean frequency measurements from the dataset using grep() into seperate datasets, and then recombine using cbind().

5. Import the activity codes from y_test.txt and y_train.txt, then combine using rbind().

6. Import the activity names from activity_labels.txt, then use a for loop to iterate over the activity names and use gsub() to assign each activity code its proper activity name.

7. Add the activity names to the data set using cbind().

8. Import the subject identifiers from subject_test.txt and subject_train.txt, then combine using rbind().

9. Add the subject identifers to the data set using cbind().

10. Standardize the formatting of variable names and make them R-legal by first using make.names() to replace illegal characters with ".", and then use the tocamel() function from the rapport library to turn all variable names into camelCase.

11. Create a tidy data set from the data frame by using the group_by() function from the dplyr library to prepare the new data set for summary by Activity and SubjectID.

12. Report the mean for each variable by Activty and SubjectID using the summarise_each() function.

13. Export the tidy data set for use by analysts using the write.table() function.