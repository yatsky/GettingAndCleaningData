# GettingAndCleaningData
## Course project repo for Getting and cleaning data

This run_analysis script follows these steps:

* Reads the files needed.
* Merges files.
* Extracts the measurements on the mean and standard deviation for each measurement. (** Please note that the last 7 rows in features.txt are ignored, since they are calculating the ANGLE between the two vectors. **)
* Adds a new field to denote activity names.
* Renames every variable's name.
* Creates a new data set to the hardrive.