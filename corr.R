corr <- function(directory, threshold = 0) {
    
    #calculate complete cases
    compl <- complete(directory)
    
    #set wd
    old.dir <- getwd()
    setwd(directory)
    
    #load files
    id = 1:332
    files <- paste(formatC(id, width = 3, flag = "0"), ".csv", sep = "")
    library(data.table)
    
    #test threshold and store in result
    result <- c()
    for (i in 1:length(files)){
        if (compl[i,2] > threshold){
            tbl <- fread(files[i])
            result <- c(result, cor(tbl[["sulfate"]], tbl[["nitrate"]], use = "complete.obs"))
        }
    }
    #reset wd
    setwd(old.dir)
    
    result
}