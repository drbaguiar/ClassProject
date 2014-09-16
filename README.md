Course Project - Getting and Cleaning Data
============
Steps to work on this course project
---------------------------

1.  The script will check for required packages and install them if needed.

2.  The script will  check for the UCI HAR Dataset directory. If the directory does not exsist, it will download the zipfile and unzip it.

3.  The script will load activity labels, data column names.  The column names will be cleaned. 

4.  The script will extract only the measurements on the mean and standard deviation for each measurement.

5.  The script will load and process the testing data.

6.  The script will load and process the training data.

7.  The script will merge testing and training data and add labels.

8.  The script will create a tidy data set a write the tidy dataset to a tab-delimited file called tidy.txt.

About the Code Book
--------------------
The CodeBook.md file explains the data and variables.