

#문제1

v1 <- 1:10
v1
v2 <- v1*2
v2

max_v<-max(v2)
min_v<-min(v2)
avg_v<-mean(v2)
sum_v<-sum(v2)

v3<-v2[-5]

v1;v2;v3; max_v; min_v; avg_v; sum_v



#문제3
a<-seq(1,10,2)
a

b<-rep(1,5)
b

c<-rep(c(1,2,3), time=3)
c

d<-rep(c(1,2,3,4), each=2)
d



#문제4
v3<-seq(1,10,3)
v3
names(v3)<-LETTERS[1:4]
v3



#문제5
count<- sample(1:100,7)   #smaple(?,?, replace=T __중복허용)

week.name<-c('월요일','화요일',"수요일","목요일",
             "금요일","토요일","일요일")

names(count)<-week.name
count




names(which.max(count))
names(which.min(count))

names(count[which(count>50)])


