# $Id$
# rdfeatlbl.R
# ===========
#
#     read feature label data
#
#     input value:
#         basedir ----- base directory to read files from
#
#     output value:
#         data table -- success; data table containing the feature label data
#         NULL -------- failure
#
# Copyright (c) Martin HEIN (m#)/September 2015
#
#     $Log$
#

rdFeatLbl <- function(baseDir=file.path(datDir, inDatDir)) {
    # local variable declaration
    rc <- NULL
    fname <- file.path(baseDir, "features.txt")
    cn <- c("id", "feature")
    
    # read raw data
    if (file.exists(fname)) {
        rc <- fread(fname, header=FALSE)
        setnames(rc, cn)
        setkey(rc, id)
    } # if
    
    # return processing result
    rc
} # rdFeatLbl

#
# end of file
#