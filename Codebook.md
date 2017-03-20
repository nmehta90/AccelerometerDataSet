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

# Data Set Info

# Measurements
The following is the list of all the measurements taken in the experiment. The `run_analysis.R` script will rename these based on what is seen in the `tidyData.txt`

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The following is a list of all the variables taken per measurement

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.
