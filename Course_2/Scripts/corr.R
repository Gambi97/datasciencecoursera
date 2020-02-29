# Write a function that takes a directory of data files and a threshold 
# for complete cases and calculates the correlation between sulfate and nitrate 
# for monitor locations where the number of completely observed 
# cases (on all variables) is greater than the threshold. 
# The function should return a vector of correlations for the monitors 
# that meet the threshold requirement. 
# If no monitors meet the threshold requirement, then the function should 
# return a numeric vector of length 0

corr <- function(directory, threshold = 0){
    
    completes = complete(directory, 1:332)
    completes_above_threshold = subset(completes, nobs > threshold )
    
    ## Initialize empty vector variable
    correlations <- vector()
    
    ## Get a list of filenames
    filenames = list.files(directory)
    
    ## For each .csv file in id
    for(i in completes_above_threshold$id){
        
        ## Concatinate the directory and filename
        ## e.g. directory = "C:/folder", filenames = vector("001.csv", "002.csv", ...), filepath="C:/folder/001.csv"
        filepath=paste(directory,"/" ,filenames[i], sep="")
        
        ## read in each file and store it in data
        data_corr = read.csv(filepath, header = TRUE)
        
        ## Calculate and store the number of completed cases
        completeCases = data_corr[complete.cases(data_corr),]
        count = nrow(completeCases)
        
        ## Calculate and store the count of complete cases
        ## if threshhold is reached
        if( count >= threshold ) {
            correlations = c(correlations, cor(completeCases$nitrate, completeCases$sulfate) )
        }
    }
    correlations
}
corr('/home/matteo/Scrivania/datasciencecoursera/Course_2/Data/specdata',100)
# Test
#source("corr.R")
#source("complete.R")
cr <- corr('/home/matteo/Scrivania/datasciencecoursera/Course_2/Data/specdata', 150)
head(cr)

cr <- corr('/home/matteo/Scrivania/datasciencecoursera/Course_2/Data/specdata')                
cr <- sort(cr)   
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

cr <- corr('/home/matteo/Scrivania/datasciencecoursera/Course_2/Data/specdata', 129)                
cr <- sort(cr)                
n <- length(cr)    
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

cr <- corr('/home/matteo/Scrivania/datasciencecoursera/Course_2/Data/specdata', 2000)                
n <- length(cr)                
cr <- corr('/home/matteo/Scrivania/datasciencecoursera/Course_2/Data/specdata', 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))