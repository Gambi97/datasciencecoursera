# funzione che estrae i dati di inquinamneto da 332 file csv
# e calcola la media ignorando i valori mancanti
pollutantmean <- function(directory, pollutant, id = i:332){
    
    # inizializzo a 0 un vettore che conterrà gli inquinanti
    pollutants= c()
    
    # Ottengo la lista dei nomi dei file cvs
    filenames = list.files(directory)
    
    
    # Per ogni file cvs
    for(i in id){
        
        # La funzione paste concatena vettori dopo averli convertiti in caratteri
        # Esempio directory = "C:/User/cartella", filenames = vector("001.csv",...)
        # il filepath="C:/User/cartella/001.csv" che ne esce
        filepath=paste(directory,"/" ,filenames[i], sep="")
        
        # Legge ogni file e inserisci i dati in data
        data_pollution = read.csv(filepath, header = TRUE)
        
        # Concatena i vettori di ogni file csv dei pollutant('sulfate' or 'nitrate') 
        pollutants = c(pollutants, data_pollution[,pollutant])
    }
    
    # Calcolo la media dei valori contenuti nel vettore, rimuovento i valori NA
    pollutant_mean = mean(pollutants , na.rm = TRUE)
    
    #Restituisco il vettore delle medie 
    pollutant_mean
  
}

# Test
pollutantmean('/home/matteo/Scrivania/datasciencecoursera/Course_2/Data/specdata', "nitrate", 1:332)
pollutantmean('/home/matteo/Scrivania/datasciencecoursera/Course_2/Data/specdata', "sulfate", 34)




