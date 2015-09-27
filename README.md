**********

# Purpose

In the course of partaking an online class regarding data analysis, in particular the class _*Getting and Cleaning Data*_, one assignment was a project with the purpose to demonstrate the student's ability to collect, work with, and clean a data set. The objective is to prepare tidy data that can be used for later analysis.

**********

# Setting

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained from the [Machine Learning Repository at UCI's][harhome].

The data for the project can be obtained from [here][hardata].

**********

# Assignment

Create a R script called _*```run_analysis.R```*_ that carries out the following steps:

1. Merges the training and the test sets to create one data set;
2. Extracts only the measurements on the mean and standard deviation for each measurement;
3. Uses descriptive activity names to name the activities in the data set;
4. Appropriately labels the data set with descriptive variable names;
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject;
6. Export the tidy data set as a txt file created with write.table() using row.name=FALSE.

**********

# Project

The project comprises several directories and files, all of which are outlined below.

## Directory structure

In the project directory you will find several subdirectories.

```
<project directory>/
  +- CodeBook.md
  +- data/
  |    +- getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  |    +- UCI HAR Dataset/
  |    |    +- activity_labels.txt
  |    |    +- features.txt
  |    |    +- features_info.txt
  |    |    +- README.txt
  |    |    +- test/
  |    |    |    +- Inertial Signals/
  |    |    |    |    +- body_acc_x_test.txt
  |    |    |    |    +- body_acc_y_test.txt
  |    |    |    |    +- body_acc_z_test.txt
  |    |    |    |    +- body_gyro_x_test.txt
  |    |    |    |    +- body_gyro_y_test.txt
  |    |    |    |    +- body_gyro_z_test.txt
  |    |    |    |    +- total_acc_x_test.txt
  |    |    |    |    +- total_acc_y_test.txt
  |    |    |    |    +- total_acc_z_test.txt
  |    |    |    +- subject_test.txt
  |    |    |    +- X_test.txt
  |    |    |    +- y_test.txt
  |    |    +- train/
  |    |         +- Inertial Signals/
  |    |         |    +- body_acc_x_train.txt
  |    |         |    +- body_acc_y_train.txt
  |    |         |    +- body_acc_z_train.txt
  |    |         |    +- body_gyro_x_train.txt
  |    |         |    +- body_gyro_y_train.txt
  |    |         |    +- body_gyro_z_train.txt
  |    |         |    +- total_acc_x_train.txt
  |    |         |    +- total_acc_y_train.txt
  |    |         |    +- total_acc_z_train.txt
  |    |         +- subject_train.txt
  |    |         +- X_train.txt
  |    |         +- y_train.txt
  |    +- UCI_HAR_Dataset_Messy.txt
  |    +- UCI_HAR_Dataset_Tidy.txt
  +- doc/
  +- Getting and Cleaning Data Course Project.Rproj
  +- lib/
  |    +- chkdir.R
  |    +- dldat.R
  |    +- extvars.R
  |    +- mergetesttrain.R
  |    +- messydat.R
  |    +- rdactlbl.R
  |    +- rdfeatlbl.R
  |    +- rdtest.R
  |    +- rdtrain.R
  |    +- repidwithlbl.R
  |    +- setvarnames.R
  |    +- tidydat.R
  |    +- wrdat.R
  +- README.md
  +- run_analysis.R
```

The _*```data```*_ directory contains the downloaded data file, both as a compressed archive (zip), as well as the uncompress individual data files.

Inside the _*```doc```*_ directory you can find the _*R Markdown Cheatsheet*_ and _*R Markdown Reference Guide*_.

Any additional, supporting scripts or libraries are stored inside the _*```lib```*_ directory.

## Files

For reasons of readability, testing, profiling, benchmarking and re-usability, instead of creating one single script file, an approach of splitting the script into several functions, each put into a corresponding script file of its own, placed into the _*```lib```*_ directory, has been taken.

### run_analysis.R

The main entry point, the main script, Upon which execution all required libraries and supporting scripts are getting loaded, as well as global variables and constants are defined.

Steps carried out by this script:

1. check for existence of the _*```doc```*_ and _*```data```*_ directories, and create these if required;
2. download and uncompress data file (raw data) if not already available;
3. create the messy data (merge train and test data sets), and store these in data.table _*```dtMessy```*_;
4. create tidy data from messy data, and store these in data.table _*```dtTidy```*_;
5. write the messy and tidy data sets to corresponding text files located in the _*```data```*_ directory.

### lib/chkdir.R

Check whether a specific directory is already existing, and if not create that directory.

|Parameter|Description|
|---------|-----------|
|dname|vector of directory names to check/create|
|mkdir|create directories if non-existing|

Table: Input parameter

|Result|Description|
|------|-----------|
|TRUE|success; directories are existing/have been created successfully|
|FALSE|failure; directories are not existing/cannot be created|

Table: Output value

### lib/dldat.R

Download data into indicated directory, expand if requested, and rename as specified.

|Parameter|Description|
|---------|-----------|
|dlname|vector of files to downloads|
|dldir|vector of directories files to download to|
|fname|local filenames of downloaded files|
|exp|expand downloaded files?|
|redl|re-download files?|

Table: Input parameter

|Result|Description|
|------|-----------|
|TRUE|success; directory is existing/has been created successfully|
|FALSE|failure; directory does not exist/cannot be created|

Table: Output value

**Note**  
Case #1) _*```dlname```*_, _*```dldir```*_, _*```fname```*_ have to be of identical length, -or-  
Case #2) _*```dlname```*_ and _*```fname```*_ have to be of identical length, and _*```dldir```*_ has to be of length 1.

### lib/extvars.R

Extract specific variable from data set.

|Parameter|Description|
|---------|-----------|
|dtSrc|data.table containing the source data|
|vars|vector of variables to extract|
|pattern|pattern of variables to extract|

Table: Input parameter

|Result|Description|
|------|-----------|
|data table|success; data table containing the extracted data only|
|NULL|failure|

Table: Output value

**Note**  
If both _*```vars```*_ and _*```pattern```*_ are non-NULL, only _*```vars```*_ will be taken into account.

### lib/mergetesttrain.R

Merge test and train data.

|Parameter|Description|
|---------|-----------|
|dtTest|data.table containing the test data|
|dtTrain|data.table containing the train data|

Table: Input parameter

|Result|Description|
|------|-----------|
|data table|success; data table containing the merged data|
|NULL|failure|

Table: Output value

**Note**  
Case #1) _*```dtTest```*_ and _*```dtTrain```*_ are omitted -> both corresponding reading functions are executed;  
Case #2) _*```dtTest```*_ or _*```dtTrain```*_ are omitted -> corresponding reading function for the omitted data set is executed;  
Case #3) _*```dtTest```*_ and _*```dtTrain```*_ are provided -> only a merge is getting carried out.

### lib/messydat.R

Create (merge) messy data from raw data.

|Parameter|Description|
|---------|-----------|
|NONE||

Table: Input parameter

|Result|Description|
|------|-----------|
|data table|success; data table containing the messy data|
|NULL|failure|

Table: Output value

### lib/rdactlbl.R

Read activity label data.

|Parameter|Description|
|---------|-----------|
|basedir|base directory to read files from|

Table: Input parameter

|Result|Description|
|------|-----------|
|data table|success; data table containing the activity label data|
|NULL|failure|

Table: Output value

### lib/rdfeatlbl.R

Read feature label data.

|Parameter|Description|
|---------|-----------|
|basedir|base directory to read files from|

Table: Input parameter

|Result|Description|
|------|-----------|
|data table|success; data table containing the feature label data|
|NULL|failure|

Table: Output value

### lib/rdtest.R

Read test data.

|Parameter|Description|
|---------|-----------|
|basedir|base directory to read files from|

Table: Input parameter

|Result|Description|
|------|-----------|
|data table|success; data table containing the test data|
|NULL|failure|

Table: Output value

### lib/rdtrain.R

Read train data.

|Parameter|Description|
|---------|-----------|
|basedir|base directory to read files from|

Table: Input parameter

|Result|Description|
|------|-----------|
|data table|success; data table containing the train data|
|NULL|failure|

Table: Output value

### lib/repidwithlbl.R

Replace id with label.

|Parameter|Description|
|---------|-----------|
|dtSrc|data.table containing the source data|
|dtLbl|data.table containing the label data|
|cnSrcId|variable/column name(s) holding the id to replace|
|cnLblId|variable/column name(s) holding the id for matching|
|cnLblLbl|variable/column name(s) holding the label to replace id with|
|rmSrcId|remove id variable/column from resulting data set?|

Table: Input parameter

|Result|Description|
|------|-----------|
|data table|success; data table containing data with replaced id(s)|
|NULL|failure|

Table: Output value

**Note**  

+ all of _*```dtSrc```*_, _*```dtLbl```*_, _*```cnSrcId```*_, _*```cnLblId```*_, _*```cnLblLbl```*_ have to be specified, and a non-NULL value has to be provided for each of these;
+ if the id variable/column gets removed, the new key will be the old key but with the new variable/column instead; otherwise the old key will remain.

### lib/setvarnames.R

Set variable/column names.

|Parameter|Description|
|---------|-----------|
|dtSrc|data.table containing the source data|
|cnVars|vector of new variable/column names|
|pattern|pattern of variables to extract|

Table: Input parameter

|Result|Description|
|------|-----------|
|data table|success; data table containing data with new variable/column names assigned|
|NULL|failure|

Table: Output value

**Note**  

+ _*```dtSrc```*_ and _*```cnVars```*_ have to be provided, and assigned a non-NULL value respectively;
+ if _*```cnVars```*_ contains less elements than _*```dtSrc```*_ variables/columns, the remining, missing elements will be taken from the current variables/columns of _*```dtSrc```*_;
+ if _*```cnVars```*_ contains more elements than _*```dtSrc```*_ variables/columns, only the first elements up to the number of elements of the current variables/columns of _*```dtSrc```*_ will be taken;
+ if pattern is also provided (and non-NULL), all variable/column names matching the pattern will be amended by replacing the matched pattern with the content of _*```cnVars```*_;
+ any exsting sorting/matching key will be amended accordingly.

### lib/tidydat.R

Tidy up messy data.

|Parameter|Description|
|---------|-----------|
|dtMessy|data.table containing the test data|

Table: Input parameter

|Result|Description|
|------|-----------|
|data table|success; data table containing the tidy data|
|NULL|failure|

Table: Output value

### lib/wrdat.R

Export data set to file.

|Parameter|Description|
|---------|-----------|
|dtSrc|data.table containing the source data|
|basedir|base directory to write files to|
|fname|filename of output file|
|fext|file extension of output file|
|arch|archive/compress (zip) written file?|
|archtype|archive/compress type (bz, gz, zip [default])|

Table: Input parameter

|Result|Description|
|------|-----------|
|TRUE|success; data set has been successfully written to file|
|FALSE|failure; data set couldn't be written to file|

Table: Output value

**Note**  

+ at least dtSrc and fname have to be provided, and containing a non-NULL value;
+ if outfile is already existing it will get overwritten.

*****
[harhome]: <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>
[hardata]: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>
