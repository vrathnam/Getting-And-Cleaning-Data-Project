# Getting and Cleaning Data Course Project CodeBook

## Data Source

This dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" which was originally made avaiable here:
(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


## Variables Description

- x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the zip file
  (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )
- xdata, ydata and subjectdata merge the above datasets for further analysis.
- features contains the correct names for the xdata dataset, which are applied to the column names stored in mean_std_features, a numeric vector used to extract
  the desired data.
- A similar approach is taken with activity names through the activities variable.
- merge_all_data merges xdata, ydata and subjectdata in a big dataset that is used to create the final main dataset.
- ddply() from the plyr package is used to average the relevent columns using colMeans().
- average_merge_all_data is the main final dataset that has all the relevant column avearges and this dataset is saved as final_dataset.txt.


## Code Methodology 

1. x_train, y_train, x_test, y_test, subject_train and subject_test are merged using the rbind() function. 
2. Columns with the mean and standard deviation were extracted from the "features" table which was then merged with xdata to get proper xdata and corresponding 
   nomenclature. 
3. As "activity" data is addressed with values 1:6, we take the activity names and IDs from activity_labels.txt and they are merged with the dataset.
4. cbind() function is then used to merge all data frames (xdata, ydata, subjectdata) columnwise.
5. New dataset is created with all the average measures for each subject and activity type (180 ROWS = 30 subjects * 6 activities). 
6. ddply() from the plyr package is used to average the relevent columns using colMeans().
7. The main final dataset file is called final_dataset.txt.