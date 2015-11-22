# ATTENTION: this script bust be in the directory of the data (where you 
#            find features.txt)

load_data <- function(data, subject, activity) {
    x <- read.table(data)
    
    # Add a column with the subject
    tmp <- read.table(subject)
    x$subject <- tmp$V1
    
    # Add a column with activity
    tmp <- read.table(activity)
    x$activity <- tmp$V1
    
    # Return the data frame
    x
}

project <- function() {
    # Merges the training and the test sets to create one data set
    x <- load_data('test/X_test.txt', 'test/subject_test.txt', 'test/y_test.txt')
    y <- load_data('train/X_train.txt', 'train/subject_train.txt', 'train/y_train.txt')
    z <- rbind(x, y)
    
}