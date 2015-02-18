# Introduction - 
Human Activity Recognition Using Smartphones Dataset
Version 1.0

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly 
partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled 
in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, 
which has gravitational and body motion components, was separated using a Butterworth low-pass filter into 
body acceleration and gravity. The gravitational force is assumed to have only low frequency components, 
therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained 
by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.


# Assignment Objective -
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis.


# Input data source
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for 
   each window sample. Its range is from 1 to 30. 

# Tidy Data Set
Following variables that calculate mean() or std)( have been extracted from the larger data set
 $ tBodyAcc_mean_X              
 $ tBodyAcc_mean_Y              
 $ tBodyAcc_mean_Z              
 $ tBodyAcc_std_X              
 $ tBodyAcc_std_Y               
 $ tBodyAcc_std_Z               
 $ tGravityAcc_mean_X           
 $ tGravityAcc_mean_Y           
 $ tGravityAcc_mean_Z           
 $ tGravityAcc_std_X            
 $ tGravityAcc_std_Y            
 $ tGravityAcc_std_Z            
 $ tBodyAccJerk_mean_X          
 $ tBodyAccJerk_mean_Y          
 $ tBodyAccJerk_mean_Z         
 $ tBodyAccJerk_std_X           
 $ tBodyAccJerk_std_Y           
 $ tBodyAccJerk_std_Z           
 $ tBodyGyro_mean_X             
 $ tBodyGyro_mean_Y             
 $ tBodyGyro_mean_Z             
 $ tBodyGyro_std_X              
 $ tBodyGyro_std_Y             
 $ tBodyGyro_std_Z              
 $ tBodyGyroJerk_mean_X         
 $ tBodyGyroJerk_mean_Y         
 $ tBodyGyroJerk_mean_Z       
 $ tBodyGyroJerk_std_X          
 $ tBodyGyroJerk_std_Y         
 $ tBodyGyroJerk_std_Z         
 $ tBodyAccMag_mean            
 $ tBodyAccMag_std              
 $ tGravityAccMag_mean        
 $ tGravityAccMag_std           
 $ tBodyAccJerkMag_mean         
 $ tBodyAccJerkMag_std          
 $ tBodyGyroMag_mean            
 $ tBodyGyroMag_std             
 $ tBodyGyroJerkMag_mean        
 $ tBodyGyroJerkMag_std         
 $ fBodyAcc_mean_X              
 $ fBodyAcc_mean_Y              
 $ fBodyAcc_mean_Z              
 $ fBodyAcc_std_X              
 $ fBodyAcc_std_Y               
 $ fBodyAcc_std_Z              
 $ fBodyAcc_meanFreq_X          
 $ fBodyAcc_meanFreq_Y          
 $ fBodyAcc_meanFreq_Z          
 $ fBodyAccJerk_mean_X          
 $ fBodyAccJerk_mean_Y          
 $ fBodyAccJerk_mean_Z          
 $ fBodyAccJerk_std_X           
 $ fBodyAccJerk_std_Y           
 $ fBodyAccJerk_std_Z           
 $ fBodyAccJerk_meanFreq_X      
 $ fBodyAccJerk_meanFreq_Y      
 $ fBodyAccJerk_meanFreq_Z      
 $ fBodyGyro_mean_X             
 $ fBodyGyro_mean_Y             
 $ fBodyGyro_mean_Z             
 $ fBodyGyro_std_X              
 $ fBodyGyro_std_Y             
 $ fBodyGyro_std_Z              
 $ fBodyGyro_meanFreq_X         
 $ fBodyGyro_meanFreq_Y         
 $ fBodyGyro_meanFreq_Z        
 $ fBodyAccMag_mean             
 $ fBodyAccMag_std              
 $ fBodyAccMag_meanFreq         
 $ fBodyBodyAccJerkMag_mean     
 $ fBodyBodyAccJerkMag_std      
 $ fBodyBodyAccJerkMag_meanFreq 
 $ fBodyBodyGyroMag_mean        
 $ fBodyBodyGyroMag_std         
 $ fBodyBodyGyroMag_meanFreq    
 $ fBodyBodyGyroJerkMag_mean    
 $ fBodyBodyGyroJerkMag_std     
 $ fBodyBodyGyroJerkMag_meanFreq 
 
 
 
 
# Expected Output
A tidy data frame sample is as shown below. The actula frame is 180 rows x 81 columns

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


# Description of run_analysis.R script can be found in READEM.txt

# Instructions on how to test the script is included in README.txt



 





