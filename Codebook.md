# How  `run_analysis.R` Works

`run_analysis.R` does the following 5 tasks

* Merges the two sets provided from the raw data set: train and test
* Extracts only the measurements on the mean and standard deviation for each measurement of the combined data set
* Adds descriptive names for the activities in the data
* Fixes names to be more descriptive 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject. Exports the file to a `.txt` file.
