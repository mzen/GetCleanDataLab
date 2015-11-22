# Project for the course: "getting and cleaning data" 

## Short intro

We must read and merge two datasets so that we can create another dataset
with average of variables grouped by activity and subject

## Original data

There are 561 features, a.k.a. variables, listed in "features.txt".
The file "features_info.txt" explains that they used main() and std() (and a lot of other functions,
but our interset is on these two), and the features have names like "tBodyAcc-mean()-X".

There are two sets of data: "train/X_train.txt" and "test/X_test.txt", they have 561 columns, described in the feature list

Every experiment, that is a row, involved a subject, listed in "subject_[test|train].txt", making an activity, listed in "y_[test|train].txt"

## Instructions and script

1) Merges the training and the test sets to create one data set.

2) Extracts only the measurements on the mean and standard deviation for each measurement. 

3) Appropriately labels the data set with descriptive variable names. (was 4 in the original project)

4) Uses descriptive activity names to name the activities in the data set (was 3 in the original project)

5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Step 1

After the loading, we add two columns: the subject and the activity: this makes clear the origin of each observation, and makes the data more tidy

### Step 2

We trust the fact that each feature derived from mean() or std() has 'mean()' or 'std()' in the name of the feature, so we
extract indices of strings containing them.

We use unique because we do not know if they used mean() and std() on the same variable

### Step 3

We use the same names of the original feature list (subject and activity were added previously)


### Step 4

We read the file with activity names and convert the activity column (previously loaded in the data frame) to a factor with the same names

### Step 5

We use the aggregate function to get a dataset with the mean of all the collected variables grouped by activity and subject:
each row represent an activity of a subject and has all the means of all the variables for that subject and that activity

## Final

To load the final dataset you can use: read.table('mean_all.txt', header = T)

You don't need to know the codes for the activities or the link between the column number and the feature: now the dataset is tidy


