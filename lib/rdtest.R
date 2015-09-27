# $Id$
# rdtest.R
# ========
#
#     read test data
#
#     input value:
#         basedir ----- base directory to read files from
#
#     output value:
#         data table -- success; data table containing the test data
#         NULL -------- failure
#
# Copyright (c) Martin HEIN (m#)/September 2015
#
#     $Log$
#

rdTest <- function(baseDir=file.path(datDir, inDatDir, inDatDirTest)) {
    # local variable declaration
    rc <- NULL
    dtFeatLbl <- rdFeatLbl()
    fnames1 <- c("subject_test.txt", "y_test.txt", "X_test.txt")
    fnames2 <- c("body_acc_x_test.txt", "body_acc_y_test.txt", 
                 "body_acc_z_test.txt", "body_gyro_x_test.txt", 
                 "body_gyro_y_test.txt", "body_gyro_z_test.txt", 
                 "total_acc_x_test.txt", "total_acc_y_test.txt", 
                 "total_acc_z_test.txt")
    fnames <- c(file.path(baseDir, fnames1))
    cn1 <- make.names(c("subject_id", "activity_id", dtFeatLbl$feature))
    cn <- c(cn1)
    
    # read raw data
    DTlst <- lapply(fnames, read.table, header=FALSE)
    rc <- data.table(do.call('cbind', DTlst))
    setnames(rc, cn)
    setkey(rc, subject_id, activity_id)
    
    # add data set indicator
    rc[, dataset := as.factor("test")]
    
    # return processing result
    rc
} # rdTest

#
# end of file
#