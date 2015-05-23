# 1.Merges the training and the test sets to create one data set.
myMerge <- function(directory1, directory2){
        filedir <- paste(directory1,"X_test.txt", sep="/")
        test <- read.table(filedir)
        filedir <- paste(directory2,"X_train.txt", sep="/")
        train <- read.table(filedir)
        data <- rbind(test, train)
        return (data)
}

# 4.Appropriately labels the data set with descriptive variable names.
changeName <- function(data, features) {
        colNames <- as.character(features[ , 2])
        colnames(data) <- colNames
        return (data)
}
# 3.Uses descriptive activity names to name the activities in the data set
addActName <- function(data, testActDir, trainActDir) {
        test <- read.table(testActDir)
        train <- read.table(trainActDir)
        actNumber <- rbind(test, train)[ ,1]
        actName <- vector(mode = "character")
        for (i in actNumber) {
                if (i == 1) {
                        actName <- c(actName, "WALKING")
                }
                else if (i == 2){
                        actName <- c(actName, "WALKING_UPSTAIRS")
                }
                else if (i == 3){
                        actName <- c(actName, "WALKING_DOWNSTAIRS")
                }
                else if (i == 4){
                        actName <- c(actName, "SITTING")
                }
                else if (i == 5){
                        actName <- c(actName, "STANDING")
                }
                else if (i == 6){
                        actName <- c(actName, "LAYING")
                }
                else {
                        print("Something went wrong!")
                        stop
                }
        }
        data <- cbind(actName, data)
        return (data)
}
# 2.Extracts only the measurements on the mean and standard deviation for each measurement.
myExtract <- function(directory, data){
        filedir <- paste(directory, "features.txt", sep="/")
        features <- read.table(filedir)
        x <- as.character(features[ ,2])
        y <- strsplit(x, "-")
        actID <- vector("numeric")
        for (i in 1:554) { #last 7 columns are dumped
                if (y[[i]][2] == "mean()" | y[[i]][2] == "std()") {
                        actID <- c(actID,i)
                }
                
        }
        data <- cbind(data$actName, data[ , actID + 1]) 
        # actID in the features list is 1 index behind the data set
        # column list, which contains actName column
        return (data)
}


# 5.From the data set in step 4, creates a second, 
# independent tidy data set with the average of each variable for each activity and each subject.
createData <- function(data) {
        colNames <- names(data)
        
        
}