if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("reshape2")) {
  install.packages("reshape2")
}

##Set working directory to data directory
setwd('C:/Users/bryan_000/Documents/GitHub/Data/')

#Check for the directory. If not there, download the data and extract it
if (!file.exists("UCI HAR Dataset")) {
  zip.url <- 'http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
  zip.file <- 'dataset.zip'
  download.file(zip.url, destfile = zip.file)
  unzip("dataset.zip")
}

# Load the activity labels and the data column names. CLean data column names
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")[,2]
features <- read.table("UCI HAR Dataset/features.txt")[,2]
features <- tolower(features)
features <- gsub("\\(","",features)
features <- gsub("\\)","",features)
features <- gsub("-","",features)
features <- gsub(",","",features)


# Extract only the measurements on the mean and standard deviation for each measurement and clean headings
extract_features <- grepl("mean|std", features)

# Load and process X_test & y_test data.
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
names(X_test) = features

# Extract only the measurements on the mean and standard deviation for each measurement.
X_test = X_test[,extract_features]

# Load activity labels
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"

# Bind data
test_data <- cbind(as.data.table(subject_test), y_test, X_test)

# Load and process X_train & y_train data.
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
names(X_train) = features

# Extract only the measurements on the mean and standard deviation for each measurement.
X_train = X_train[,extract_features]

# Load activity data
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"

# Bind data
train_data <- cbind(as.data.table(subject_train), y_train, X_train)

# Merge test and train data
data = rbind(test_data, train_data)
id_labels   = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data      = melt(data, id = id_labels, measure.vars = data_labels)

# Apply mean function to dataset using dcast function
tidy_data   = dcast(melt_data, subject + Activity_Label ~ variable, mean)

write.table(tidy_data, file = "tidydata.txt")
