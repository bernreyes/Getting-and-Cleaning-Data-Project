#Bern Reyes - Getting and Cleaning Data Course Project

setwd("C:/Users/Peesonal/Documents/Dette/Coursera/3. Data Cleaning/Week 4/Project")

#download and unzip dataset
if(!file.exists("./data")){dir.create("./data")}
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile="./data/Dataset.zip")
unzip(zipfile="./data/Dataset.zip",exdir="./data")

#load the datasets
    #training datasets
    training <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
    training_subjects <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
    training_activity <- read.table("./data/UCI HAR Dataset/train/Y_train.txt")
    
    #test datasets
    test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
    test_subjects <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
    test_activity<- read.table("./data/UCI HAR Dataset/test/Y_test.txt")

    #features & activity labels
    features <- read.table("./data/UCI HAR Dataset/features.txt")
    activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")

##Training
    #set the names of the data
    colnames(training)<-features[,2]
    colnames(training_subjects)<-"Subject"
    colnames(training_activity)<-"Activity"
    #combine training datasets
    training_data<-cbind(training_subjects,training_activity,training)
    
##Test
    #set the names of the data
    colnames(test)<-features[,2]
    colnames(test_subjects)<-"Subject"
    colnames(test_activity)<-"Activity"
    #combine test datasets
    test_data<-cbind(test_subjects,test_activity,test)
    
#combine training and test datasets using rbind
training_test<-rbind(training_data,test_data)

#get only the identifiers and mean and std from the list of features (NOT including meanFreq)
varnames<-colnames(training_test)
select_meanstd<-(grepl("Subject" , varnames) | grepl("Activity" , varnames) |
                 grepl("mean[()]" , varnames) | grepl("std.." , varnames))
data<-training_test[,select_meanstd==TRUE]

#Remove - and () characters
data_names<-colnames(data)
data_names<-gsub("mean","Mean",data_names)
data_names<-gsub("std","Std",data_names)
data_names<-gsub("-","",data_names)
data_names<-gsub("[()]","",data_names)
colnames(data)<-data_names

#replace the activity numbers with their respective activity labels
data$Activity <- factor(data$Activity, levels = activity_labels[,1], labels = activity_labels[,2])

#get the mean measurement values for each subject and each activity
tidy_data<-aggregate(. ~Subject + Activity, data,mean)

#create a text file of the tidy data
write.table(tidy_data, "Tidy_Data.txt", row.name=FALSE)