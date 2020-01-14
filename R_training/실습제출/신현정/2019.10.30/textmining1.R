data <-readLines("data/memo.txt", encoding="UTF-8")
data

data <- data[nchar(data)>0]
data

data[1] <-gsub("[[:punct:]]","",data[1])
data[1]

data[2] <-gsub("e","E",data[2])

data[2]

data[3] <-gsub("[[:digit:]]","",data[3])
data[3]

data[4] <-gsub("[RAnalysisBigData]","",data[4])
data[4]


data[5] <-gsub("[!12346578<>]","",data[5])
data[5]

data[6]  <-gsub(" ","",data[6] )
data[6]

data[7] <-gsub("[[:lower:]]","",data[7])
data[7]


write.csv(data, "memo_new.txt")