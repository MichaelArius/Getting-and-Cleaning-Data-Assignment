# The Code Book for the Dataset Created in Question 5

## Part 1: The Description for Each Variable in the Dataset

<font size="5"> 
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing 
fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.  

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

The set of variables that were estimated from these signals are:  

mean(): Mean value  
std(): Standard deviation  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  

All variables with "Acc" in its name, such as "1 tBodyAcc-mean()-X_mean", "81 tBodyAccJerk-mean()-X_mean", and "348 fBodyAccJerk-std()-X_mean" have units in standard gravity units "g". All variables with "Gyro" in its name, such as "121 tBodyGyro-mean()-X_mean", "124 tBodyGyro-std()-X_mean", and "427 fBodyGyro-std()-X_mean" have units in radians/second. 


| Column Position | Column Name | Description |
|-|-------------|-----------------|
| 1 | subject | Identifier of the subject who performed the activity |
| 2 | activity | Type of activity performed |
| 3 | 1 tBodyAcc-mean()-X_mean | Mean of the Mean of body acceleration signal in X direction (time domain) |
| 4 | 2 tBodyAcc-mean()-Y_mean | Mean of the Mean of body acceleration signal in Y direction (time domain) |
| 5 | 3 tBodyAcc-mean()-Z_mean | Mean of the Mean of body acceleration signal in Z direction (time domain) |
| 6 | 41 tGravityAcc-mean()-X_mean | Mean of the Mean of gravity acceleration signal in X direction (time domain) |
| 7 | 42 tGravityAcc-mean()-Y_mean | Mean of the Mean of gravity acceleration signal in Y direction (time domain) |
| 8 | 43 tGravityAcc-mean()-Z_mean | Mean of the Mean of gravity acceleration signal in Z direction (time domain) |
| 9 | 81 tBodyAccJerk-mean()-X_mean | Mean of the Mean of body acceleration jerk signal in X direction (time domain) |
| 10 | 82 tBodyAccJerk-mean()-Y_mean | Mean of the Mean of body acceleration jerk signal in Y direction (time domain) |
| 11 | 83 tBodyAccJerk-mean()-Z_mean | Mean of the Mean of body acceleration jerk signal in Z direction (time domain) |
| 12 | 121 tBodyGyro-mean()-X_mean | Mean of the Mean of body gyroscope signal in X direction (time domain) |
| 13 | 122 tBodyGyro-mean()-Y_mean | Mean of the Mean of body gyroscope signal in Y direction (time domain) |
| 14 | 123 tBodyGyro-mean()-Z_mean | Mean of the Mean of body gyroscope signal in Z direction (time domain) |
| 15 | 161 tBodyGyroJerk-mean()-X_mean | Mean of the Mean of body gyroscope jerk signal in X direction (time domain) |
| 16 | 162 tBodyGyroJerk-mean()-Y_mean | Mean of the Mean of body gyroscope jerk signal in Y direction (time domain) |
| 17 | 163 tBodyGyroJerk-mean()-Z_mean | Mean of the Mean of body gyroscope jerk signal in Z direction (time domain) |
| 18 | 201 tBodyAccMag-mean()_mean | Mean of the Mean of magnitude of body acceleration signals (time domain) |
| 19 | 214 tGravityAccMag-mean()_mean | Mean of the Mean of magnitude of gravity acceleration signals (time domain) |
| 20 | 227 tBodyAccJerkMag-mean()_mean | Mean of the Mean of magnitude of body acceleration jerk signals (time domain) |
| 21 | 240 tBodyGyroMag-mean()_mean | Mean of the Mean of magnitude of body gyroscope signals (time domain) |
| 22 | 253 tBodyGyroJerkMag-mean()_mean | Mean of the Mean of magnitude of body gyroscope jerk signals (time domain) |
| 23 | 266 fBodyAcc-mean()-X_mean | Mean of the Mean of body acceleration signal in X direction (frequency domain) |
| 24 | 267 fBodyAcc-mean()-Y_mean | Mean of the Mean of body acceleration signal in Y direction (frequency domain) |
| 25 | 268 fBodyAcc-mean()-Z_mean | Mean of the mean of body acceleration signal in Z direction (frequency domain) |
| 26 | 294 fBodyAcc-meanFreq()-X_mean | Mean of the Weighted average of body acceleration frequency in X direction |
| 27 | 295 fBodyAcc-meanFreq()-Y_mean | Mean of the Weighted average of body acceleration frequency in Y direction |
| 28 | 296 fBodyAcc-meanFreq()-Z_mean | Mean of the Weighted average of body acceleration frequency in Z direction |
| 29 | 345 fBodyAccJerk-mean()-X_mean | Mean of the Mean of body acceleration jerk signal in X direction (frequency domain) |
| 30 | 346 fBodyAccJerk-mean()-Y_mean | Mean of the Mean of body acceleration jerk signal in Y direction (frequency domain) |
| 31 | 347 fBodyAccJerk-mean()-Z_mean | Mean of the Mean of body acceleration jerk signal in Z direction (frequency domain) |
| 32 | 373 fBodyAccJerk-meanFreq()-X_mean | Mean of the Weighted average of body acceleration jerk frequency in X direction |
| 33 | 374 fBodyAccJerk-meanFreq()-Y_mean | Mean of the Weighted average of body acceleration jerk frequency in Y direction |
| 34 | 375 fBodyAccJerk-meanFreq()-Z_mean | Mean of the Weighted average of body acceleration jerk frequency in Z direction |
| 35 | 424 fBodyGyro-mean()-X_mean | Mean of the Mean of body gyroscope signal in X direction (frequency domain) |
| 36 | 425 fBodyGyro-mean()-Y_mean | Mean of the Mean of body gyroscope signal in Y direction (frequency domain) |
| 37 | 426 fBodyGyro-mean()-Z_mean | Mean of the Mean of body gyroscope signal in Z direction (frequency domain) |
| 38 | 452 fBodyGyro-meanFreq()-X_mean | Mean of the Weighted average of body gyroscope frequency in X direction |
| 39 | 453 fBodyGyro-meanFreq()-Y_mean | Mean of the Weighted average of body gyroscope frequency in Y direction |
| 40 | 454 fBodyGyro-meanFreq()-Z_mean | Mean of the Weighted average of body gyroscope frequency in Z direction |
| 41 | 503 fBodyAccMag-mean()_mean | Mean of the Mean of magnitude of body acceleration signals (frequency domain) |
| 42 | 513 fBodyAccMag-meanFreq()_mean | Mean of the Weighted average of body acceleration magnitude frequency |
| 43 | 516 fBodyBodyAccJerkMag-mean()_mean | Mean of the Mean of magnitude of body acceleration jerk signals (frequency domain) |
| 44 | 526 fBodyBodyAccJerkMag-meanFreq()_mean | Mean of the Weighted average of body acceleration jerk magnitude frequency |
| 45 | 529 fBodyBodyGyroMag-mean()_mean | Mean of the Mean of magnitude of body gyroscope signals (frequency domain) |
| 46 | 539 fBodyBodyGyroMag-meanFreq()_mean | Mean of the Weighted average of body gyroscope magnitude frequency |
| 47 | 542 fBodyBodyGyroJerkMag-mean()_mean | Mean of the Mean of magnitude of body gyroscope jerk signals (frequency domain) |
| 48 | 552 fBodyBodyGyroJerkMag-meanFreq()_mean | Mean of the Weighted average of body gyroscope jerk magnitude frequency |
| 49 | 4 tBodyAcc-std()-X_mean | Mean of the Standard deviation of body acceleration signal in X direction (time domain) |
| 50 | 5 tBodyAcc-std()-Y_mean | Mean of the Standard deviation of body acceleration signal in Y direction (time domain) |
| 51 | 6 tBodyAcc-std()-Z_mean | Mean of the Standard deviation of body acceleration signal in Z direction (time domain) |
| 52 | 44 tGravityAcc-std()-X_mean | Mean of the Standard deviation of gravity acceleration signal in X direction (time domain) |
| 53 | 45 tGravityAcc-std()-Y_mean | Mean of the Standard deviation of gravity acceleration signal in Y direction (time domain) |
| 54 | 46 tGravityAcc-std()-Z_mean | Mean of the Standard deviation of gravity acceleration signal in Z direction (time domain) |
| 55 | 84 tBodyAccJerk-std()-X_mean | Mean of the Standard deviation of body acceleration jerk signal in X direction (time domain) |
| 56 | 85 tBodyAccJerk-std()-Y_mean | Mean of the Standard deviation of body acceleration jerk signal in Y direction (time domain) |
| 57 | 86 tBodyAccJerk-std()-Z_mean | Mean of the Standard deviation of body acceleration jerk signal in Z direction (time domain) |
| 58 | 124 tBodyGyro-std()-X_mean | Mean of the Standard deviation of body gyroscope signal in X direction (time domain) |
| 59 | 125 tBodyGyro-std()-Y_mean | Mean of the Standard deviation of body gyroscope signal in Y direction (time domain) |
| 60 | 126 tBodyGyro-std()-Z_mean | Mean of the Standard deviation of body gyroscope signal in Z direction (time domain) |
| 61 | 164 tBodyGyroJerk-std()-X_mean | Mean of the Standard deviation of body gyroscope jerk signal in X direction (time domain) |
| 62 | 165 tBodyGyroJerk-std()-Y_mean | Mean of the Standard deviation of body gyroscope jerk signal in Y direction (time domain) |
| 63 | 166 tBodyGyroJerk-std()-Z_mean | Mean of the Standard deviation of body gyroscope jerk signal in Z direction (time domain) |
| 64 | 202 tBodyAccMag-std()_mean | Mean of the Standard deviation of magnitude of body acceleration signals (time domain) |
| 65 | 215 tGravityAccMag-std()_mean | Mean of the Standard deviation of magnitude of gravity acceleration signals (time domain) |
| 66 | 228 tBodyAccJerkMag-std()_mean | Mean of the Standard deviation of magnitude of body acceleration jerk signals (time domain) |
| 67 | 241 tBodyGyroMag-std()_mean | Mean of the Standard deviation of magnitude of body gyroscope signals (time domain) |
| 68 | 254 tBodyGyroJerkMag-std()_mean | Mean of the Standard deviation of magnitude of body gyroscope jerk signals (time domain) |
| 69 | 269 fBodyAcc-std()-X_mean | Mean of the Standard deviation of body acceleration signal in X direction (frequency domain) |
| 70 | 270 fBodyAcc-std()-Y_mean | Mean of the Standard deviation of body acceleration signal in Y direction (frequency domain) |
| 71 | 271 fBodyAcc-std()-Z_mean | Mean of the Standard deviation of body acceleration signal in Z direction (frequency domain) |
| 72 | 348 fBodyAccJerk-std()-X_mean | Mean of the Standard deviation of body acceleration jerk signal in X direction (frequency domain) |
| 73 | 349 fBodyAccJerk-std()-Y_mean | Mean of the Standard deviation of body acceleration jerk signal in Y direction (frequency domain) |
| 74 | 350 fBodyAccJerk-std()-Z_mean | Mean of the Standard deviation of body acceleration jerk signal in Z direction (frequency domain) |
| 75 | 427 fBodyGyro-std()-X_mean | Mean of the Standard deviation of body gyroscope signal in X direction (frequency domain) |
| 76 | 428 fBodyGyro-std()-Y_mean | Mean of the Standard deviation of body gyroscope signal in Y direction (frequency domain) |
| 77 | 429 fBodyGyro-std()-Z_mean | Mean of the Standard deviation of body gyroscope signal in Z direction (frequency domain) |
| 78 | 504 fBodyAccMag-std()_mean | Mean of the Standard deviation of magnitude of body acceleration signals (frequency domain) |
| 79 | 517 fBodyBodyAccJerkMag-std()_mean | Mean of the Standard deviation of magnitude of body acceleration jerk signals (frequency domain) |
| 80 | 530 fBodyBodyGyroMag-std()_mean | Mean of the Standard deviation of magnitude of body gyroscope signals (frequency domain) |
| 81 | 543 fBodyBodyGyroJerkMag-std()_mean | Mean of the Standard deviation of magnitude of body gyroscope jerk signals (frequency domain) |

## Part 2: Transformations Used to Create this Dataset from the Data Provided in the UCI HAR Dataset

Step 0: Downloading and unzipping the UCI HAR dataset  
Step 1: Tidying the test dataset  
Step 2: Tidying the train dataset  
Step 3: Merging the test and train datasets into one  
Step 4: Extracting the mean and standard deviation values  
Step 5: Using descriptive activity names to name the activities  
Step 6: Labeling the dataset with descriptive variable names  
Step 7: Creating an independent tidy data frame according to Question 5  

The details to these steps can be found in the run_analysis.R file.
</font>
