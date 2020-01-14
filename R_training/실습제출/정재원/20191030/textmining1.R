memo<-readLines("data/memo.txt", encoding = "UTF-8")
memo<-memo[nchar(memo)>0]
memo[1]<-gsub("[&$!#@%]","",memo[1])
memo[2]<-toupper(memo[2])
memo[3]<-gsub("[0-9]","",memo[3])
memo[4]<-gsub("[A-Za-z]","",memo[4])
memo[5]<-gsub("[0-9<>!]","",memo[5])
memo[6]<-gsub("\\s","",memo[6])
memo[7]<-tolower(memo[7])
memo
write(memo,"data/memo_new.txt")