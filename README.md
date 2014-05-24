README
========================================================

This si a document for anyone who should take a look before run the "run_analysis.R" script.
Below are some big topics talk about the whole script.

## Load dataset 
In this part, the script will load 8 txt file form the source folder("UCI HAR Dataset"),
and categorized data into group from their usage and source.

## Replace dataset
First, replace the number in the y_train and y_test  into real meaning from activity labels.

## Extract mean and std variables
Extract the variables related with mean and std in the feature list. Then this selection list 
will subset the x_test and x_train which are all be combined with the whole feature list.
Combine subject and activity into one data frame.The last step is to column combine
the subject_activity data frame with x dataset which only have mean and std right now.

## Average whole data for each activity and each subject
Ignore the first two columns(because it is just the labels of subject and activity), then average 
the rest of variable by using aggregate function.
Then it will return a tidy data with 180 rows(30 subjects X 6 activity). The data inside are all been average.



