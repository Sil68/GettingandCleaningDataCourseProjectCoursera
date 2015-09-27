# $Id$
# rdtrain.R
# =========
#
#     read train data
#
#     input value:
#         basedir ----- base directory to read files from
#
#     output value:
#         data table -- success; data table containing the train data
#         NULL -------- failure
#
# Copyright (c) Martin HEIN (m#)/September 2015
#
#     $Log$
#

rdTrain <- function(baseDir=file.path(datDir, inDatDir, inDatDirTrain)) {
    # local variable declaration
    rc <- NULL
    dtFeatLbl <- rdFeatLbl()
    fnames1 <- c("subject_train.txt", "y_train.txt", "X_train.txt")
    fnames2 <- c("body_acc_x_train.txt", "body_acc_y_train.txt", 
                 "body_acc_z_train.txt", "body_gyro_x_train.txt", 
                 "body_gyro_y_train.txt", "body_gyro_z_train.txt", 
                 "total_acc_x_train.txt", "total_acc_y_train.txt", 
                 "total_acc_z_train.txt")
    fnames <- c(file.path(baseDir, fnames1))
    cn1 <- make.names(c("subject_id", "activity_id", dtFeatLbl$feature))
    cn <- c(cn1)
    
    # read raw data
    DTlst <- lapply(fnames, read.table, header=FALSE)
    rc <- data.table(do.call('cbind', DTlst))
    setnames(rc, cn)
    setkey(rc, subject_id, activity_id)
    
    # add dataset indicator
    rc[, dataset := as.factor("train")]
    
    # return processing result
    rc
} # rdTrain

#
# end of file
#