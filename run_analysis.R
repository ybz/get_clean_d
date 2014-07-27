loadFeatures <- function(filename) {
    # load full features data from filename
    data <- read.table('./test/X_test.txt', header=FALSE, sep="")
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

loadSelectedFeatures <- function(filename) {
    # load measurement data from file
    # fix column names, and select only columns of mean and std
    data <- loadFeatures('filename')
    names(data) <- loadFeatureNames()
    selected_columns <- data[,shouldPickColumn(names(data))]
    selected_columns
}