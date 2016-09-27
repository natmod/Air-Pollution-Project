complete <- function(directory, id = 1:332){
    old.dir <- getwd()
    setwd(directory)
    
    #count nobs in each file
    files <- paste(formatC(id, width = 3, flag = "0"), ".csv", sep = "")
    library(data.table)
    nobs <- c()
    for (i in 1:length(files)){
        tbl <- fread(files[i])
        n <- sum(complete.cases(tbl))
        nobs[i] = n
    }
    
    #create result df 
    df <- data.frame(id, nobs)
    #colnames(df) <- c("id", "nobs")
    
    #reset wd
    setwd(old.dir)
    
    df
}
    