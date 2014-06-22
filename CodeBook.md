I have followed this approch to clean and present the tiny data in the course project.

Checking consistency and creating initial environmnet
-----------------------------------------------------
In order to be sure that the necessary data in the zip file are available I check the presence of the zip file *getdata-projectfiles-UCI HAR Dataset.zip* as provided by the course team. The md5 checksum helps to idetify any modification in the original file.

Loading auxliary datafiles
--------------------------
These file contains the metadata for the measurements:
UCI HAR Dataset/features.txt: the name of the measurements in the datasets (actual column names of the datasets)
UCI HAR Dataset/train/subject_train.txt: subject codes for the training datasets
UCI HAR Dataset/test/subject_test.txt: sibject codes for the test datasets
UCI HAR Dataset/activity_labels.txt: code conversion table for the activity code in the datasets to activity strings
UCI HAR Dataset/train/y_train.txt: the activities belonging to the training dataset (coded as per activitylabels.txt)
UCI HAR Dataset/test/y_test.txt: the activities belonging to the test dataset (coded as per activitylabels.txt)

Loading data sets
-----------------
The training and the test datasets. This takes a longer time.
UCI HAR Dataset/train/X_train.txt
UCI HAR Dataset/test/X_test.txt
This file containc the measurement data per subject/activity as code in the corresponding subject.txt and and activity.txt files. The column names are defined in the features.txt.

Cleaning feature names
----------------------
1. We need only the features which contains mean and standard deviation of measurements.  These can be filtered out with the regular expression 'mean[()]|std[()]'. The grepl() function generates a logical vector with the feature names matching to the regexp.
2. The features names are cleaned from characters '[-(),]' with simly deleting them from the name.

Subsetting columns in datasets
------------------------------
Using the logical vector created in the next point, the two datasets are subset containing only the necessary columns.

Merging the two datasets and subjects and activities
----------------------------------------------------
The two datasets are merged together with the merge() function, parameters: all=TRUE, sort=FALSE.
The subject codes and activity codes are merged with simple concatenating.

Final touch-up of the data set
---------------------------
1. It is and important step to decode the activity code into activity desctiption. The factor() function does that using the dataset from the activity_label.txt.
2. The subject codeas and the activity desctiptions are added to the large dataset with cbind().
3. The column names are added to the datasets using the vector from the features.txt.
4. Now the dataset is ready to write in the file called *tidy.txt*.

Creating second data set
------------------------
The second requested dataset is created in a very straigthwoward way, applying the aggregate() function on the measurement columns and using the first two columns(subject, activity) as grouping variables.
The reulting dsataset is written in the file tidy2.txt.
