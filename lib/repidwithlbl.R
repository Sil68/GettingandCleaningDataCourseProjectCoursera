# $Id$
# repidwithlbl.R
# ==============
#
#     replace id with label
#
#     input value:
#         dtSrc ------- data.table containing the source data
#         dtLbl ------- data.table containing the label data
#         cnSrcId ----- variable/column name(s) holding the id to replace
#         cnLblId ----- variable/column name(s) holding the id for matching
#         cnLblLbl ---- variable/column name(s) holding the label to replace 
#                       id with
#         rmSrcId ----- remove id variable/column from resulting data set?
#
#     output value:
#         data table -- success; data table containing data with replaced id(s)
#         NULL -------- failure
#
#     note:
#         :: all of dtSrc, dtLbl, cnSrcId, cnLblId, cnLblLbl have to be 
#            specified, and a non-NULL value has to be provided for each of 
#            these;
#         :: if the id variable/column gets removed, the new key will be the old
#            key but with the new variable/column instead; otherwise the old
#            key will remain.
#
# Copyright (c) Martin HEIN (m#)/September 2015
#
#     $Log$
#

repIdWithLbl <- function(dtSrc=NULL, dtLbl=NULL, cnSrcId=NULL, 
                         cnLblId=NULL, cnLblLbl=NULL, rmSrcId=TRUE) {
    # local variable declaration
    rc <- NULL
    oldKey <- NULL
    newKey <- NULL
    oldCn <- NULL
    newCn <- NULL
    
    # proceed only if all required values are provided
    if (all(!is.null(dtSrc), !is.null(dtLbl), 
            !is.null(cnSrcId), !is.null(cnLblId), !is.null(cnLblLbl))) {
        
        # backup old/current key and variable/column names
        oldKey <- key(dtSrc)
        oldCn <- colnames(dtSrc)
        
        # determine current & new key
        if (rmSrcId) {
            newKey <- gsub(cnSrcId, cnLblLbl, oldKey, fixed=TRUE)
            newCn <- gsub(cnSrcId, cnLblLbl, oldCn, fixed=TRUE)
        } else {
            newKey <- oldKey
            newCn <- c(oldCn, cnLblLbl)
        } # if/else
        
        # set sorting/matching keys
        if (!is.null(cnSrcId)) setkeyv(dtSrc, cnSrcId)
        if (!is.null(cnLblId)) setkeyv(dtLbl, cnLblId)
        
        # join data tables and drop id if requested
        rc <- dtSrc[dtLbl]
        rc <- rc[, .SD, .SDcols=newCn]
        rc[, (cnLblLbl) := lapply(.SD, as.factor), .SDcols=cnLblLbl]
        
        # set new sorting/matching key
        if (!is.null(newKey)) setkeyv(rc, newKey)
    } # if
    
    # return processing result
    rc
} # repIdWithLbl

#
# end of file
#