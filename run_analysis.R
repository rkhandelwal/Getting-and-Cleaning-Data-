library("plyr")

####################################################################################
# BuildTrainingSet - builds the training data frame from three files as follows
#     1. x_train - contains training samples 
#     2. subject_train - adds subjects vector as a column 
#     3. activity_y_train - adds activities as a column 
####################################################################################
BuildTrainingSet <- function (x_train, subject_train, activity_y_train) {

	trainDf <- read.csv(x_train, header=FALSE)
	sub <- read.csv(subject_train, header=FALSE, col.names=c("Subject"))
	activity <- read.csv(activity_y_train, header=FALSE, col.names=c("Activity"))
	trainDf <- cbind(sub, activity, trainDf)
	dim(trainDf)
	
	return (trainDf)
}


####################################################################################
# BuildTestSet - builds the test data frame from three files as follows
#     1. x_test - contains test samples 
#     2. subject_train - adds subjects vector as a column 
#     3. activity_y_train - adds activities as a column 
####################################################################################
BuildTestSet <- function (x_test, subject_test, activity_y_test) {

	testDf <- read.csv(x_test, header=FALSE)
	sub <- read.csv(subject_test, header=FALSE, col.names=c("Subject"))
	activity <- read.csv(activity_y_test, header=FALSE, col.names=c("Activity"))
	
	testDf <- cbind(sub, activity, testDf)
	
	return (testDf)
}




####################################################################################
# main - This is the main function
####################################################################################
main <- function () {

	###############################################################
	## Step 1 - Create Merged data from training set and test set #
	###############################################################
	trainDf <- BuildTrainingSet("train//X_train.csv", "train//subject_train.txt", "train//y_train.txt")
	testDf <- BuildTestSet("test//X_test.csv", "test//subject_test.txt", "test//y_test.txt")
	mergedDf <- rbind(trainDf, testDf)
	
	
	###############################################################
	## Step 2 - Extract only the measurements on the mean and     #
	##          standard deviation for each measurement           #
	###############################################################
	colnams <- read.csv("features.txt", header=FALSE, sep= " ")
	colnams <- colnams$V2
	colnams <- gsub("-", "_", colnams)
	colnams <- gsub("\\(\\)", "", colnams)
	colnames(mergedDf) <- c("Subject", "Activity", colnams)
	mergedDf <- mergedDf[ , which(  grepl("mean", names(mergedDf)) | grepl("std", names(mergedDf)) | grepl("Activity", names(mergedDf)) | grepl("Subject", names(mergedDf))  )]


	###############################################################
	## Step 3 - Uses descriptive activity names to name the       #
	##          activities in the data set                        #
	###############################################################
	lbl <- read.csv("activity_labels.txt", colClasses="character", header=FALSE, sep=" ")
	lbl <- lbl$V2
	mergedDf$Activity <- as.character(mergedDf$Activity)
	mergedDf$Activity[mergedDf$Activity == "1"] <- lbl[1]
	mergedDf$Activity[mergedDf$Activity == "2"] <- lbl[2]
	mergedDf$Activity[mergedDf$Activity == "3"] <- lbl[3]
	mergedDf$Activity[mergedDf$Activity == "4"] <- lbl[4]
	mergedDf$Activity[mergedDf$Activity == "5"] <- lbl[5]
	mergedDf$Activity[mergedDf$Activity == "6"] <- lbl[6]
	
	###############################################################
	## Step 4 - Appropriately labels the data set with            #
	##          descriptive variable names.                       #
	###############################################################
	# data names were cleaned up in step 2 above.


  	###############################################################
  	## Step 5 - From the data set in step 4, creates a second,    #
	##          independent tidy data set with the average of     #
  	##          variable for each activity and each subject.      #
	###############################################################
	tdf <- ddply(mergedDf, .(Subject, Activity), numcolwise(mean))
  	write.table (tdf, "sample.txt", row.names=FALSE)
  	(tdf)
}



tdf <- main()




   




