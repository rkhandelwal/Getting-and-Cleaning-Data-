## This README file describes the workings of the run_analysis.R script and how to use it


###########
# Input data set
The input dataset includes the following files:
=========================================
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for 
   each window sample. Its range is from 1 to 30. 


###########
# Helper Function - BuildTrainingSet()
  Training data frame is built from three files as follows
  1. X_train.txt - contains training set (dim - 7352 x 561)
  2. y_train.txt - training labels (dim - 7352 x 1)
  3. subject_train.txt - Each row identifies the subject who performed the activity for (dim 7352 x 1)
 The resulting training data frame as assembled as show in the picture below, with a dim of 7352 x 563
-------------------------------------------------------------------------
| subject | y_train |  features.txt has column names                     |
-------------------------------------------------------------------------
|         |         | X_train - 561 columns                              |
|         |         |                                                    |
|         |         |                                                    |
|         |         |                                                    |
|         |         |                                                    |
|         |         |                                                    |   
|         |         |                                                    |
|         |         |                                                    |
|         |         |                                                    |
|         |         |                                                    |
|         |         |                                                    |
|         |         |                                                    |
|         |         |                                                    |
|         |         |                                                    |
|         |         |                                                    |
|         |         |                                                    |
|         |         |                                                    |
|         |         |                                                    |
| 7352x1  | 7352x1  |       7352x561 rows                                |(7352x563)
--------------------------------------------------------------------------



###########
# Helper Function - BuildTestSet()
  Test data frame is built from three files as follows
  1. X_test.txt - contains training set (dim - 2947 x 561)
  2. y_test.txt - training labels (dim - 2947 x 1)
  3. subject_test.txt - Each row identifies the subject who performed the activity for (dim 2947 x 1)
 The resulting test data frame as assembled as show in the picture below, with a dim of 2947 x 563
-------------------------------------------------------------------------
| subject | y_test  |  features.txt has column names                     |
-------------------------------------------------------------------------
|         |         | X_test  - 561 columns                              |
|         |         |                                                    |
|         |         |                                                    |
|         |         |                                                    |
|         |         |                                                    |
|         |         |                                                    |
|         |         |                                                    |
| 2947x1  | 2947x1  |       2947x561 rows                                |(2947x563)
--------------------------------------------------------------------------



###########################################
# main function - The main function does tha data manipulation in order to generate a tidy
#                 data frame
########### 
# Step 1: Create Merged data from training set and test set
The two data frames above are merged together in step 1 using rbind function.
the resultant data frame dimension is 10299 rows  x 563 columns


###########
# Step 2 - Extract only the measurements on the mean and standard deviation for each measurement
In this step, we replace the default column names such as V1, V2, V3 with the actual variable
names defined in features.txt file.

We also clean up some of the variable names here and then select only those columns that calculate 
mean() or std()

After the clean-up, we are left with a data frame of dimension of 10299 rows x 81 columns


###########
# Step 3 - Uses descriptive activity names to name the activities in the data set
In this step, we replace the activity code with activity lables defined in file activity_labels.txt
The labels defined are - WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING


###########
# Step 4 - Appropriately labels the data set with descriptive variable names.
In this step, we clean up some more variable names


###########
# Step 5 - From the data set in step 4, creates a second independent tidy data set with the average 
           of variable for each activity and each subject. 
For this step, we use the ddply function defined in "plyr" library. This function groups the data by
Subject and activity and calculates mean for all the remaing columns as shown here
The resulting tidy data frame is of dimension 180 x 81 variables. In this step we also create an
output file "sample.txt" in the current folder.



##########################################
# How to run the script
##########################################
1. set the current working dir to where the "UCI HAR Dataset" is stored, such as

    setwd("~/mydir/Courses/3. Getting and Cleaning Data/CourseProject/UCI HAR Dataset")

2. source("run_analysis.R")

3. tidy object is created in 'tdf'. To see first 5 columns of this data frame, type

