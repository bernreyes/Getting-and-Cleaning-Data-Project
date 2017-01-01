This includes the summary of the data, variables, and data transformations to create the tidy data.

###Data Source

The data used in this project is downloaded from the https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
It contains the files of activity labels, features, information about the features file, and README. The downloaded data also contains the train and test folders with their respective data sets. Further details about the dataset is located in http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

###Variables

The raw datasets have the following variables that indicates the Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration and the Triaxial Angular velocity from the gyroscope.
-	tBodyAcc-XYZ
-	tGravityAcc-XYZ
-	tBodyAccJerk-XYZ
-	tBodyGyro-XYZ
-	tBodyGyroJerk-XYZ
-	tBodyAccMag
-	tGravityAccMag
-	tBodyAccJerkMag
-	tBodyGyroMag
-	tBodyGyroJerkMag
-	fBodyAcc-XYZ
-	fBodyAccJerk-XYZ
-	fBodyGyro-XYZ
-	fBodyAccMag
-	fBodyAccJerkMag
-	fBodyGyroMag
-	fBodyGyroJerkMag

For the variables, the following estimates were presented:
-	mean(): Mean value
-	std(): Standard deviation
-	mad(): Median absolute deviation 
-	max(): Largest value in array
-	min(): Smallest value in array
-	sma(): Signal magnitude area
-	energy(): Energy measure. Sum of the squares divided by the number of values. 
-	iqr(): Interquartile range 
-	entropy(): Signal entropy
-	arCoeff(): Autorregresion coefficients with Burg order equal to 4
-	correlation(): correlation coefficient between two signals
-	maxInds(): index of the frequency component with largest magnitude
-	meanFreq(): Weighted average of the frequency components to obtain a mean frequency
-	skewness(): skewness of the frequency domain signal 
-	kurtosis(): kurtosis of the frequency domain signal 
-	bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
-	angle(): Angle between to vectors

From the set of variables, only mean and standard deviation were extracted and to be used for the tidy data. Finally, the mean value of the measurements per subject and activity were computed to create the tidy data set.


###Data Transformation Process
Here are the steps to create the required tidy data:
- Download and unzip the data set in the working directory
- Load the training and test data sets, the variable names from features file and the description of activities from the activity labels file.
- Set the column names of the datasets (measurement, subject, activity) and combine them using cbind function for both training and test sets
- Combine the training and test data sets using cbind
- Select only the column names from the training-test dataset that indicate the subject and activity identifiers and the mean and standard deviation from the list of features.
- Label the activity numbers in the combined training-test dataset using the activity_label file.
- Aggregate the data by subject and activity and compute the mean values of the measurements.
- Create a text file of the tidy data using write.table() function 

