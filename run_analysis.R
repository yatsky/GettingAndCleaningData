# 1.Merges the training and the test sets to create one data set.
myMerge <- function(directory){
        filedir <- paste(directory,"X_test.txt", sep="/")
        test <- read.table(filedir)
        filedir <- paste(directory,"X_train.txt", sep="/")
        train <- read.table(filedir)
        data <- rbind(test, train)
}
# 2.Extracts only the measurements on the mean and standard deviation for each measurement.
myExtract <- function(directory, myMerge){
        filedir <- paste(directory, "features.txt", sep="/")
        features <- as.character(read.table(filedir))
        x <- features[ ,2]
        y <- strsplit(x, "-")
        actID <- vector("numeric")
        for (i in 1:562) {
                if (y[[i]][2] == "mean()" | y[[i]][2] == "std()") {
                     actID <- c(actID,i)
                }
        }
        colnames(myMerge) <- 1:561
        actNames <- colnames(myMerge)
        extract <- data.frame()
        for (ID in actID) {
              for (Name in actNames) {
                      if (as.character(ID) == Name) {
                              extract <- cbind(extract, myMerge[ , Name])
                      }
              }
             
        }
        return extract
}
# 3.Uses descriptive activity names to name the activities in the data set
changeName <- function(directory, data) {
        
}
# 4.Appropriately labels the data set with descriptive variable names.
# 5.From the data set in step 4, creates a second, 
# independent tidy data set with the average of each variable for each activity and each subject.