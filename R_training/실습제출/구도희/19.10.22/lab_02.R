# 문제1
seq(10,38,2)
m1 <- matrix(seq(10,38,2), nrow=3, ncol=5, byrow=T)

m2 <- m1+100
m_max_v <- max(m1)
m_min_v <- min(m1)
row_max <- apply(m1,1,max)
col_max <- apply(m1,2,max)
m1;m2; m_max_v; m_min_v; row_max; col_max
  
#문제2
n1 <- c(1,2,3)
n2 <- c(4,5,6)
n3 <- c(7,8,9)
m1 <- cbind(n1,n2,n3)
colnames(m1) <- NULL
m1

#문제3
m2 <- matrix(1:9,nrow=3, ncol=3,byrow=T)
m2

#문제 4
m3 <- m2
rownames(m2) <- c("row1", "row2", "row3")
colnames(m2) <- c("col1", "col2", "col3")
m3

#문제5
alpha <- matrix(letters[1:6],nrow=2, ncol=3)
alpha2 <- rbind(c('x','y','z'), alpha)
alpha2
alpha3 <- cbind(c('s','p'), alpha)
alpha3
