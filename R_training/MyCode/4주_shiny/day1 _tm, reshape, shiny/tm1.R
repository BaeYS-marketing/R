library(tm)
library(proxy)


#이렇게 하는 거 아니야.
"듀크 <-c('사과', '포도', '망고')
둘리 <-c( '포도', '자몽', '자두')
또치 <-c( '복숭아', '사과', '포도')
도우너 <-c( '오렌지', '바나나', '복숭아' )
길동 <-c( '포도', '바나나', '망고' )
희동 <-c( '포도','귤', '오렌지' )"





#시작_ 데이터셋 설정 

fruit2<- (c('사과 포도 망고',
        '포도 자몽 자두',
        '복숭아 사과 포도',
        '오렌지 바나나 복숭아',
        '포도 바나나 망고',
        '포도 귤 오렌지'))

# , = document , 자동 = term 설정 


#코퍼스 설정
Vcor <- VCorpus(VectorSource(fruit2))



#DTM 설정
dtm <- DocumentTermMatrix(Vcor, control=list(wordLengths = c(1,Inf)))
result2 <- as.matrix(dtm)
result2


#네이밍
rownames(result2)<-c('듀크', '둘리','또치','도우너','길동','희동')
result2


#출력
final<-result2 %*% t(result2)




"1번 답 : 듀크-또치(2), 듀크-길동(2)"







#코퍼스 설정
Vcor <- VCorpus(VectorSource(fruit2))


#TDM 설정
tdm <- TermDocumentMatrix(Vcor, control=list(wordLengths = c(1, Inf)))
result<-as.matrix(tdm)


#네이밍
colnames(result) <-c('듀크', '둘리','또치','도우너','길동','희동')  #names : NA로 값 변경된다.
result


#출력 co-occurrence 
final2<-result %*% t(result)


#########
"이렇게 따로 안해도 되고, final2 <- t(result2) %*% result 하면 됐었다...!!!!!!"

final2





library(qgraph)


qgraph(final2, labels=rownames(final2), diag=F, 
       layout='spring',  edge.color='blue', 
       vsize=log(diag(final2)*800))








"2번 답 : 포도,  사과"


###########
#코딩으로 할 수 있었다. : head(sort(rowSums(result), dercreasing =T),1)


 "3번 답 : 바나나, 복숭아"






