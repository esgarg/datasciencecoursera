## Description of the R script
1. As mentioned in the README, the script assumes the data is downloaded and kept in the `UCI HAR Dataset` folder.
2. To begin with activity labels are loaded in `activity_labels` variable. This will be used when giving descriptive activity labels to the activity column.
3. Then feature names are read and only those containing std/mean are kept.
4. The training set is then read for only the std/mean features.
5. The training labels and subjects are read and combined with the training set in 4.
6. Steps 4 and 5 are repeated for the test data.
7. The training and test data sets are then merged to form one data set.
8. Descriptive column names are then given to this merged data set.
9. Descriptive activity labels are given to the activity column from the activity labels loaded in step 2.
10. Lastly, using melt and dcast, an independent data set is created with the average of each variable for each subject and each activity.
11. This independent and tidy data set in written into file `tidy.txt` described below.

## Descrption of data in tidy.txt

### Column 1: Subject
Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

### Column 2: Activity
One of the six activities(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) performed by the subjects.

### Remaining Columns: Measurements
  * tBodyAcc-mean()-X
  * tBodyAcc-mean()-Y
  * tBodyAcc-mean()-Z
  * tBodyAcc-std()-X
  * tBodyAcc-std()-Y
  * tBodyAcc-std()-Z
  * tGravityAcc-mean()-X
  * tGravityAcc-mean()-Y
  * tGravityAcc-mean()-Z
  * tGravityAcc-std()-X
  * tGravityAcc-std()-Y
  * tGravityAcc-std()-Z
  * tBodyAccJerk-mean()-X
  * tBodyAccJerk-mean()-Y
  * tBodyAccJerk-mean()-Z
  * tBodyAccJerk-std()-X
  * tBodyAccJerk-std()-Y
  * tBodyAccJerk-std()-Z
  * tBodyGyro-mean()-X
  * tBodyGyro-mean()-Y
  * tBodyGyro-mean()-Z
  * tBodyGyro-std()-X
  * tBodyGyro-std()-Y
  * tBodyGyro-std()-Z
  * tBodyGyroJerk-mean()-X
  * tBodyGyroJerk-mean()-Y
  * tBodyGyroJerk-mean()-Z
  * tBodyGyroJerk-std()-X
  * tBodyGyroJerk-std()-Y
  * tBodyGyroJerk-std()-Z
  * tBodyAccMag-mean()
  * tBodyAccMag-std()
  * tGravityAccMag-mean()
  * tGravityAccMag-std()
  * tBodyAccJerkMag-mean()
  * tBodyAccJerkMag-std()
  * tBodyGyroMag-mean()
  * tBodyGyroMag-std()
  * tBodyGyroJerkMag-mean()
  * tBodyGyroJerkMag-std()
  * fBodyAcc-mean()-X
  * fBodyAcc-mean()-Y
  * fBodyAcc-mean()-Z
  * fBodyAcc-std()-X
  * fBodyAcc-std()-Y
  * fBodyAcc-std()-Z
  * fBodyAcc-meanFreq()-X
  * fBodyAcc-meanFreq()-Y
  * fBodyAcc-meanFreq()-Z
  * fBodyAccJerk-mean()-X
  * fBodyAccJerk-mean()-Y
  * fBodyAccJerk-mean()-Z
  * fBodyAccJerk-std()-X
  * fBodyAccJerk-std()-Y
  * fBodyAccJerk-std()-Z
  * fBodyAccJerk-meanFreq()-X
  * fBodyAccJerk-meanFreq()-Y
  * fBodyAccJerk-meanFreq()-Z
  * fBodyGyro-mean()-X
  * fBodyGyro-mean()-Y
  * fBodyGyro-mean()-Z
  * fBodyGyro-std()-X
  * fBodyGyro-std()-Y
  * fBodyGyro-std()-Z
  * fBodyGyro-meanFreq()-X
  * fBodyGyro-meanFreq()-Y
  * fBodyGyro-meanFreq()-Z
  * fBodyAccMag-mean()
  * fBodyAccMag-std()
  * fBodyAccMag-meanFreq()
  * fBodyBodyAccJerkMag-mean()
  * fBodyBodyAccJerkMag-std()
  * fBodyBodyAccJerkMag-meanFreq()
  * fBodyBodyGyroMag-mean()
  * fBodyBodyGyroMag-std()
  * fBodyBodyGyroMag-meanFreq()
  * fBodyBodyGyroJerkMag-mean()
  * fBodyBodyGyroJerkMag-std()
  * fBodyBodyGyroJerkMag-meanFreq()
