#문제1
L1<-list(name="scott", sal=3000)
L1
result1<-l1$sal[[1]]*2
#문제2
L2<-list("scott",c(100,200,300))
#문제3
L3<-list(c(3,5,7), c("A", "B", "C"))
L3[[2]][[1]]<-"Alpha"
#문제4
L4<-list(alpha=0:4, beta=sqrt(1:5), gamma=log(1:5))
L4$alpha+10
#문제5
L5<-list(math=list(95, 90), writing=list(90, 85), reading=list(85, 80))
math<-unlist(L5$math)
writing<-unlist(L5$writing)
reading<-unlist(L5$reading)
mean(math)
mean(writing)
mean(reading)
#문제6
time<-32150
hour<-time %/% 3600
min<-(time %% 3600)%/%60
sec<-((time %% 3600)%%60)
paste(hour,"시간",min,"분",sec,"초")

