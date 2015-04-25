# GettingAndCleaningData
Repository for JH Getting anв Cleaning data course project

Ok..
The script run_analysis.R is a function that returns dataset 180x82.  It starts from loading data sets from files in initial directory (I renamed the folder with data to "Dataset").
V2 variable in data frame "features" was changed from "factor" to "char" for analyzing them for containing "mean" and "std" in the names of columns.
train and test datasets were composed from X and y data frames respectively. Then they were merged into one data frame "dataset".
Then I cut off variables that dont't contain "mean" and "std" in it's names.
Finally I form new data frame "newDS" with the same columns as initial one. I use for loop to pass all the combinations of SubjectID and ActivityID. For every combination a vector of values is taken and a mean of this vector is written to a combination's raw.
A column "activity_label" is added to "newDS" with labels of activities. Then this data frame is saved to "newDS.txt" file. The function returns "newDS".

