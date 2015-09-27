# $Id$
# extvars.R
# =========
#
#     extract specific variable from data set
#
#     input value:
#         dtSrc ------- data.table containing the source data
#         vars -------- vector of variables to extract
#         pattern ----- pattern of variables to extract
#
#     output value:
#         data table -- success; data table containing the extracted data only
#         NULL -------- failure
#
#     note:
#         if both vars and pattern are non-NULL, only vars will be taken into
#         account
#
# Copyright (c) Martin HEIN (m#)/September 2015
#
#     $Log$
#

extVars <- function(dtSrc=NULL, vars=NULL, pattern=NULL) {
    # local variable declaration
    rc <- NULL
    oldKey <- NULL
    newKey <- NULL
    
    # extract variables
    if (!is.null(dtSrc))  {
        oldKey <- key(dtSrc)
        
        # variable names specified
        if (!is.null(vars)) {
            newKey <- oldKey[vars %in% oldKey]
            rc <- dtSrc[, .SD, .SDcols=vars]
            
            # pattern specified
        } else if (!is.null(pattern)) {
            newKey <- oldKey[grep(pattern, oldKey, ignore.case=TRUE, perl=TRUE)]
            rc <- dtSrc[, .SD, .SDcols=grep(pattern, colnames(dtSrc), 
                                            ignore.case=TRUE, perl=TRUE)]
        } # if
        
        # set new key
        if (!is.null(newKey)) setkeyv(rc, newKey)
    } # if
    
    # return processing result
    rc
} # extVars

#
# end of file
#