> tdf[,1:5]
    Subject           Activity tBodyAcc_mean_X tBodyAcc_mean_Y tBodyAcc_mean_Z
1         1             LAYING       0.2216100    -0.040501260     -0.11314200
2         1            SITTING       0.2613021    -0.001319298     -0.10458936
3         1           STANDING       0.2789245    -0.016137925     -0.11053774
4         1            WALKING       0.2773474    -0.017385253     -0.11113474
5         1 WALKING_DOWNSTAIRS       0.2891633    -0.009919837     -0.10749388
6         1   WALKING_UPSTAIRS       0.2554340    -0.023958887     -0.09737170
7         2             LAYING       0.2814167    -0.018157500     -0.10722708
8         2            SITTING       0.2770435    -0.015678913     -0.10923043
9         2           STANDING       0.2778519    -0.018419630     -0.10591296
10        2            WALKING       0.2764237    -0.018588746     -0.10547966
11        2 WALKING_DOWNSTAIRS       0.2776596    -0.022665745     -0.11678085
12        2   WALKING_UPSTAIRS       0.2471437    -0.021399604     -0.15253333
13        3             LAYING       0.2755000    -0.018951935     -0.10133694
14        3            SITTING       0.2572808    -0.003509423     -0.09830769
15        3           STANDING       0.2799672    -0.014332295     -0.10161915
16        3            WALKING       0.2755690    -0.017171879     -0.11266448
17        3 WALKING_DOWNSTAIRS       0.2924490    -0.019356714     -0.11616694
18        3   WALKING_UPSTAIRS       0.2607610    -0.032420898     -0.11002576



