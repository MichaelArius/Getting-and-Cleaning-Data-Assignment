# Step 0: Downloading and unzipping the UCI HAR dataset -------------------

download.file(
    "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
    "Human Activity Recognition using Smartphones.zip"
)
unzip("Human Activity Recognition using Smartphones.zip")

# Step 1: Tidying the test dataset -----------------------------------------

require(dplyr, purrr)
subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
data <- read.table("./UCI HAR Dataset/test/X_test.txt")
activity <- read.table("./UCI HAR Dataset/test/y_test.txt")
test <- cbind(subject, activity, data)
# The first 3 column names in the combined data frame test are named V1, V1.1,
# and V1.2 to differentiate between the V1 column in subject, the V1 column in
# activity, and the V1 column in data after using cbind().
View(test)

# Step 2: Tidying the train dataset ----------------------------------------

subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
data <- read.table("./UCI HAR Dataset/train/X_train.txt")
activity <- read.table("./UCI HAR Dataset/train/y_train.txt")
train <- cbind(subject, activity, data)
View(train)

# Step 3: Merging the test and train datasets into one --------------------

# Checking the attributes of both data frames before combining.
head(names(test))
head(names(train))
nrow(test)
nrow(train)
# 2947 rows in test, 7352 rows in train.
ncol(test)
ncol(train)
# 563 columns in both test and train.

features <- readLines("./UCI HAR Dataset/features.txt")
head(features)
tail(features)
# There are a total of 561 features, which corresponds to the 561 columns plus a
# subject column plus an activity column; 561 + 1 + 1 = 563 columns in total.

sum(sapply(test, is.na))
sum(sapply(train, is.na))
# Both test and train do not contain NA values.

combined <- bind_rows(test, train)
View(combined)
# The original V1, V1.1, and V1.2 columns were renamed V1...1 (subject),
# V1...2 (activity), and V1...3 (first column in data) during the process of combining.

sum(nrow(test), nrow(train))
nrow(combined)
ncol(combined)
# The new data frame combined has the expected number of rows (10299, the sum of the
# rows of test and train) and columns (563, the same as test and train).

identical(nrow(combined), sum(nrow(test), nrow(train)))
# Double checking that the combined data frame has the correct number of rows.

sum(sapply(combined, is.na))
# combined does not contain any NA values, as expected.

str(combined)
# A data frame of 10299 observations of 563 variables, as expected.

# Step 4: Extracting the mean and standard deviation values ---------------

features.info <- readLines("./UCI HAR Dataset/features_info.txt")
features.info
# Reading through the features_info.txt file, I understood that the researchers use
# mean() to denote the mean of the measurements and std() to denote the standard
# deviations of the measurements.

grep("mean()", features)
grep("std()", features)
sum(length(grep("mean()", features)), length(grep("std()", features)))
# These are the indices with mean() and std() in the name. There are a total of 79
# features with mean() and std() in the names.

grep("mean()", features, value = T)
grep("std()", features, value = T)
# Reading through the names of each feature to make sure they are what I want.

features.index <- c(grep("mean()", features), grep("std()", features))
features.index <- features.index + 1 + 1
features.index <- c(1, 2, features.index)
length(features.index)
features.index
# This is the vector with the indices of the columns I want to subset from the combined
# data frame. The two +1's added to the features.index vector accounts for the first
# 2 columns, which are the subject number and activity number respectively. The
# c(1,2 ...) allows me to include the first 2 columns when I subset the combined data
# frame to pick out subject (column 1), activity (column 2), and the mean and standard
# deviation measurements (a selection of columns from 561 total columns, denoted by
# the indices in the 3rd to 81st position in the features.index vector).

combined.mean.sd <- combined[, features.index]
# This creates a new data frame with the mean and standard deviation measurements of the
# variables.
View(combined.mean.sd)
head(combined.mean.sd)
tail(combined.mean.sd)
nrow(combined.mean.sd)
ncol(combined.mean.sd)
# 10299 Observations of 81 columns (79 features + subject + activity), as expected.
names(combined.mean.sd)
# Corresponds to the features.index vector.

# Step 5: Using descriptive activity names to name the activities ---------

combined.mean.sd$V1...2
# This is the vector of activity numbers that I want to replace with descriptive names.

activity.names <- readLines("./UCI HAR Dataset/activity_labels.txt")
activity.names
# The activity_labels.txt tells me that the number 1 is used to denote walking and 2 is
# used to denote walking upstairs etc.

activity.names <- strsplit(activity.names, " ") %>%
    unlist() %>%
    .[seq(2, 12, by = 2)]
