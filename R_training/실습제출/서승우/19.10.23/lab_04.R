#문제1
L1<- list(name="scott",
          sal=3000)
result1<- L1[["sal"]]*2

#문제2
L2<- list(c("scott"),
          c(100,200,300))

#문제3
L3<- list(c(3,5,7),
          c("A","B","C"))
L3[[2]][1]<-"Alpha"

#문제4
L4<-list(alpha=0:4, 
         beta=sqrt(1:5),
         gamma=log(1:5))
L4[["alpha"]]<-L4[["alpha"]]+10

#문제5
L5<-list(math=list(95,90),
         writing=list(90,85),
         reading=list(85,80))
math <- unlist(L5[[1]])
math_sum<-sum(math)
writing<-unlist(L5[[2]])
writing_sum<-sum(writing)
reading<-unlist(L5[[3]])
reading_sum<-sum(reading)
all_avg<-(math_sum+writing_sum+reading_sum)/6

#문제6
time<-32150
a<- time%%60
b<-(time%/%60)%%60
c<-(time%/%60)%/%60
paste(c, "시간", "", b,"분", "",a, "초")
