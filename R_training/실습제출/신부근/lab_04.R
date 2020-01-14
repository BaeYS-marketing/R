#문제1
L1<-list("scott",3000)
names(L1)<-c("name","sal")
result1<-L1[[2]]*2

#문제2
L2<-list("scott",c(100,200,300))

#문제3
L3<-list(c(3,5,7), c("A","B","C"))
L3[[2]][1]<-"Alpha"

#문제4
L4<-list(alpha=0:4, beta=sqrt(1:5), gamma=log(1:5))
L4[[1]]*10

#문제5
L5<-list(math=list(95, 90), writing=list(90, 85), reading=list(85, 80))
mean(unlist(L5["math"]))
mean(unlist(L5["writing"]))
mean(unlist(L5["reading"]))

#문제6
times<-32150
times2<-c(32150%/%3600,(32150%%3600)%/%60,(32150%%3600)%%60)
times3<-c("시간","분","초")
paste(times2,times3)