4. To see the structure of the tidy data frame, type 
> str(tdf)
'data.frame':	180 obs. of  81 variables:
 $ Subject                      : int  1 1 1 1 1 1 2 2 2 2 ...
 $ Activity                     : chr  "LAYING" "SITTING" "STANDING" "WALKING" ...
 $ tBodyAcc_mean_X              : num  0.222 0.261 0.279 0.277 0.289 ...
 $ tBodyAcc_mean_Y              : num  -0.0405 -0.00132 -0.01614 -0.01739 -0.00992 ...
 $ tBodyAcc_mean_Z              : num  -0.113 -0.105 -0.111 -0.111 -0.107 ...
 $ tBodyAcc_std_X               : num  -0.928 -0.9773 -0.9958 -0.2837 0.0301 ...
 $ tBodyAcc_std_Y               : num  -0.8369 -0.9227 -0.9732 0.1144 -0.0319 ...
 $ tBodyAcc_std_Z               : num  -0.826 -0.94 -0.98 -0.26 -0.23 ...
 $ tGravityAcc_mean_X           : num  -0.249 0.832 0.943 0.935 0.932 ...
 $ tGravityAcc_mean_Y           : num  0.706 0.204 -0.273 -0.282 -0.267 ...
 $ tGravityAcc_mean_Z           : num  0.4458 0.332 0.0135 -0.0681 -0.0621 ...
 $ tGravityAcc_std_X            : num  -0.897 -0.968 -0.994 -0.977 -0.951 ...
 $ tGravityAcc_std_Y            : num  -0.908 -0.935 -0.981 -0.971 -0.937 ...
 $ tGravityAcc_std_Z            : num  -0.852 -0.949 -0.976 -0.948 -0.896 ...
 $ tBodyAccJerk_mean_X          : num  0.0811 0.0775 0.0754 0.0741 0.0542 ...
 $ tBodyAccJerk_mean_Y          : num  0.003834 -0.000633 0.007979 0.028288 0.029671 ...
 $ tBodyAccJerk_mean_Z          : num  0.01084 -0.00334 -0.00368 -0.00412 -0.01097 ...
 $ tBodyAccJerk_std_X           : num  -0.9585 -0.9864 -0.9946 -0.1136 -0.0123 ...
 $ tBodyAccJerk_std_Y           : num  -0.924 -0.981 -0.986 0.067 -0.102 ...
 $ tBodyAccJerk_std_Z           : num  -0.955 -0.988 -0.992 -0.503 -0.346 ...
 $ tBodyGyro_mean_X             : num  -0.0166 -0.0453 -0.024 -0.0418 -0.035 ...
 $ tBodyGyro_mean_Y             : num  -0.0645 -0.0919 -0.0594 -0.0695 -0.0909 ...
 $ tBodyGyro_mean_Z             : num  0.1487 0.0629 0.0748 0.0849 0.09 ...
 $ tBodyGyro_std_X              : num  -0.874 -0.977 -0.987 -0.474 -0.458 ...
 $ tBodyGyro_std_Y              : num  -0.9511 -0.9665 -0.9877 -0.0546 -0.1263 ...
 $ tBodyGyro_std_Z              : num  -0.908 -0.941 -0.981 -0.344 -0.125 ...
 $ tBodyGyroJerk_mean_X         : num  -0.1073 -0.0937 -0.0996 -0.09 -0.074 ...
 $ tBodyGyroJerk_mean_Y         : num  -0.0415 -0.0402 -0.0441 -0.0398 -0.044 ...
 $ tBodyGyroJerk_mean_Z         : num  -0.0741 -0.0467 -0.0489 -0.0462 -0.0271 ...
 $ tBodyGyroJerk_std_X          : num  -0.919 -0.992 -0.993 -0.207 -0.487 ...
 $ tBodyGyroJerk_std_Y          : num  -0.968 -0.99 -0.995 -0.304 -0.239 ...
 $ tBodyGyroJerk_std_Z          : num  -0.958 -0.988 -0.992 -0.404 -0.269 ...
 $ tBodyAccMag_mean             : num  -0.8419 -0.9486 -0.9843 -0.137 0.0272 ...
 $ tBodyAccMag_std              : num  -0.7951 -0.9271 -0.982 -0.2197 0.0199 ...
 $ tGravityAccMag_mean          : num  -0.8419 -0.9486 -0.9843 -0.137 0.0272 ...
 $ tGravityAccMag_std           : num  -0.7951 -0.9271 -0.982 -0.2197 0.0199 ...
 $ tBodyAccJerkMag_mean         : num  -0.9544 -0.9873 -0.9923 -0.1414 -0.0894 ...
 $ tBodyAccJerkMag_std          : num  -0.9283 -0.9841 -0.9931 -0.0745 -0.0258 ...
 $ tBodyGyroMag_mean            : num  -0.8747 -0.9309 -0.9765 -0.161 -0.0757 ...
 $ tBodyGyroMag_std             : num  -0.819 -0.935 -0.979 -0.187 -0.226 ...
 $ tBodyGyroJerkMag_mean        : num  -0.963 -0.992 -0.995 -0.299 -0.296 ...
 $ tBodyGyroJerkMag_std         : num  -0.936 -0.988 -0.995 -0.325 -0.307 ...
 $ fBodyAcc_mean_X              : num  -0.9392 -0.9796 -0.9953 -0.2028 0.0382 ...
 $ fBodyAcc_mean_Y              : num  -0.86706 -0.94415 -0.97706 0.08971 0.00152 ...
 $ fBodyAcc_mean_Z              : num  -0.883 -0.959 -0.985 -0.332 -0.226 ...
 $ fBodyAcc_std_X               : num  -0.9245 -0.9764 -0.9959 -0.3191 0.0243 ...
 $ fBodyAcc_std_Y               : num  -0.834 -0.917 -0.972 0.056 -0.113 ...
 $ fBodyAcc_std_Z               : num  -0.813 -0.935 -0.978 -0.28 -0.298 ...
 $ fBodyAcc_meanFreq_X          : num  -0.1588 -0.0495 0.0865 -0.2075 -0.3074 ...
 $ fBodyAcc_meanFreq_Y          : num  0.0976 0.076 0.1175 0.1131 0.0632 ...
 $ fBodyAcc_meanFreq_Z          : num  0.0895 0.2389 0.2449 0.0497 0.2943 ...
 $ fBodyAccJerk_mean_X          : num  -0.9571 -0.9866 -0.9947 -0.1705 -0.0277 ...
 $ fBodyAccJerk_mean_Y          : num  -0.9224 -0.9817 -0.9854 -0.0352 -0.1287 ...
 $ fBodyAccJerk_mean_Z          : num  -0.948 -0.986 -0.991 -0.469 -0.288 ...
 $ fBodyAccJerk_std_X           : num  -0.9642 -0.9874 -0.995 -0.1336 -0.0863 ...
 $ fBodyAccJerk_std_Y           : num  -0.932 -0.983 -0.987 0.107 -0.135 ...
 $ fBodyAccJerk_std_Z           : num  -0.961 -0.988 -0.992 -0.535 -0.402 ...
 $ fBodyAccJerk_meanFreq_X      : num  0.132 0.257 0.314 -0.209 -0.253 ...
 $ fBodyAccJerk_meanFreq_Y      : num  0.0245 0.0476 0.0392 -0.3862 -0.3376 ...
 $ fBodyAccJerk_meanFreq_Z      : num  0.0244 0.0924 0.1386 -0.1855 0.0094 ...
 $ fBodyGyro_mean_X             : num  -0.85 -0.976 -0.986 -0.339 -0.352 ...
 $ fBodyGyro_mean_Y             : num  -0.9521 -0.9758 -0.989 -0.103 -0.0557 ...
 $ fBodyGyro_mean_Z             : num  -0.9093 -0.9513 -0.9807 -0.256 -0.0319 ...
 $ fBodyGyro_std_X              : num  -0.882 -0.978 -0.988 -0.517 -0.495 ...
 $ fBodyGyro_std_Y              : num  -0.9512 -0.9624 -0.9871 -0.0335 -0.1815 ...
 $ fBodyGyro_std_Z              : num  -0.917 -0.944 -0.982 -0.437 -0.238 ...
 $ fBodyGyro_meanFreq_X         : num  -0.00351 0.18918 -0.12028 0.01481 -0.10048 ...
 $ fBodyGyro_meanFreq_Y         : num  -0.0915 0.0631 -0.0447 -0.0658 0.0825 ...
 $ fBodyGyro_meanFreq_Z         : num  0.010466 -0.029815 0.100596 0.000775 -0.075688 ...
 $ fBodyAccMag_mean             : num  -0.8617 -0.9478 -0.9854 -0.1286 0.0966 ...
 $ fBodyAccMag_std              : num  -0.798 -0.928 -0.982 -0.398 -0.187 ...
 $ fBodyAccMag_meanFreq         : num  0.0864 0.2367 0.2846 0.1907 0.1192 ...
 $ fBodyBodyAccJerkMag_mean     : num  -0.9333 -0.9853 -0.9925 -0.0571 0.0263 ...
 $ fBodyBodyAccJerkMag_std      : num  -0.922 -0.982 -0.993 -0.103 -0.104 ...
 $ fBodyBodyAccJerkMag_meanFreq : num  0.2663 0.3519 0.4222 0.0938 0.0765 ...
 $ fBodyBodyGyroMag_mean        : num  -0.862 -0.958 -0.985 -0.199 -0.186 ...
 $ fBodyBodyGyroMag_std         : num  -0.824 -0.932 -0.978 -0.321 -0.398 ...
 $ fBodyBodyGyroMag_meanFreq    : num  -0.13977 -0.000205 -0.02866 0.268812 0.349665 ...
 $ fBodyBodyGyroJerkMag_mean    : num  -0.942 -0.99 -0.995 -0.319 -0.282 ...
 $ fBodyBodyGyroJerkMag_std     : num  -0.933 -0.987 -0.995 -0.382 -0.392 ...
 $ fBodyBodyGyroJerkMag_meanFreq: num  0.177 0.185 0.334 0.191 0.19 ...
 
 
 
 
 