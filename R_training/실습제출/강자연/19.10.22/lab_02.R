#문제1
v1 <- seq(10,38,2)
m1 <- matrix(v1,nrow = 3, ncol=5, byrow = T)
m2 <- m1+100
m_max_v <- max(m1)
m_min_v <- min(m1)
row_max <- apply(m1,1,max)
col_max <- apply(m1,2,max)
m1;m2;m_max_v;m_min_v;row_max;col_max

#문제2,3
n1 <- c(1,2,3)
n2 <- c(4,5,6)
n3 <- c(7,8,9)


m1 <- rbind(n1,n2,n3); mat1
m2 <- cbind(n1,n2,n3); mat2

#문제4
rownames(m1) <- c("row1","row2","row3")
colnames(m1) <- c("col1","col2","col3")
m1

#문제5
alpha <- matrix(letters[1:6], nrow = 2, ncol=3)
n4 <- c(letters[24:26])
alpha2 <- rbind(alpha, n4) 

n5 <- c("s","p")
alpha3 <- cbind(alpha, n5)
