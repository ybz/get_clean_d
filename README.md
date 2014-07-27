run_analysis.R
--------------

- goal is to take data from 'Human Activity Recognition Using Smartphones Dataset' and tidy it up
providing an average per subject per activity for the mean and std of each measured value in the original
dataset
- original data found at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- more info about original data found at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

- The main steps are:
  - load all data from test, and train sets
  - replace column names with column names taken from the features.txt file in the original data
  - replace dashes and brackets in the column names to simplify them
  - keep just the data columns that have mean or std of the measurements
  - join the data from the train and test sets
  - replace activity ids with lowercase activity names
  - summerize the data by taking the mean for each column for each subject/activity combination
  

- to use:
  - get the original data
  - set working directory to the location of the original dataset
  - source run_analysis.R
  - the tidy variable will give you the averaged data
  - for getting the cleaned data before the averaging you can run loadAllData()


enjoy!


### Script By:
Yaniv Ben-Zaken, me@yaniv.bz
as part of a coursera 'getting and cleaning data' course at:
https://class.coursera.org/getdata-005


from the original license for the data:

### License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
