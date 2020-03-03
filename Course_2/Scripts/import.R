data <- read.csv("/home/matteo/Scrivania/datasciencecoursera/Course_2/Data/getdata_data_ss06hid.csv")
# conto quelle con valore maggiore di 1mln == >=24
data_worth <- nrow(subset(data, VAL == 24))
fes <- data[,"FES"]
class(data)
str(data)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
fname <- "GAP.xlsx"
download_if_not_exists(fname, "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx")
data <- read.xlsx(fname)

fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile = paste0(getwd(), '/getdata%2Fdata%2FDATA.gov_NGAP.xlsx'), method = "curl")

dat <- xlsx::read.xlsx(file = "getdata%2Fdata%2FDATA.gov_NGAP.xlsx", sheetIndex = 1, rowIndex = 18:23, colIndex = 7:15)
sum(dat$Zip*dat$Ext,na.rm=T)