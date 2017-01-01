Getting and Cleaning Data Course Project aims to evaluate the students’ ability to collect and clean a data set.

The submitted files for this course project are the following:
-README.md
-CodeBook.md
-run_analysis.R
-tidy_data.txt

###README.md 
-includes the basic information about the scripts used in this project and how they are connected.

###CodeBook.md 
-consists of the information about the data, variables, and data transformations. Specific details about the data cleaning and creating tidy data are explained in this script.

###run_analysis.R
-includes the R codes on how to download and unzip the datasets, merge the training and test datasets, properly label the data measurements, extracting only the variables about means and standard deviations, and write the tidy data into text file.

###tidy_data.txt 
-the created text file of the tidy data using write.table() function that shows the average values of the measurements’ means and standard deviation for each subject and activity. There are 180 observations (30 subjects and 6 activities each subject) in the tidy_data with 68 column variables (2 identifiers –Subject and Activity, 66 columns about means and standard deviation of the features). The MeanFreq of the features were not considered in the data cleaning since only the mean and standard deviation of the features were required.
