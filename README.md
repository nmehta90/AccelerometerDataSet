# Tidying Up Accelerometer Data

This repository contains the following items:
* `run_analysis.R` script that will add labels and clean the data
* `tidyData.txt` the resulting output from the run_analysis.R script 
* `Codebook.md` a log of the variables, transformations, and data used in the run_analysis.R script 

The `run_analysis.R` script is written to take the wearables data set provided by [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and create a tidy and labeled data set with average values for each measurement taken. 

The process includes merging the given data sets, appending the labels, renaming the variable names, and outputting a usable text file. 
