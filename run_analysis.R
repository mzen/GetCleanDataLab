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
    df1 <- load_data('test/X_test.txt', 'test/subject_test.txt', 'test/y_test.txt')
    df2 <- load_data('train/X_train.txt', 'train/subject_train.txt', 'train/y_train.txt')
    all_datasets <- rbind(df1, df2)
    
    # Extracts only the measurements on the mean and standard deviation for each measurement
    features <- read.table('features.txt')
        # find indices for mean() and std()
    f1 <- which(grepl('mean()', features$V2, fixed=T))
    f2 <- which(grepl('std()', features$V2, fixed=T))
        # can i have std() and mean()? perhaps yes
    selected_features <- features[sort(unique(c(f1, f2))), ]
    dataset <- all_datasets[, selected_features$V1]
    
    # Uses descriptive activity names to name the activities in the data set
        # rename variables
    colnames(dataset) <- selected_features$V2
        # don't miss these
    dataset$subject <- all_datasets$subject
    dataset$activity <- all_datasets$activity
    
}