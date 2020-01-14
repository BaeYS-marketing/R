memo<-readLines("C:/Rstudy/문서/10월30일/memo.txt",encoding="UTF-8")
memo
memo<-memo[nchar(memo)>0]
memo

memo[1]<-gsub("&","",memo[1])
memo[1]<-gsub("(\\$)","",memo[1])
memo[1]<-gsub("!","",memo[1])
memo[1]<-gsub("#","",memo[1])
memo[1]<-gsub("@","",memo[1])
memo[1]<-gsub("%","",memo[1])

memo[2]<-gsub("e","E",memo[2])

memo[3]<-gsub("1","",memo[3])
memo[3]<-gsub("2","",memo[3])

memo[4]<-gsub("R","",memo[4])
memo[4]<-gsub("Analysis","",memo[4])
memo[4]<-gsub("Big","",memo[4])
memo[4]<-gsub("Data","",memo[4])
memo[4]<-gsub("  "," ",memo[4])

memo[5]<-gsub("!","",memo[5])
memo[5]<-gsub("12","",memo[5])
memo[5]<-gsub("34","",memo[5])
memo[5]<-gsub("56","",memo[5])
memo[5]<-gsub("78","",memo[5])
memo[5]<-gsub("<","",memo[5])
memo[5]<-gsub(">","",memo[5])

memo[6]<-gsub(" ","",memo[6])

memo[7]<-gsub("YOU","you",memo[7])
memo[7]<-gsub("OK","ok",memo[7])
memo[7]<-gsub("  "," ",memo[7])


memo
write(memo,"memo_new.txt")



