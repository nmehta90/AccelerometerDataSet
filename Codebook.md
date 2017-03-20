# How  `run_analysis.R` Works

`run_analysis.R` does the following 5 tasks

* Merges the two sets provided from the raw data set: train and test
* Extracts only the measurements on the mean and standard deviation for each measurement of the combined data set
* Adds descriptive names for the activities in the data
* Fixes names to be more descriptive 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject. Exports the file to a `.txt` file.

# Variables

* `dataURL` contains the URL where the data can be found
* `features_table`, `activities_table`, `x_train_table`, `x_test_table`, `y_train_table`, `y_test_table`, `subject_test_table`, `subject_train_table` are variables that describe the various imported data
* `train_data` and `test_data` are the merged train and test data sets and `complete_data` is the full data set containing both train and test.
* `mean_std_logic_vector` applies the logic to search for mean and std vectors and `mean_std_dataset` is a table containing only those columns
* `mean_std_set_with_activity label` and `complete_data_set_with_activityLabel` are the complete data sets and mean/std sets with activity labels appended to them
* `tidyData` is the cleaned data set with the columns renamed and only mean values for each activity/subject. 
