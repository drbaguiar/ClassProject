Course Project - Getting and Cleaning Data
============
Steps to work on this course project
---------------------------

Run run_analysis.R 

First it will check for required packages and install them if needed.

Next, it will check for the UCI HAR Dataset directory.  If the directory does not exsist, it will download the zipfile and unzip it.

Next, it will load activity labels, data column names and will extract only the measurements on the mean and standard deviation for each measurement.

Next, it will load and process the testing data.

Next, it will load and process the training data.

Next it will merge testing and training data and add labels that have to do with mean and standard deviation.

Finally, it will create a tidy data set containing the means of all the columns per test subject and per activity and will write the tidy dataset to a tab-delimited file called tidy.txt.

About the Code Book
--------------------
The CodeBook.md file explains the data and variables.