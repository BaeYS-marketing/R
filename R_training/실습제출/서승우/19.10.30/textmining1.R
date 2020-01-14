words<-readLines('data/memo.txt', encoding="UTF-8")
words
words<-words[nchar(words)>0]
words



words[1]<-gsub('&', "", words[1])
words[1]<-gsub('$', "", words[1])
words[1]<-gsub('!', "", words[1])
words[1]<-gsub('#', "", words[1])
words[1]<-gsub('@', "", words[1])
words[1]<-gsub('%', "", words[1])

words[2]<-gsub('e','E',words[2])

words[3]<-gsub('1,',"",words[3])
words[3]<-gsub('2', "", words[3])

words[4]<-gsub('R', "", words[4])
words[4]<-gsub('Analysis', "", words[4])
words[4]<-gsub('Big', "", words[4])
words[4]<-gsub('Data', "", words[4])

words[5]<-gsub('!', "", words[5])
words[5]<-gsub('12', "", words[5])
words[5]<-gsub('34', "", words[5])
words[5]<-gsub('56', "", words[5])
words[5]<-gsub('78', "", words[5])
words[5]<-gsub('<', "", words[5])
words[5]<-gsub('>', "", words[5])

words[6]<-gsub(' ', "", words[6])

words[7]<-gsub('OK', "ok", words[7])

write(words, file="memo_new.txt")
