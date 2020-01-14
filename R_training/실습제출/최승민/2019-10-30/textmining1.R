newmemo <- readLines("data/memo.txt", encoding = "UTF-8")
newmemo <- newmemo[nchar(newmemo) >0]

newmemo[1] <- gsub("&","", newmemo[1])
newmemo[1] <- gsub("!","", newmemo[1])
newmemo[1] <- gsub("#","", newmemo[1])
newmemo[1] <- gsub("@","", newmemo[1])
newmemo[1] <- gsub("%","", newmemo[1])
newmemo[1] <- gsub("$","", newmemo[1])

newmemo[2] <- gsub("e","E", newmemo[2])

newmemo[3] <- gsub("1","", newmemo[3])
newmemo[3] <- gsub("2","", newmemo[3])

newmemo[4] <- gsub("R","", newmemo[4])
newmemo[4] <- gsub("Analysis","", newmemo[4])
newmemo[4] <- gsub("Big","", newmemo[4])
newmemo[4] <- gsub("Data","", newmemo[4])

newmemo[5] <- gsub("!","", newmemo[5])
newmemo[5] <- gsub("12","", newmemo[5])
newmemo[5] <- gsub("34","", newmemo[5])
newmemo[5] <- gsub("56","", newmemo[5])
newmemo[5] <- gsub("78","", newmemo[5])
newmemo[5] <- gsub("<","", newmemo[5])
newmemo[5] <- gsub(">","", newmemo[5])

newmemo[6] <- gsub(" ","", newmemo[6])

newmemo[7] <- gsub("YOU","you", newmemo[7])
newmemo[7] <- gsub("OK","ok", newmemo[7])

newmemo

write(newmemo, "memo_new.txt")

