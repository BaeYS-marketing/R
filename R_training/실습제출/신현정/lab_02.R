#문제 1

m1 <- matrix(10:38, nrow=3, ncol=5, byrow =FALSE)
m1
m2 <- m1 +100
m2
m_max_v <- max(m1)
m_min_v <- min(m1)
row_max <- apply(m1, 1, max)
col_max <- apply(m1, 2, max)

m_max_v; m_min_v;  row_max; col_max


#문제2 

n1 <- c(1,2,3) 
n2 <- c(4,5,6)
n3 <- c(7,8,9)
mat1 <- cbind(n1,n2,n3); mat1
colnames(mat1) <- NULL
mat1

#문제3
m2 <- matrix(1:9, nrow=3, ncol=3, byrow=TRUE)
m2

#문제4
rownames(m2) <- c("row1","row2","row3")
colnames(m2) <- c("col1","col2","col3")
m3 <- m2
m3


#문제5
alpha <- matrix(letters[1:6], nrow=2, ncol=3)
alpha
a1pha2 <- rbind(alpha,c('x','y','z'))
alpha3 <- cbind(alpha,c('s','p'))
a1pha2 ; alpha3
