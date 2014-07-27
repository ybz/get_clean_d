loadFeatures <- function(filename) {
    # load full features data from filename
    data <- read.table(filename, header=FALSE, sep="")
    data
}

loadFeatureNames <- function() {
    # load from the features file a vector of all the column names for the features
    names <- read.table('./features.txt', header=FALSE, sep="", stringsAsFactors=FALSE)[,2]
    names
}

shouldPickColumn <- function(name) {
    # return a boolean if the name is of a column to be picked
    # a column will be picked if it contains mean() or std() in the name
    grepl('mean()', name, fixed=TRUE) | grepl('std()', name, fixed=TRUE)
}

fixNames <- function(names_vector) {
    ret <- gsub('-', '.', names_vector)
    ret <- gsub('()', '', ret, fixed=TRUE)
    ret
}

loadSelectedFeatures <- function(filename) {
    # load measurement data from file
    # fix column names, and select only columns of mean and std
    data <- loadFeatures(filename)
    names(data) <- loadFeatureNames()
    selected_columns <- data[,shouldPickColumn(names(data))]
    names(selected_columns) <- fixNames(names(selected_columns))
    selected_columns
}

getActivitiesVector <- function() {
    # load activities definition and return it as a lowercase vector
    activities <- read.table('./activity_labels.txt', header=FALSE, sep="", stringsAsFactors=FALSE)
    labels <- tolower(activities[[2]])
    labels
}

asActivitiesFactor <- function(int_vector) {
    factorized <- factor(int_vector, labels=getActivitiesVector())
}

loadActivitiesAsFactor <- function(filename) {
    # load activities data file, and replace integer values with a labels factor
    activities_int_vector <- read.table(filename, header=FALSE, sep="", stringsAsFactors=FALSE)[[1]]
    factorized <- asActivitiesFactor(activities_int_vector)
    factorized
}

loadSubjectIDs <- function(filename) {
    subject_ids <- read.table(filename, header=FALSE, sep="", stringsAsFactors=FALSE)[[1]]
    subject_ids
}

loadSetAndBind <- function(base_name) {
    # load features, activity, and subject ID from a set (train/test)
    # return a merged date.frame of all data
    base_path <- paste(base_name, '/', sep='')
    features <- loadSelectedFeatures(paste(base_path, 'X_', base_name, '.txt', sep=''))
    activity <- loadActivitiesAsFactor(paste(base_path, 'y_', base_name, '.txt', sep=''))
    subject_id <- loadSubjectIDs(paste(base_path, 'subject_', base_name, '.txt', sep=''))
    all <- cbind(activity, features)
    all <- cbind(subject_id, all)
    all
}

loadAllData <- function() {
    # load train and test data and merge them together
    test_data <- loadSetAndBind('test')
    train_data <- loadSetAndBind('train')
    all <- rbind(test_data, train_data)
}

getAverageForData <- function(data) {
    avg_data <- aggregate(data[,!colnames(data) %in% c('subject_id', 'activity')],by=list(subject_id=data$subject_id, activity=data$activity), FUN=mean)
    avg_data
}

loadTidyData <- function() {
    all <- loadAllData()
    tidy <- getAverageForData(all)
    tidy
}


tidy <- loadTidyData()
