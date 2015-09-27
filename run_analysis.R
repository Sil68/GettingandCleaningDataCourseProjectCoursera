# $Id$
# run_analysis.R
# ==============
#
#     The purpose of this project is to demonstrate your ability to collect, 
#     work with, and clean a data set. The goal is to prepare tidy data that 
#     can be used for later analysis. You will be graded by your peers on a 
#     series of yes/no questions related to the project. You will be required 
#     to submit: 
#
#         1) a tidy data set as described below, 
#         2) a link to a Github repository with your script for performing 
#            the analysis, and 
#         3) a code book that describes the variables, the data, and any 
#            transformations or work that you performed to clean up the 
#            data called CodeBook.md.
#         4) You should also include a README.md in the repo with your 
#            scripts. This repo explains how all of the scripts work and how 
#            they are connected.  
#
#     One of the most exciting areas in all of data science right now is 
#     wearable computing - see for example this article . Companies like 
#     Fitbit, Nike, and Jawbone Up are racing to develop the most advanced 
#     algorithms to attract new users. The data linked to from the course 
#     website represent data collected from the accelerometers from the 
#     Samsung Galaxy S smartphone. A full description is available at the site 
#     where the data was obtained: 
# 
#         http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
#
#     Here are the data for the project: 
# 
#         https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#
#     You should create one R script called run_analysis.R that does the 
#     following. 
#
#         1) Merges the training and the test sets to create one data set.
#         2) Extracts only the measurements on the mean and standard deviation 
#            for each measurement. 
#         3) Uses descriptive activity names to name the activities in the 
#            data set
#         4) Appropriately labels the data set with descriptive variable names. 
#         5) From the data set in step 4, creates a second, independent tidy 
#            data set with the average of each variable for each activity and 
#            each subject.
#
#     Good luck!
#
# Copyright (C) Martin HEIN (m#)/Septebmer 2015
#
#     $Log$
#

######################################################################
######################################################################
### SECTION 01: libraries                                          ###
######################################################################
######################################################################
library(RCurl)
library(gdata)
library(data.table)
library(dplyr)
library(tidyr)
library(microbenchmark)

######################################################################
######################################################################
### SECTION 02: global contants & variables (objects/items)        ###
######################################################################
######################################################################
extCSV <- "csv"
extTSV <- "tsv"
extTXT <- "txt"
extZIP <- "zip"

docDir <- "doc"
datDir <- "data"

inDatRawZip <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
inDatDir <- "UCI HAR Dataset"
inDatDirTest <- "test"
inDatDirTestSub <- "Inertial Signals"
inDatDirTrain <- "train"
inDatDirTrainSub <- "Inertial Signals"

outDatBase <- "UCI_HAR_Dataset"
outDatBaseMessy <- paste(outDatBase, "Messy", sep="_")
outDatBaseTidy <- paste(outDatBase, "Tidy", sep="_")

dtMessy <- data.table(NULL)
dtTidy <- data.table(NULL)

######################################################################
######################################################################
### SECTION 03: functions                                          ###
######################################################################
######################################################################

source("lib/chkdir.R")
source("lib/dldat.R")
source("lib/rdactlbl.R")
source("lib/rdfeatlbl.R")
source("lib/rdtest.R")
source("lib/rdtrain.R")
source("lib/mergetesttrain.R")
source("lib/extvars.R")
source("lib/repidwithlbl.R")
source("lib/setvarnames.R")
source("lib/messydat.R")
source("lib/tidydat.R")
source("lib/wrdat.R")

######################################################################
######################################################################
### SCETION 04: main entry point                                   ###
######################################################################
######################################################################

## check for required directories
if (chkDir(c(docDir, datDir))) {
    
    ## download raw data
    if (dlDat(inDatRawZip, fname=basename(inDatRawZip), exp=TRUE, redl=FALSE)) {

        ## Step #01-#04: load & process raw (messy) data
        dtMessy <- messyDat()

        ## Step #05: create tidy data set based on step #4
        dtTidy <- tidyDat(dtMessy)

        ## Step #06: write data sets to file
        wrDat(dtMessy, fname=outDatBaseMessy, fext=extTXT)
        wrDat(dtTidy, fname=outDatBaseTidy, fext=extTXT)
    } # if
} # if

#
# end of file
#