pollutantmean <- function(directory, pollutant, id = 1:332){
  old.dir <- getwd()
  setwd(directory)
  
  #read csv files into dataframe
  files <- paste(formatC(id, width = 3, flag = "0"), ".csv", sep = "")
  library(data.table)
  dat <- rbindlist(lapply(files,fread))
  
  #average 
  x <- mean(dat[[pollutant]], na.rm=TRUE)
  
  #reset wd
  setwd(old.dir)
  
  x
}
