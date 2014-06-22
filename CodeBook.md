tidy.txt
--------
Simple text file with space as separator.

Columns:

1 subject: as in the subject-test.txt and subject-train.txt

2 activity: as in the Y-test.txt and Y-train.txt and coded in activity_labels.txt

3-68: measurement means and standard deviation as in the features.txt, but only those which contains means and standard deviation. In addition all special characters are removed from the feature names (dash, parenthesis, commma).

tidy2.txt
---------
Agrregated data from tidy.txt

The columns are the same as in the tidy.txt, but here the values are showing the average of the given masurement with respect to the subject and the activity combinations.  
