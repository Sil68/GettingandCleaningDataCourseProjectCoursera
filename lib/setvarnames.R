# $Id$
# setvarnames.R
# =============
#
#     set variable/column names
#
#     input value:
#         dtSrc ------- data.table containing the source data
#         cnVars ------ vector of new variable/column names
#         pattern ----- pattern of variables to extract
#
#     output value:
#         data table -- success; data table containing data with new variable/
#                       column names assigned
#         NULL -------- failure
#
#     note:
#         :: dtSrc and cnVars have to be provided, and assigned a non-NULL value
#            respectively;
#         :: if cnVars contains less elements than dtSrc variables/columns,
#            the remining, missing elements will be taken from the current
#            variables/columns of dtSrc;
#         :: if cnVars contains more elements than dtSrc variables/columns,
#            only the first elements up to the number of elements of the current
#            variables/columns of dtSrc will be taken;
#         :: if pattern is also provided (and non-NULL), all variable/column
#            names matching the pattern will be amended by replacing the matched
#            pattern with the content of cnVars;
#         :: any exsting sorting/matching key will be amended accordingly.
#
# Copyright (c) Martin HEIN (m#)/September 2015
#
#     $Log$
#

setVarNames <- function(dtSrc=NULL, cnVars=NULL, pattern=NULL) {
    # local variable declaration
    rc <- NULL
    oldKey <- NULL
    newKey <- NULL
    oldCn <- NULL
    newCn <- NULL
    
    # proceed only if all required values are provided
    if (all(!is.null(dtSrc), !is.null(cnVars))) {
        
        # backup old/current key and variable/column names
        oldKey <- key(dtSrc)
        oldCn <- colnames(dtSrc)
        
        # fixed substitution
        if (is.null(pattern)) {
            if (length(oldCn) == length(cnVars)) {
                newCn <- cnVars
            } else if (length(oldCn) > length(cnVars)) {
                newCn <- c(cnVars, oldCn[(length(cnVars)+1):length(oldCn)])
            } else {
                newCn <- cnVars[1:length(oldCn)]
            } # if/else
            
        # pattern substitution
        } else {
            newCn <- gsub(pattern, cnVars, oldCn, perl=TRUE)
        } # if/else
        
        # assign new variable/columns names and set sorting/matching key
        if (sum(oldKey %in% oldCn) > 0) {
            newKey <- newCn[oldCn %in% oldKey]
        } # if
        
        rc <- dtSrc
        if (!is.null(newCn)) setnames(rc, newCn)
        if (!is.null(newKey)) setkeyv(rc, newKey)
    } # if
    
    # return processing result
    rc
} # setVarNames

#
# end of file
#