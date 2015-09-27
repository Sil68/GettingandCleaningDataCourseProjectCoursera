# $Id$
# tidydat.R
# =========
#
#     tidy up messy data
#
#     input value:
#         dtMessy ----- data.table containing the test data
#
#     output value:
#         data table -- success; data table containing the tidy data
#         NULL -------- failure
#
# Copyright (c) Martin HEIN (m#)/September 2015
#
#     $Log$
#

tidyDat <- function(dtMessy=NULL) {
    # local variable declaration
    rc <- NULL
    cnSplit <- NULL
    cnKey <- NULL
    cnAll <- NULL

    # load raw data if required
    if (!is.null(dtMessy)) {
        cnSplit <- c("feature", "value_type")
        cnKey <- c("subject_id", "activity", "dataset", cnSplit)
        cnAll <- c(cnKey, "value")
        
        rc <- gather(dtMessy, 
                     feature_value_type, quantity, 
                     -c(subject_id, activity, dataset)) %>%
              separate(feature_value_type, cnSplit) %>%
              setnames(cnAll) %>%
              as.data.table()
        
        rc[, (cnSplit) := lapply(.SD, as.factor), .SDcols=cnSplit]
        if (!is.null(cnKey)) setkeyv(rc, cnKey)
    } # if
    
    # return processing result
    rc
} # tidyDat

#
# end of file
#