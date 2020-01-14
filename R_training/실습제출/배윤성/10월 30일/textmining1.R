
getwd()
text <- readLines('C:/Rstudy/data/memo.txt', encoding = 'UTF-8')
View(text)

data <- text[nchar(text)>0]            #nchar 함수 이용_ 공백제거 
data
View(data)




data[1]
#gsub(c('&','$','@','%','#'),'',data[1])  하나씩 해야된다.
data[1]<-gsub('&','',data[1])
data[1]<-gsub('$','',data[1])
data[1]<-gsub('@','',data[1])
data[1]<-gsub('%','',data[1])
data[1]<-gsub('#','',data[1])
data[1]<-gsub('!','',data[1])

data[1] <- gsub('[[:punct:]]','',data[1])




data[2]
data[2]<-toupper(data[2])


data[3]
data[3] <- gsub('1','',data[3])
data[3] <- gsub('2','',data[3])



data[4]
data[4] <- gsub(' R','',data[4])
data[4] <- gsub('Analysis','',data[4])
data[4] <- gsub('Big인정Data','인정',data[4])


data[5]
data[5] <- gsub('!','',data[5])
data[5] <- gsub('12','',data[5])
data[5] <- gsub('34','',data[5])
data[5] <- gsub('56','',data[5])
data[5] <- gsub('78','',data[5])
data[5] <- gsub('<일어>','일어',data[5])


data[6]
data[6] <- gsub(' ','',data[6])


data[7]
data[7] <-tolower(data[7])


write(data,'memo_new.txt ')

