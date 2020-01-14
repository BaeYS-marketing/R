vec1 <- readLines("c://Rstudy/data/memo.txt", encoding = "UTF-8")
vec1[1] <- gsub("[[:punct:]]","",vec1[1])
vec1[2] <- gsub("[[:lower:]]",replacement = "E",vec1[2])
vec1[3] <- gsub("\\d","",vec1[3])
vec1[4] <- gsub("[[:upper:][:lower:]]","",vec1[4])
vec1[5] <- gsub("[[:punct:][:digit:]]","",vec1[5])
vec1[6] <- gsub("([[:upper:]])",perl = T, replacement = "\\L\\1",vec1[6])

write.table(text,"memo_new.txt")
# perl이 뭐지?!
?gsub
