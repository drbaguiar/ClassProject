Course Project - Getting and Cleaning Data
============
Steps to work on this course project
---------------------------

Download the data source and put into a folder on your local drive. You'll have a UCI HAR Dataset folder.

Put run_analysis.R in the parent folder of UCI HAR Dataset, then set it as your working directory using setwd() function in RStudio.

Run source("run_analysis.R"), then it will generate a new file tiny_data.txt in your working directory.

After merging testing and training, labels are added and only columns that have to do with mean and standard deviation are kept.

Finally, the script will create a tidy data set containing the means of all the columns per test subject and per activity. This tidy dataset will be written to a tab-delimited file called tidy.txt, which can also be found in this repository.

About the Code Book
--------------------
The CodeBook.md file explains the data and variables.
