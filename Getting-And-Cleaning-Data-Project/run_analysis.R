library(plyr)

## 1 Merges the training and the test sets to create one data set.

x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# Merge training and test data into one dataset
xdata <- rbind(x_train, x_test)
ydata <- rbind(y_train, y_test)
subjectdata <- rbind(subject_train, subject_test)

## 2 Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("features.txt")

# Extract mean and stadard deviation columns
mean_std_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])

# Extract the desired columns
xdata <- xdata[, mean_std_features]

names(xdata) <- features[mean_std_features, 2]      # correct column name

## 3 Uses descriptive activity names to name the activities in the data set.

activities <- read.table("activity_labels.txt")

# update values with correct activity names
ydata[, 1] <- activities[ydata[, 1], 2]

names(ydata) <- "activity"      # correct column name

## 4 Appropriately labels the data set with descriptive activity names.

names(subjectdata) <- "subject"       # correct column name

merge_all_data <- cbind(xdata, ydata, subjectdata)
write.table(merge_all_data, "merged_all_data.txt")               # write out the first dataset

## 5 Creates a second independent tidy data set with the average of 
## each variable for each activity and each subject.

average_merge_all_data <- ddply(merge_all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(average_merge_all_data, "final_dataset.txt", row.name = FALSE)