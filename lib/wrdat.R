# $Id$
# wrdat.R
# =======
#
#     write data set to file
#
#     input value:
#         dtSrc ------- data.table containing the source data
#         basedir ----- base directory to write files to
#         fname ------- filename of output file
#         fext -------- file extension of output file
#         arch -------- archive/compress (zip) written file?
#         archtype ---- archive/compress type (bz, gz, zip [default])
#
#     output value:
#         TRUE ---- success; data set has been successfully written to file
#         FALSE --- failure; data set couldn't be written to file
#
#     note:
#         :: at least dtSrc and fname have to be provided, and containing
#            a non-NULL value;
#         :: if outfile is already existing it will get overwritten.
#
# Copyright (c) Martin HEIN (m#)/September 2015
#
#     $Log$
#

wrDat <- function(datSrc=NULL, baseDir=file.path(datDir), fname=NULL,
                  fext=NULL, arch=FALSE, archtype="zip") {
    # local variable declaration
    rc <- FALSE
    archtypes <- c("none", "bz", "gz", "zip")
    archext <- c("", "bz2", "gz", "zip")
    archfuns <- if(.Platform$OS.type == "windows") 
                    c("file", "bzfile", "gzfile", "gzfile") else
                    c("file", "bzfile", "gzfile", "zip")    
    archidx <- if (length(which(archtypes %in% archtype)) > 0) 
                    which(archtypes %in% archtype) else NULL
    ofinfo <- NULL
    nfinfo <- NULL
    fullfname <- NULL
    archfname <- NULL

    # write data set to file
    if (all(!is.null(datSrc), !is.null(fname))) {
        
        # determine full filename
        fullfname <- file.path(
            if (!is.null(baseDir)) baseDir else ".",
            paste(fname, fext, sep=(if (!is.null(fext)) "." else ""))
        )
        
        # determine archive mode, function, and filename
        if ((archtype == archtypes[1]) || is.null(archtype) || 
            is.null(archidx) || (!arch)) {
            archfname <- fullfname
            archfun <- eval(parse(text=archfuns[1]))
        } else {
            archfname <- paste(fullfname, archext[archidx], 
                               sep=".")
            archfun <- eval(parse(text=archfuns[archidx]))
        } # if/else
        
        # write file
        ofinfo <- file.info(archfname)

        fcon <- archfun(archfname, "w")
        write.table(datSrc, fcon, row.names=FALSE)
        close(fcon)

        nfinfo <- file.info(archfname)
        
        rc <- !identical(ofinfo, nfinfo)
    } # if

    # return processing result
    rc
} # wrDat

#
# end of file
#