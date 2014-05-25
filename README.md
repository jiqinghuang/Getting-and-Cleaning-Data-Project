Getting-and-Cleaning-Data-Project
=================================

This is the Coursera "Cleaning Data" class's peer assessment assignment due on 26 May 2014. The assignment takes a [wearable computing machine learning dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and run a R script (run_analysis.R) to produce tidy datasets from raw data, "Human Activity Recognition Using Smartphones".

# how to use it

* Make sure you set the right work directory, and then source("run_analysis.R") command in RStudio.

*  The script will produce two new tidy data sets, either in csv file or txt file (_merged.txt_ and _merged.avg.txt_). There are 6 activities and 30 subjects in total, 

*  we have 180 rows with all combinations for each of the 66 features in merged.avg.txt. Please refer to CodeBook.md for details on the structure of the tidy datasets and also refer run_analysis.R to see the explanations of implementation.