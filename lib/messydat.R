# $Id$
# messydat.R
# ==========
#
#     create (merge) messy data from raw data
#
#     input value:
#         NONE
#
#     output value:
#         data table -- success; data table containing the messy data
#         NULL -------- failure
#
# Copyright (c) Martin HEIN (m#)/September 2015
#
#     $Log$
#

messyDat <- function() {
    # local variable declaration
    rc <- NULL

    # load raw data if required
    rc <-                    
        mergeTestTrain() %>%                                                                    # Step #1: merge raw data
        extVars(pattern="(subject_id|activity_id|\\.mean\\.\\.|\\.std\\.\\.|dataset)") %>%      # Step #2: extract mean & standard deviation
        repIdWithLbl(rdActLbl(), "activity_id", "id", "activity") %>%                           # Step #3: replace activity id with activity label/name
        setVarNames("\\1\\6_\\3", 
                    "^([a-zA-Z]+)(\\.)(mean|std)(\\.\\.)(\\.*)([a-zA-Z]*)$")                    # Step #4: set variable/column names
    
    # return processing result
    rc
} # messyDat

#
# end of file
#