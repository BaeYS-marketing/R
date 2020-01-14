#문제1
v1<-seq(10,38, by=2)
v1
m1<-matrix(v1,nrow=3, ncol=5, byrow=TRUE)
m2 <- m1+100
m_max_v <- max(m1)
m_min_v <- min(m1)
row_max<-apply(m1,1,max)
row_min<-apply(m1,2,min)
m1
m2
m_max_v
m_min_v
row_max
row_min
#문제2
n1<-c(1,2,3)
n2<-c(4,5,6)
n3<-c(7,8,9)
m1<-cbind(n1,n2,n3)
m1
#문제3
m2<-matrix(1:9,nrow=3,ncol=3,byrow=TRUE)
m2
#문제4
rownames(m2)<-c("row1","row2","row3")
colnames(m2)<-c("col1","col2","col3")
m2
#문제5
alpha<-matrix(chars,nrow=2,ncol=3)
v2<-c("x","y","z")
alpha2<-rbind(alpha,v2)
alpha2
v3<-c("s","p")
alpha3<-cbind(alpha,v3)
alpha3