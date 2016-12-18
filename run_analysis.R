
## Run Analysis on the data set-
##   Load data from the test and training data files
##   Merge the test and training sets
##   The Activity names are taken from the activity_labels file and update in the data
##   Extract only measuresurements of the mean and sd of the varialbes
##   Change the Column names to descriptive names from the feature names
##   Group by Subject X Activity and compute the mean of every variable and write to tidy_data.txt
run_analysis <- function() {
    ## Read the activity labels and feature names
    dir <- "UCI HAR Dataset"
    activity_labels <- read.table(paste(dir, "activity_labels.txt", sep="/"), col.name=c("index", "label"))
    features <- read.table(paste(dir, "features.txt", sep="/"), col.name=c("index", "name"))
    
    ## Read test and training data sets
    test_subjects <- read.table(paste(dir, "test/subject_test.txt", sep="/"), col.names="subject")
    test_activities <- read.table(paste(dir, "test/y_test.txt", sep="/"), col.names="activity")
    test_values <- read.table(paste(dir, "test/X_test.txt", sep="/"))
    train_subjects <- read.table(paste(dir, "train/subject_train.txt", sep="/"), col.names="subject")
    train_activities <- read.table(paste(dir, "train/y_train.txt", sep="/"), col.names="activity")
    train_values <- read.table(paste(dir, "train/X_train.txt", sep="/"))
    
    ## Add the subject and activity columns to the test and training sets
    test_data <- cbind(test_subjects, test_activities, test_values)
    train_data <- cbind(train_subjects, train_activities, train_values)
    
    ## Merge the test and training data into one dataset
    data <- rbind(test_data, train_data)
    
    ## Replace the activity with the matching  name from the activity_labels dataframe
    data$activity <- activity_labels[data$activity, "label"]
    
    ## Keep only the columns that end with mean() or std()
    colnums_with_mean_or_std <- grep("mean\\(\\)|std\\(\\)", features$name)
    cols_with_mean_or_std <- paste("V", colnums_with_mean_or_std, sep="")
    cols_to_keep = c("subject", "activity", cols_with_mean_or_std)
    data <- data[ ,cols_to_keep]
    
    ## Change the Column names to descriptive names from the feature names
    names(data) <- c("subject", "activity", as.character(features[colnums_with_mean_or_std, "name"]))

    ## Group by Subject X Activity and compute the mean for all the columns (3 to 68)
    tidy_data <- aggregate(d[ ,3:68], list(d$subject, d$activity), mean)
    
    ## Update the column names
    new_col_names = paste("MEANOVER", names(data)[3:68], sep="_")
    names(tidy_data) = c("subject", "activity", new_col_names)
    
    ## Wrtie to output file
    write.table(tidy_data, "tidy_data.txt")
    
}

