## Code Book

The following is the codebook for creating tidy.csv in this repository. The steps of analysis are listed below.

### Explanation

* `features.txt`: Names of features.
* `activity_labels.txt`: Names and IDs for the activities.

* `X_train.txt`: 7352 observations.
* `subject_train.txt`: 7352 integers with IDs of the volunteers for each observation in `X_train.txt`.
* `y_train.txt`: 7352 integers with IDs of the activity for each observation in `X_train.txt`.

* `X_test.txt`: 2947 observations.
* `subject_test.txt`: 2947 integers with IDs of the volunteers for each observation in `X_test.txt`.
* `y_test.txt`: 2947 integers with IDs of the activity for each observation in `X_test.txt`.

### Processing

1. The data files were read into R with read.table and names were added to the columns. Data combined into one total table.
2. All feature columns with string "mean()" or "std()" were put into a final table with the activities labeled according to the 'features.txt' file.
3. This final data set was written to tidy.csv using the write.csv function.