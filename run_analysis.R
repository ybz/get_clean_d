readFeatures <- function(filename) {
    data <- read.table('./test/X_test.txt', header=FALSE, sep="")
    data
}

loadFeatureNAmes <- function() {
    names <- read.table('./features.txt', header=FALSE, sep="", stringsAsFactors=FALSE)[,2]
    names
}