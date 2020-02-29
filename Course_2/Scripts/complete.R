# Write a function that reads a directory full of files and reports the number 
# of completely observed cases in each data file. 
# The function should return a data frame where the first column 
# is the name of the file and the second column is the number of complete cases.

complete <- function(directory, id = 1:332){
    
    # Creo vettore vuoti per gli id
    ids = c()
    
    # Creo un vettore vuoto per i nobs
    nobs = c()
    
    # Ottengo la lista dei nomi dei file cvs
    filenames = list.files(directory)
    
    for(i in id){
        
        # La funzione paste concatena vettori dopo averli convertiti in caratteri
        # Esempio directory = "C:/User/cartella", filenames = vector("001.csv",...)
        # il filepath="C:/User/cartella/001.csv" che ne esce
        filepath=paste(directory,"/" ,filenames[i], sep="")
        
        # Legge ogni file e inserisci i dati in data
        data_nobs = read.csv(filepath, header = TRUE)
        
        # Get a subset of all rows with complete data meaning no NA's
        # completeCases = subset(data, !is.na(Date) & !is.na(sulfate) & !is.na(nitrate) & !is.na(id),select = TRUE )
        completeCases = data_nobs[complete.cases(data_nobs), ]
        
        ids =  c(ids, i)                 
        nobs = c(nobs, nrow(completeCases))
        
    }
    
    # Return the data frame
    data_nobs.frame(id=ids, nobs=nobs)
    
}

# Test
complete('/home/matteo/Scrivania/datasciencecoursera/Course_2/Data/specdata', 54)

set.seed(42)
cc <- complete('/home/matteo/Scrivania/datasciencecoursera/Course_2/Data/specdata',332:1)
use <- sample(332,10)
print(cc[use,"nobs"])



