mm <- readLines("data/memo.txt",encoding="UTF-8")
mm
mm <- mm[nchar(mm)>0]
mm

# [1]
mm[1] <- gsub("&","",mm[1])
mm[1] <- gsub("\\$","",mm[1])
mm[1] <- gsub("#","",mm[1])
mm[1] <- gsub("!","",mm[1])
mm[1] <- gsub("#","",mm[1])
mm[1] <- gsub("@","",mm[1])
mm[1] <- gsub("%","",mm[1])
mm

#[2]
mm[2] <- gsub("e","E",mm[2])
mm

#[3]
mm[3] <- gsub("2","",mm[3])
mm[3] <- gsub("1","",mm[3]) 
mm

#[4]
mm[4] <- gsub("R","",mm[4])
mm [4]<- gsub("Analysis","",mm[4])
mm[4] <- gsub("Big","",mm[4])
mm[4] <- gsub("Data","",mm[4])
mm

#[5]
mm[5] <- gsub("!","",mm[5])
mm[5] <- gsub("12","",mm[5])
mm[5] <- gsub("34","",mm[5])
mm[5] <- gsub("56","",mm[5])
mm[5] <- gsub("78","",mm[5])
mm[5] <- gsub("<","",mm[5])
mm[5] <- gsub(">","",mm[5])
mm

#[6]
mm[6] <- gsub(" ", "",mm[6])
mm

#[7]
mm[7] <- gsub("YOU","you",mm[7])
mm[7] <- gsub("OK","ok",mm[7])
mm

write(mm,"memo_new.txt")
