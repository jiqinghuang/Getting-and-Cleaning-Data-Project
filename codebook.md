#  CodeBook for Assignement

### 1. Describe the raw data
In total, 10,299 trial runs were carried out across the 30 test subjects performing the 6 activities. In each trial run, 561 separate measurements were recorded. The resulting data were stored in the following files:

* 'features_info.txt': Describes the 561 measurement variables

* 'features.txt': List of all measurements taken

* 'activity_labels.txt': Lists each activity

* 'train/X_train.txt': This file contains the raw training set data and is comprised of 7,352 trials with each trial having 561 separate measurements

* 'train/y_train.txt': The activity performed by each subject in the X_train.txt data set

* 'test/X_test.txt': This file contains the raw test set data and is comprised of 2,947 trials with each trial having 561 separate measurements

* 'test/y_test.txt': The activity performed by each subject in the X_test.txt data set



### 2. Transformations used to take the raw data and produce the _merged.txt_ and _merged.avg.txt_
The following transfomations has been performed to the raw data:

* Merges the training and the test sets to create one data set.

* Extracts only the measurements on the mean and standard deviation for each measurement.(_66 measurements left_)

* Uses descriptive activity names to name the activities in the data set

* Appropriately labels the data set with descriptive activity names.(_this gives merged.txt_)

* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.(_this gives merged.avg.txt_)

In order to accomplish these tasks, the "run_analysis.R" script was created. Each transformation performed is commented in the script and can be traced back to one or more of the aforementioned assessment tasks. Two important points must be addressed when reviewing the R script:

* In order to execute the R script, the working directory must be updated to reflect the location of the Samsung data files

* When extracting "...only the measurements on the mean and standard deviation for each measurement", this phrase was interpreted as only extract those columns with the literals "mean()" or "std()" somewhere in column heading. Therefore, column headings containing the literal "meanFreq" were omitted from the merged.txt.

**Ultimately, the step by step explanations are in run_analysis.R which gives more details in above transformations.**

### 3. Describe the variable in _merged.avg.txt_ file
Variables in the _tidy_ data:

1. subject integer 1-30 subjects participating to the experiment, both in test and train phases 

2. activity_label string activity performed by the subject during the experiment (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 

3. 66 measurements of the average means and standard deviations of measures recorded by a Samsung Galaxy SII worn on the waist by the participants during the activity: 3-axial linear acceleration and 3-axial angular velocity captured by the phone's embedded accelerometer and gyroscope. these are all numeric.