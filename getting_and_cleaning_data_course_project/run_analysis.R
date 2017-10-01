# Assuming data has been downloaded and unzipped in "UCI HAR Dataset" folder

# for melt, dcast
library(reshape2)

# Read features
features <- read.table("UCI HAR Dataset/features.txt")

# Read activity labels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

# TASK-2: Select only mean and standard deviation from featureNames
features_std_mean_indices <- grep("std|mean", features$V2)
features_std_mean_names <- features$V2[grep("std|mean", features$V2)]

# Process training data
# Loading only Std & Mean from training data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")[features_std_mean_indices]
# Load training activity labels
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
# Load subjects
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
# Combine them into one
data_train <- cbind(subject_train, y_train, x_train)

# Process testing data
# Loading only Std & Mean from training data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")[features_std_mean_indices]
# Load training activity labels
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
# Load subjects
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
# Combine them into one
data_test <- cbind(subject_test, y_test, x_test)

# TASK-1: Combine train and test
data_all <- rbind(data_train, data_test)

# TASK-4: Set appropriate labels with descriptive variable names
colnames(data_all) <- c("Subject", "Activity", as.character(features_std_mean_names))

# TASK-3: Descriptive activity names
data_all$Activity <- activity_labels[,2][match(data_all$Activity, activity_labels[,1])]

# TASK-5: Independent data with mean
data_all_melted <- melt(data_all, id = c("Subject", "Activity"))
data_all_mean <- dcast(data_all_melted, Subject + Activity ~ variable, mean)

# Publish results
write.table(data_all_mean, "tidy.txt", row.names = FALSE, quote = FALSE)