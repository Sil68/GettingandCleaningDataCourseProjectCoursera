# $Id$
# mergetesttrain.R
# ================
#
#     merge test and train data
#
#     input value:
#         dtTest ------ data.table containing the test data
#         dtTrain ----- data.table containing the train data
#
#     output value:
#         data table -- success; data table containing the merged data
#         NULL -------- failure
#
#     note:
#         case #1) dtTest and dtTrain are omitted -> both corresponding reading
#                  functions are executed;
#         case #2) dtTest or dtTrain are omitted -> corresponding reading
#                  function for the omitted data set is executed;
#         case #3) dtTest and dtTrain are provided -> only a merge is getting
#                  carried out.
#
# Copyright (c) Martin HEIN (m#)/September 2015
#
#     $Log$
#

mergeTestTrain <- function(dtTest=NULL, dtTrain=NULL) {
    # local variable declaration
    rc <- NULL
    datTest <- data.table(NULL)
    datTrain <- data.table(NULL)
    
    # load raw data if required
    if (is.null(dtTest) && is.null(dtTrain)) {
        datTest <- rdTest()
        datTrain <- rdTrain()
    } else if (is.null(dtTest)) {
        datTest <- rdTest()
        datTrain <- dtTrain
    } else if (is.null(dtTrain)) {
        datTest <- dtTest
        datTrain <- rdTrain()
    } else {
        datTest <- dtTest
        datTrain <- dtTrain
    } # if/else
    
    # merge datas ets
    rc <- data.table(rbind(datTest, datTrain))
    setkey(rc, subject_id, activity_id)
    
    # return processing result
    rc
} # mergeTestTrain

#
# end of file
#