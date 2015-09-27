# $Id$
# rdactlbl.R
# ==========
#
#     read activity label data
#
#     input value:
#         basedir ----- base directory to read files from
#
#     output value:
#         data table -- success; data table containing the activity label data
#         NULL -------- failure
#
# Copyright (c) Martin HEIN (m#)/September 2015
#
#     $Log$
#

rdActLbl <- function(baseDir=file.path(datDir, inDatDir)) {
    # local variable declaration
    rc <- NULL
    fname <- file.path(baseDir, "activity_labels.txt")
    cn <- c("id", "activity")
    
    # read raw data
    if (file.exists(fname)) {
        rc <- fread(fname, header=FALSE)
        setnames(rc, cn)
        setkey(rc, id)
    } # if
    
    # return processing result
    rc
} # rdActLbl

#
# end of file
#