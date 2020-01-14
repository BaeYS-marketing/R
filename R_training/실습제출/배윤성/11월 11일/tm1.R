library(tm)
library(proxy)






fruit2<- (c('사과 포도 망고',
        '포도 자몽 자두',
        '복숭아 사과 포도',
        '오렌지 바나나 복숭아',
        '포도 바나나 망고',
        '포도 귤 오렌지'))

# , = document , 자동 = term 설정 

Vcor <- VCorpus(VectorSource(fruit2))
tdm <- TermDocumentMatrix(Vcor, control=list(wordLengths = c(1, Inf)))
result<-as.matrix(tdm)


colnames(result) <-c('듀크', '둘리','또치','도우너','길동','희동')  #names : NA로 값 변경된다.
result


#co-occurrence 
final2<-result %*% t(result)

final2





dtm <- DocumentTermMatrix(Vcor, control=list(wordLengths = c(1,Inf)))
result2 <- as.matrix(dtm)
result2

rownames(result2)<-c('듀크', '둘리','또치','도우너','길동','희동')
result2


final<-result2 %*% t(result2)




"1번 답 : 듀크-또치(2), 듀크-길동(2)"








Vcor <- VCorpus(VectorSource(fruit2))
tdm <- TermDocumentMatrix(Vcor, control=list(wordLengths = c(1, Inf)))
result<-as.matrix(tdm)


colnames(result) <-c('듀크', '둘리','또치','도우너','길동','희동')  #names : NA로 값 변경된다.
result


#co-occurrence 
final2<-result %*% t(result)

final2





library(qgraph)


qgraph(final2, labels=rownames(final2), diag=F, 
       layout='spring',  edge.color='blue', 
       vsize=log(diag(final2)*800))








"2번 답 : 포도,  사과
 3번 답 : 바나나, 복숭아"






