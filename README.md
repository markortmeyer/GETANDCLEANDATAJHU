# **Readme.md**




## **Tidy Data Study Design**
Using data from the accelerometer and gyroscope present in a Samsung Galaxy S smartphone, a recent research project numerically quantified six activities of motion (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) among a group of 30 volunteers within an age bracket of 19-48 years.  

The goal of this analysis is to create a tidy dataset from original [raw data project data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), to aid in succinctly conceptualizing how this consumer technology may be innovatively used to model everyday activities.

#### **Original Raw Smartphone Data Documentation**
[Human Activity Recognition Using Smartphones Data (HARUS) Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## **Tidy Data Preparation**
Processing of the raw dataset into the [tidy data set](https://github.com/markortmeyer/GETANDCLEANDATAJHU/HARUS_tidy.txt) is accomplished with the [run_analysis.R](https://github.com/markortmeyer/GETANDCLEANDATAJHU/run_analysis.R) script.

After retrieving and uncompressing (un-"zipping") the raw data file, data documentation files were loaded into RStudio. 

* UCI HAR Dataset/activity_labels.txt
* UCI HAR Dataset/features_labels.txt

These files contain movement labels and measured parameter names respectively.

Test and training data were then combined, creating one large, raw, dataset. 

* UCI HAR Dataset/train/subject_train.txt
* UCI HAR Dataset/train/X_train.txt
* UCI HAR Dataset/train/y_train.txt
* UCI HAR Dataset/test/subject_test.txt
* UCI HAR Dataset/test/X_test.txt
* UCI HAR Dataset/test/y_test.txt

These files contain participant identification data, measured parameter data, and activity identification data respectively.

The [tidy data set](https://github.com/markortmeyer/GETANDCLEANDATAJHU/HARUS_tidy.txt) consolidates the above raw data into a summary dataset whose rows are observations, and columns are participant, activity, and data variables.  The final tidy dataset is 180 rows x 81 columns.


#### **Data Processing** 
After importing and consolidating the raw data, [run_analysis.R](https://github.com/markortmeyer/GETANDCLEANDATAJHU/run_analysis.R) performs several steps to produce the final [tidy data set](https://github.com/markortmeyer/GETANDCLEANDATAJHU/tidy_data.txt).

* Merging of the "test" and "train" data into a data frame, is performed using "rbind()", which consolidates all observations by row. 
* cbind() is used to consolidate desired raw parameters into a smaller data frame:  Participant Identification, Participant Activity, Measured Parameter Data.
* Only parameter data representing "Mean" and "Standard Deviation" of "Participant Activity" are extracted, using "unique()" and "subset()", creating the final tidy dataframe format.
* Descriptive parameter names are then added to each column using "names()".
* Finally, the [tidy data set file](https://github.com/markortmeyer/GETANDCLEANDATAJHU/tidy_data.txt) is created using "write.table()".

The [code book](https://github.com/markortmeyer/GETANDCLEANDATAJHU/CodeBook.md) describes the variables and their units within the [tidy data set](https://github.com/markortmeyer/GETANDCLEANDATAJHU/tidy_data.txt).