# The activity.names vector splits the original names (such as "1 WALKING" and "2 WALKING
# UPSTAIRS") by a space (" "), and selects the elements given by the index seq(2,12,by=2),
# which are the indices: 2, 4, 6, 8, 10, 12. Additional note: the strings "1", "2", ...
# "6" created by strsplit() are denoted by the odd indices, i.e. 1, 3, 5, 7, 9, 11.
activity.names
# Contains the 6 names I want, as expected.

class(combined.mean.sd$V1...2)
# The activity number is an integer vector.

table(combined.mean.sd$V1...2)
# There are 1722 observations of activity 1 (walking), 1544 observations of activity 2
# (walking upstairs) etc.

substitutions <- setNames(activity.names, seq_along(activity.names))
# This creates a named vector where 1 = "WALKING", 2 = "WALKING_UPSTAIRS" etc.
substitutions

library(purrr)
combined.mean.sd$V1...2 <- Reduce(
    function(x, y) {
        gsub(y, substitutions[y], x)
    },
    names(substitutions),
    init = combined.mean.sd$V1...2
)
# Reduce() applies the anonymous function (x,y) iteratively over the names of the
# substitution vector and replaces the numbers with the corresponding activity.

class(combined.mean.sd$V1...2)
table(combined.mean.sd$V1...2)
# The values match what was previously found when the activities were labelled as numbers.

# Step 6: Labeling the dataset with descriptive variable names -----------

features.index.original <- c(grep("mean()", features), grep("std()", features))
features.index.original
# This is the original vector with the indices of the variables with "mean()" and "std()"
# in their names, without taking account the 2 additional columns of subject and activity.

features
# A reminder that the features vector contains the names of variables from the
# features.txt file.

col.names <- features[features.index.original]
col.names
col.names <- c("subject", "activity", col.names)
# Adding the names of the first 2 columns (subject and activity).
col.names
# This is the vector of the column names of the combined.mean.sd data frame.
length(col.names)
head(col.names)
tail(col.names)
# 81 names, starting with "subject" and "activity" and ending with
# "530 fBodyBodyGyroMag-std()" and "543 fBodyBodyGyroJerkMag-std()", as expected.

combined.mean.sd <- setNames(combined.mean.sd, col.names)
# Using the setNames() function in the dplyr package to rename the columns in
# combined.mean.sd using the col.names vector.

combined.mean.sd
# This is the tidy data frame after completing questions 1 to 4 for the assignment.

# Step 7: Creating an independent tidy data frame according to Question 5 ----

combined.mean.sd <- mutate(combined.mean.sd, subject = factor(subject)) %>%
    mutate(activity = factor(activity))
# This converts the subject and activity columns in combined.mean.sd to factors.
class(combined.mean.sd$subject)
class(combined.mean.sd$activity)

grouped_data <- combined.mean.sd %>%
    # This creates a new data frame that is identical to combined.mean.sd.
    group_by(subject, activity) %>%
    # This groups the data frame by 2 factors: subject and activity.
    summarize(across(everything(), list(mean = mean)), .groups = "drop")
# This calculates the mean of all the values grouped by subject and activity across
# all 79 columns. The resulting columns would have "_mean" appended to the end of
# each column name since a list with a named function is passed to the across()
# function. The argument .groups = "drop" ungroups the resulting data frame.
View(grouped_data)
str(grouped_data)
# 180 columns (6 activities * 30 subjects) and 81 rows(activity, subject + 79
# measurements), as expected. Column names such as `1 tBodyAcc-mean()-X_mean`,
# `2 tBodyAcc-mean()-Y_mean` etc. are correct.

# Double checking with different methods.
filter(combined.mean.sd, activity == "WALKING") %>%
    group_by(subject) %>%
    summarize(mean = mean(`1 tBodyAcc-mean()-X`))
# The inefficient way.

grouped_data[grouped_data$activity == "WALKING", "1 tBodyAcc-mean()-X_mean"]
# This is the same as the inefficient way.

grouped_data
# This is the second, independent, tidy dataset that contains the average of each
# measurement for each activity and each subject, according to the requirements of
# question 5.

# For Peers Who Are Marking This Assignment -------------------------------

# Question 1 is answered in Step 3: Merging the test and train datasets into one.
# Question 2 is answered in Step 4: Extracting the mean and standard deviation values.
# Question 3 is answered in Step 5: Using descriptive activity names to name the activities.
# Question 4 is answered in Step 6: Labeling the dataset with descriptive variable names.
# Question 5 is answered in Step 7: Creating an independent tidy data frame according to Question 5.
