data <-readLines("data/memo.txt", encoding="UTF-8")
data
data <- data[nchar(data)>0]
data

data <- gsub("&","",data)
data <- gsub("#","",data)
data <- gsub("@","",data)
data <- gsub("%","",data)
data <- gsub("!","",data)
data <- gsub('","data"',"",data)
data <- gsub("1","",data)
data <- gsub("2","",data)
data <- gsub("3","",data)
data <- gsub("4","",data)
data <- gsub("5","",data)
data <- gsub("6","",data)
data <- gsub("7","",data)
data <- gsub("8생각하며","생각하며",data)
data <- gsub("data","",data)
data <- gsub(",","",data)
data <- gsub("OK","ok",data)
data <- gsub("<일어>","일어",data)
data <- gsub("e","E",data)
is.numeric<-NULL
data <- gsub("R ","",data)
data <- gsub("Data","",data)
data <- gsub("Big","",data)
data <- gsub("Analysis","",data)
data <- gsub(" $","",data)

page <- data.frame(data)
write.csv(page, "memo_new.txt")
