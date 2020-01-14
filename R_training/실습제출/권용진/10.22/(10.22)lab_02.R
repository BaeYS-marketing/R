#문제1
x1<-seq(10,38, 2)
m1<-matrix(x1, nrow=3)
m2<-m1+100
m_max_v<-max(m1)
m_min_v<-min(m1)
row_max <-apply(m1, 1, max)
col_max <-apply(m1, 2, max)
m1; m2; m_max_v; m_min_v; row_max; col_max

#문제2
m1<-matrix(1:9, nrow = 3)

#문제3
m2<-matrix(1:9, nrow = 3, byrow=T)

#문제4
rownames(m2) <-NULL
colnames(m2) <-NULL
rownames(m2) <-c("row1", "row2", "row3")
colnames(m2) <-c("col1", "col2", "col3")
m3<-m2
m3

#문제5
chars <- letters[1:6]
alpha<-matrix(chars, nrow = 2)
vec1<-c("x","y","z")
vec2<-c("s","p")
alpha2<-rbind(alpha,vec1); alpha2
alpha3<-cbind(alpha,vec2); alpha3

