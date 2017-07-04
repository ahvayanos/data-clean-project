                                     DATA DICTIONARY - Wearable Data

Sample-Type:
    - test: data collected from the test participants
    - train: data collected from the training participants
    
Subject: Id of the particular study participant. There are 30 participants in total, each assigned an identity
between 1 and 30

Activity: Identifies the specific activity the participants was engaged in when the data were collected.
Options are:
      - Laying
      - Sitting
      - Standing
      - Walking
      - Walking Downstairs
      - Walking Upstairs

signals were used to estimate variables of the feature vector for each pattern. 
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. For variable labeled
as XYZ, there are separate columns for each dimension. In total, there are 8 x 3 + 9 = 33 variables:

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

The set of variables that were estimated for each of these signals are below.
In total, there are 17 signals, so there are 33 x 17 = 561

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

The complete list of variables of each feature vector is available in 'features.txt'

Additional vectors obtained by averaging the signals in a time window sample were also included:

Body acceleration - XYZ
Body gyro - XYZ
Total acceleration - XYZ

For each of these the file includes 128 measurements corresponding to different time windows.
Each time sample is provided as a separate column.
In total there are: 3 (variables) x 3 (dimensions) x 128 = 1,152 columns

In total, the file includes: 3 + 561 + 1,152 = 1,716 columns


