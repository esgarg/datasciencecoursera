## Getting and Cleaning Data: Course Project

**Assumption 1:** Data is downloaded and available in `UCI HAR Dataset` folder.

**Assumption 2:** Library `reshape2` is available.

The script does the following: 

1. Reads feature names of std and mean measurements
2. Reads activity labels
3. Reads training data for selected feature measurements, reads labels and subjects
4. Repeats 3 for test data
5. Merges 3 and 4 into a single table
6. Assigns descriptive variable names to columns
7. Assigns descriptive activity names to the activity column
8. Creates a tidy data with mean of all selected measurements for each subject and each activity
