**********

# Data

## Raw Data

### Introduction

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained from the [Machine Learning Repository at UCI's][harhome], and can be obtained from [here][hardata].

### Background

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (*WALKING*, *WALKING_UPSTAIRS*, *WALKING_DOWNSTAIRS*, *SITTING*, *STANDING*, *LAYING*) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See **features_info.txt** for more details. 

### Overview

The data set comprises several individual files.

|File|Description|
|----|-----------|
|activity_labels.txt|links the class labels with their activity name|
|features.txt|list of all features|
|test/subject_test.txt|each row identifies the subject who performed the activity for each window sample|
|test/X_test.txt|test set|
|test/y_test.txt|test labels|
|train/subject_train.txt|each row identifies the subject who performed the activity for each window sample|
|train/X_train.txt|training set|
|train/y_train.txt|training labels|

Table: Base Data

**Notes**

+ Features are normalized and bounded within [-1,1];
+ Each feature vector is a row on the text file;
+ Subject IDs range from 1 to 30.

|File|Description|
|----|-----------|
|test/Inertial Signals/body_acc_x_test.txt|The body acceleration X axis signal obtained by subtracting the gravity from the total acceleration (test set)|
|test/Inertial Signals/body_acc_y_test.txt|The body acceleration Y axis signal obtained by subtracting the gravity from the total acceleration (test set)|
|test/Inertial Signals/body_acc_z_test.txt|The body acceleration Z axis signal obtained by subtracting the gravity from the total acceleration (test set)|
|test/Inertial Signals/body_gyro_x_test.txt|The angular velocity X axis vector measured by the gyroscope for each window sample. The units are radians/second (test set)|
|test/Inertial Signals/body_gyro_y_test.txt|The angular velocity Y axis vector measured by the gyroscope for each window sample. The units are radians/second (test set)|
|test/Inertial Signals/body_gyro_z_test.txt|The angular velocity Z axis vector measured by the gyroscope for each window sample. The units are radians/second (test set)|
|test/Inertial Signals/total_acc_x_test.txt|The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector (test set)|
|test/Inertial Signals/total_acc_y_test.txt|The acceleration signal from the smartphone accelerometer Y axis in standard gravity units 'g'. Every row shows a 128 element vector (test set)|
|test/Inertial Signals/total_acc_z_test.txt|The acceleration signal from the smartphone accelerometer Z axis in standard gravity units 'g'. Every row shows a 128 element vector (test set)|
|train/Inertial Signals/body_acc_x_train.txt|The body acceleration X axis signal obtained by subtracting the gravity from the total acceleration|
|train/Inertial Signals/body_acc_y_train.txt|The body acceleration Y axis signal obtained by subtracting the gravity from the total acceleration|
|train/Inertial Signals/body_acc_z_train.txt|The body acceleration Z axis signal obtained by subtracting the gravity from the total acceleration|
|train/Inertial Signals/body_gyro_x_train.txt|The angular velocity X axis vector measured by the gyroscope for each window sample. The units are radians/second|
|train/Inertial Signals/body_gyro_y_train.txt|The angular velocity Y axis vector measured by the gyroscope for each window sample. The units are radians/second|
|train/Inertial Signals/body_gyro_z_train.txt|The angular velocity Z axis vector measured by the gyroscope for each window sample. The units are radians/second|
|train/Inertial Signals/total_acc_x_train.txt|The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector|
|train/Inertial Signals/total_acc_y_train.txt|The acceleration signal from the smartphone accelerometer Y axis in standard gravity units 'g'. Every row shows a 128 element vector|
|train/Inertial Signals/total_acc_z_train.txt|The acceleration signal from the smartphone accelerometer Z axis in standard gravity units 'g'. Every row shows a 128 element vector|

Table: Sensor Data (Accelerator & Gyroscope)

**Notes**

+ Features are normalized and bounded within [-1,1];
+ Each feature vector is a row on the text file.

|File|Description|
|----|-----------|
|README.txt|overview and background of the study generating this data set|
|features_info.txt|shows information about the variables used on the feature vector|

Table: Supplementary Information

**For the project at hand, only the base data set will be considered for analysis and processing.**

## Messy Data

The messy data set is getting created by merging and processing the various elements of the base data set of the raw data. The result of this operation is stored in a R object of class _*data.table*_.

|Variable|Class|Description|
|----|---------|-----------|
|subject_id|numeric|subject id|
|activity|factor|activity name|
|tBodyAccX_mean|numeric|mean value|
|tBodyAccY_mean|numeric|mean value|
|tBodyAccZ_mean|numeric|mean value|
|tBodyAccX_std|numeric|standard deviation|
|tBodyAccY_std|numeric|standard deviation|
|tBodyAccZ_std|numeric|standard deviation|
|tGravityAccX_mean|numeric|mean value|
|tGravityAccY_mean|numeric|mean value|
|tGravityAccZ_mean|numeric|mean value|
|tGravityAccX_std|numeric|standard deviation|
|tGravityAccY_std|numeric|standard deviation|
|tGravityAccZ_std|numeric|standard deviation|
|tBodyAccJerkX_mean|numeric|mean value|
|tBodyAccJerkY_mean|numeric|mean value|
|tBodyAccJerkZ_mean|numeric|mean value|
|tBodyAccJerkX_std|numeric|standard deviation|
|tBodyAccJerkY_std|numeric|standard deviation|
|tBodyAccJerkZ_std|numeric|standard deviation|
|tBodyGyroX_mean|numeric|mean value|
|tBodyGyroY_mean|numeric|mean value|
|tBodyGyroZ_mean|numeric|mean value|
|tBodyGyroX_std|numeric|standard deviation|
|tBodyGyroY_std|numeric|standard deviation|
|tBodyGyroZ_std|numeric|standard deviation|
|tBodyGyroJerkX_mean|numeric|mean value|
|tBodyGyroJerkY_mean|numeric|mean value|
|tBodyGyroJerkZ_mean|numeric|mean value|
|tBodyGyroJerkX_std|numeric|standard deviation|
|tBodyGyroJerkY_std|numeric|standard deviation|
|tBodyGyroJerkZ_std|numeric|standard deviation|
|tBodyAccMag_mean|numeric|mean value|
|tBodyAccMag_std|numeric|standard deviation|
|tGravityAccMag_mean|numeric|mean value|
|tGravityAccMag_std|numeric|standard deviation|
|tBodyAccJerkMag_mean|numeric|mean value|
|tBodyAccJerkMag_std|numeric|standard deviation|
|tBodyGyroMag_mean|numeric|mean value|
|tBodyGyroMag_std|numeric|standard deviation|
|tBodyGyroJerkMag_mean|numeric|mean value|
|tBodyGyroJerkMag_std|numeric|standard deviation|
|fBodyAccX_mean|numeric|mean value|
|fBodyAccY_mean|numeric|mean value|
|fBodyAccZ_mean|numeric|mean value|
|fBodyAccX_std|numeric|standard deviation|
|fBodyAccY_std|numeric|standard deviation|
|fBodyAccZ_std|numeric|standard deviation|
|fBodyAccJerkX_mean|numeric|mean value|
|fBodyAccJerkY_mean|numeric|mean value|
|fBodyAccJerkZ_mean|numeric|mean value|
|fBodyAccJerkX_std|numeric|standard deviation|
|fBodyAccJerkY_std|numeric|standard deviation|
|fBodyAccJerkZ_std|numeric|standard deviation|
|fBodyGyroX_mean|numeric|mean value|
|fBodyGyroY_mean|numeric|mean value|
|fBodyGyroZ_mean|numeric|mean value|
|fBodyGyroX_std|numeric|standard deviation|
|fBodyGyroY_std|numeric|standard deviation|
|fBodyGyroZ_std|numeric|standard deviation|
|fBodyAccMag_mean|numeric|mean value|
|fBodyAccMag_std|numeric|standard deviation|
|fBodyBodyAccJerkMag_mean|numeric|mean value|
|fBodyBodyAccJerkMag_std|numeric|standard deviation|
|fBodyBodyGyroMag_mean|numeric|mean value|
|fBodyBodyGyroMag_std|numeric|standard deviation|
|fBodyBodyGyroJerkMag_mean|numeric|mean value|
|fBodyBodyGyroJerkMag_std|numeric|standard deviation|
|dataset|factor|underlying data set|

Table: Messy data set structure

|Variable|Values|
|--------|------|
|subject_id|1..30|
|activity|"LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS"|  
|dataset|"test", "train"|
|features|[-1,1]|

Table: Value ranges of variables

|Variable|Direction|
|--------|------|
|subject_id|ascending|
|activity|ascending|

Table: Sorting/matching key

## Tidy Data

As an outcome of processing, filtering, and reshaping the messy data set the tidy data set is getting created. The result of this operation is stored in a R object of class _*data.table*_.

|Variable|Class|Description|
|----|---------|-----------|
|subject_id|numeric|subject id|
|activity|factor|activity name|
|dataset|factor|underlying data set|
|feature|factor|name of feature|
|value_type|factor|type of feature value|
|value|numeric|feature value|

Table: Tidy data set structure

|Variable|Values|
|--------|------|
|subject_id|1..30|
|activity|"LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS"|  
|dataset|"test", "train"|
|feature|"fBodyAccJerkX", "fBodyAccJerkY", "fBodyAccJerkZ", "fBodyAccMag", "fBodyAccX", "fBodyAccY", "fBodyAccZ", "fBodyBodyAccJerkMag", "fBodyBodyGyroJerkMag", "fBodyBodyGyroMag", "fBodyGyroX", "fBodyGyroY", "fBodyGyroZ", "tBodyAccJerkMag", "tBodyAccJerkX", "tBodyAccJerkY", "tBodyAccJerkZ", "tBodyAccMag", "tBodyAccX", "tBodyAccY", "tBodyAccZ", "tBodyGyroJerkMag", "tBodyGyroJerkX", "tBodyGyroJerkY", "tBodyGyroJerkZ", "tBodyGyroMag", "tBodyGyroX", "tBodyGyroY", "tBodyGyroZ", "tGravityAccMag", "tGravityAccX", "tGravityAccY", "tGravityAccZ"|
|value_type|"mean", "std"|
|value|[-1,1]|

Table: Value ranges of variables

|Variable|Direction|
|--------|------|
|subject_id|ascending|
|activity|ascending|
|dataset|ascending|
|feature|ascending|
|value_type|ascending|

Table: Sorting/matching key

**********

# Transformation procedure

## Getting the raw data

Getting the raw data is triggered from within the main script (_*```run_analysis.R```*_) by calling the function _*```dlDat```*_ (file _*```lib/dldat.R```*_).

    if (dlDat(inDatRawZip, fname=basename(inDatRawZip), exp=TRUE, redl=FALSE)) {
    ...# successful download
    } # if

This function checks whether the archive has already been downloaded, and only if either explicitly requested (by means of function parameter), or not existing, the archive gets downloaded form the internet to the _*```data```*_ directory, and subsequently expanded, resulting in the [directory/file structure](#overview) as outlined above.

## From raw data to messy data

After successfully [obtaining the raw data](#getting_raw_data), the main script (_*```run_analysis.R```*_) is executing the function _*```messyDat```*_ (file _*```lib/messydat.R```*_).

The outcome of this transformation is stored in the R object _*```dtMessy```*_ of class _*```data.table```*_.

    dtMessy <- messyDat()

Function _*```messyDat```*_ is executing a sequence of chained functions in order to arrive at the intended result.

1. Step: merge raw data (mergeTestTrain() (file _*```lib/mergetesttrain.R```*_));
2. Step: extract mean & standard deviation (extVars() (file _*```lib/extvars.R```*_));
3. Step: replace activity id with activity label/name (repIdWithLbl() (file _*```lib/repidwithlbl.R```*_));
4. Step: set variable/column names (setVarNames() (file _*```lib/setvarnames.R```*_)).

Each of these chained functions is executed with corresponding parameters passed to it.

    rc <-                    
        mergeTestTrain() %>%
        extVars(pattern="(subject_id|activity_id|\\.mean\\.\\.|\\.std\\.\\.|dataset)") %>%
        repIdWithLbl(rdActLbl(), "activity_id", "id", "activity") %>%
        setVarNames("\\1\\6_\\3", "^([a-zA-Z]+)(\\.)(mean|std)(\\.\\.)(\\.*)([a-zA-Z]*)$")

### Merging raw data

    #1: mergeTestTrain() %>%

This function is stored in file _*```lib/mergetesttrain.R```*_. What it does is reading the raw test and train data into two R objects of class _*```data.table```*_, merges these two objects, specifies an appropriate sorting/matching key, and subsequently returns the resulting data set.

    datTest <- rdTest()
    datTrain <- rdTrain()
    rc <- data.table(rbind(datTest, datTrain))
    setkey(rc, subject_id, activity_id)

|Variable|Class|Description|
|----|---------|-----------|
|subject_id|numeric|subject id|
|activity_id|factor|activity id|
|t... & f...|numeric|all the variables listed in **features.txt**, each of which representing a single column of its own|
|dataset|factor|underlying data set|

Table: Merged data set structure

|Variable|Values|
|--------|------|
|subject_id|1..30|
|activity_id|1..6|  
|t... & f...|[-1,1]|
|dataset|"test", "train"|

Table: Value ranges of variables

|Variable|Direction|
|--------|------|
|subject_id|ascending|
|activity_id|ascending|

Table: Sorting/matching key

**Note**  
When loading the raw test and train data from the corresponding files into the two R objects, the variable names are converted by calling the R function _*```make.names()```*_, hence any non-alphanumerical character (including "-", "+", ",") is getting replaced by a dot ("."), eg. _"tBodyAcc-mean()-X"_ becomes _"tBodyAcc.mean...X"_.

### Extracting mean & standard deviation variables

    #2: extVars(pattern="(subject_id|activity_id|\\.mean\\.\\.|\\.std\\.\\.|dataset)") %>%

This function is stored in file _*```lib/extvars.R```*_. The purpose of this function is to extract only the variables of interest of the recently merged data set. In case the existing sorting/matching key is becoming invalid, a new, amended one will be assigned.

    oldKey <- key(dtSrc)
    newKey <- oldKey[grep(pattern, oldKey, ignore.case=TRUE, perl=TRUE)]
    rc <- dtSrc[, .SD, .SDcols=grep(pattern, colnames(dtSrc), ignore.case=TRUE, perl=TRUE)]
    if (!is.null(newKey)) setkeyv(rc, newKey)

|Variable|Class|Description|
|----|---------|-----------|
|subject_id|numeric|subject id|
|activity_id|factor|activity id|
|t... & f...|numeric|only the variables matching ".mean.." & ".std.."|
|dataset|factor|underlying data set|

Table: Merged data set structure

|Variable|Values|
|--------|------|
|subject_id|1..30|
|activity_id|1..6|  
|t... & f...|[-1,1]|
|dataset|"test", "train"|

Table: Value ranges of variables

|Variable|Direction|
|--------|------|
|subject_id|ascending|
|activity_id|ascending|

Table: Sorting/matching key

### Replacing activity id with activity label/name

    #3: repIdWithLbl(rdActLbl(), "activity_id", "id", "activity") %>%

This function is stored in file _*```lib/repidwithlbl.R```*_. By executing this function the variable _*```activity_id```*_ is being replaced with the corresponding name of the activity (the existing variable _*```activity_id```*_ will be removed from the resulting data set). In case the existing sorting/matching key is becoming invalid, a new, amended one will be assigned.

    oldKey <- key(dtSrc)
    oldCn <- colnames(dtSrc)
    newKey <- gsub(cnSrcId, cnLblLbl, oldKey, fixed=TRUE)
    newCn <- gsub(cnSrcId, cnLblLbl, oldCn, fixed=TRUE)
    if (!is.null(cnSrcId)) setkeyv(dtSrc, cnSrcId)
    if (!is.null(cnLblId)) setkeyv(dtLbl, cnLblId)
    rc <- dtSrc[dtLbl]
    rc <- rc[, .SD, .SDcols=newCn]
    rc[, (cnLblLbl) := lapply(.SD, as.factor), .SDcols=cnLblLbl]
    if (!is.null(newKey)) setkeyv(rc, newKey)

|Variable|Class|Description|
|----|---------|-----------|
|subject_id|numeric|subject id|
|activity|factor|activity name|
|t... & f...|numeric|only the variables matching ".mean.." & ".std.."|
|dataset|factor|underlying data set|

Table: Merged data set structure

|Variable|Values|
|--------|------|
|subject_id|1..30|
|activity|"LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS"|  
|t... & f...|[-1,1]|
|dataset|"test", "train"|

Table: Value ranges of variables

|Variable|Direction|
|--------|------|
|subject_id|ascending|
|activity|ascending|

Table: Sorting/matching key

### Setting variable names

    #4: setVarNames("\\1\\6_\\3", "^([a-zA-Z]+)(\\.)(mean|std)(\\.\\.)(\\.*)([a-zA-Z]*)$")

This function is stored in file _*```lib/setvarnames.R```*_. The intention of this function is to clean up the variable names in the data set passed to it. In case the existing sorting/matching key is becoming invalid, a new, amended one will be assigned.

    oldKey <- key(dtSrc)
    oldCn <- colnames(dtSrc)
    newCn <- gsub(pattern, cnVars, oldCn, perl=TRUE)
    if (sum(oldKey %in% oldCn) > 0) newKey <- newCn[oldCn %in% oldKey]
    rc <- dtSrc
    if (!is.null(newCn)) setnames(rc, newCn)
    if (!is.null(newKey)) setkeyv(rc, newKey)

**Example**  

+ _"tBodyAcc.mean...X"_ becomes _"tBodyAccX_mean"_;
+ _"tBodyAcc.std...X"_ becomes _"tBodyAccX_std"_.

**Note**  
Only the variable names are getting modified, not the underlying data structure, hence the structure of the resulting data.table is identical to the one of the [previous step](#replace_activity_id_with_label_tidy).

## From messy data to tidy data

Having achieved the first objective, [creating the messy data set](#from_raw_to_messy_data), the next task at hand is transforming the messy data set into a tidy one. This is initiated by the main script (_*```run_analysis.R```*_) is executing the function _*```tidyDat```*_ (file _*```lib/tidydat.R```*_)

The outcome of this transformation is stored in the R object _*```dtTidy```*_ of class _*```data.table```*_.

    dtTidy <- tidyDat(dtMessy)

Function _*```tidyDat```*_ is executing a sequence of chained functions in order to arrive at the intended result.

1. Step: gather variables into key/value pairs;
2. Step: split joint variable into individual ones;
3. Step: set variable/column names;
4. Setp: set variable/column class to _*```factor```*_.

Each of these chained functions is executed with corresponding parameters passed to it.

    rc <- gather(dtMessy, 
                 feature_value_type, quantity, 
                 -c(subject_id, activity, dataset)) %>%
          separate(feature_value_type, cnSplit) %>%
          setnames(cnAll) %>%
          as.data.table()
    rc[, (cnSplit) := lapply(.SD, as.factor), .SDcols=cnSplit]

### Gathering variables into key/value pairs

    #1: gather(dtMessy, feature_value_type, quantity, -c(subject_id, activity, dataset)) %>%

By carrying out this step

|Variable|Class|Description|
|----|---------|-----------|
|subject_id|numeric|subject id|
|activity|factor|activity name|
|dataset|factor|underlying data set|
|feature_value_type|character|feature variable name|
|quantity|numeric|feature value|

Table: Merged data set structure

|Variable|Values|
|--------|------|
|subject_id|1..30|
|activity|"LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS"|  
|dataset|"test", "train"|
|feature_value_type|character|all the feature variable names found in the messy data set|
|quantity|[-1,1]|

Table: Value ranges of variables

|Variable|Direction|
|--------|------|
|NONE||

Table: Sorting/matching key

### Splitting joint variable into individual ones

    #2: separate(feature_value_type, cnSplit) %>%

By carrying out this step the joint variable _*```feature_value_type```*_ is getting split into two individual ones, namely _*```feature```*_ and _*```value_type```*_, the former containing the feature names, the latter the type of the value.

|Variable|Class|Description|
|----|---------|-----------|
|subject_id|numeric|subject id|
|activity|factor|activity name|
|dataset|factor|underlying data set|
|feature|character|feature variable name|
|value_type|character|type of value|
|quantity|numeric|feature value|

Table: Merged data set structure

|Variable|Values|
|--------|------|
|subject_id|1..30|
|activity|"LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS"|  
|dataset|"test", "train"|
|feature|character|all the feature variable names found in the messy data set, ableit without the trailing "_mean" or "_std"|
|value_type|character|"mean", "std"|
|quantity|[-1,1]|

Table: Value ranges of variables

|Variable|Direction|
|--------|------|
|NONE||

Table: Sorting/matching key

### Setting variable/column names

    #3: setnames(cnAll) %>%

By carrying out this step, each variable is getting assigned--where required--a meaningful name.

**Note**  
Only the variable names are getting modified, not the underlying data structure, hence the structure of the resulting data.table is identical to the one of the [previous step](#splitting_joint_variables_tidy).

### Setting variable/column class to _*```factor```*_

    #4: rc[, (cnSplit) := lapply(.SD, as.factor), .SDcols=cnSplit]

As a next step towards tidy data, variables _*```feature```*_ and _*```value_type```*_ are being converted to class _*```factor```*_.

**Note**  
Only the variable classes are getting modified, not the underlying data structure, hence the structure of the resulting data.table is identical to the one of the [previous step](#set_variable_names_tidy).

## Exporting the tidy data set to a file

Before submitting the various project files, the [tidy data set created in the previous step](#from_messy_to_tidy_data) will be written to a corresponding text file, which then subsequently will get submitted with the other relevant project files for evaluation and assessment.

Saving the tidy data set to a file is triggered by the main script (_*```run_analysis.R```*_) by executing the function _*```wrDat```*_ (file _*```lib/wrdat.R```*_)

The outcome of this export is stored in the file _*```UCI_HAR_Dataset_Tidy.txt```*_ in the _*```data```*_ directory.

    wrDat(dtTidy, fname=outDatBaseTidy, fext=extTXT)

Function _*```wrDat```*_ is executing a sequence of functions in order to arrive at the intended result.

1. Step: determine full filename;
2. Step: determine file handling function to faciliate;
3. Step: open connection to file for writing;
4. Setp: write data set to file;
5. Step: close connection to file written.

This approach has been taken in order to allow for an export of the tidy data set both to a **plain-text** (uncompressed) **file**, as well as a **compressed archive**.

    archfname <- fullfname
    archfun <- eval(parse(text=archfuns[1]))
    fcon <- archfun(archfname, "w")
    write.table(datSrc, fcon, row.names=FALSE)
    close(fcon)

*****
[harhome]: <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>
[hardata]: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>
