#문제 1
v1 <- seq(10,38,2)
m1 <- matrix(v1, nrow = 3, ncol = 5, byrow = T)
m2 <- m1 +100
m_max_v <- max(m1)
m_min_v <- min(m1)
row_max <- apply(m1,1,max)
col_max <- apply(m1,2,max)
m1; m2; m_max_v; m_min_v; row_max; col_max

#문제 2
n1 <- 1:3
n2 <- 4:6
n3 <- 7:9
m1 <- cbind(n1,n2,n3)
colnames(m1) <- NULL

#문제 3
m2 <- matrix(1:9,3,3,byrow=T)

#문제 4
m3 <- m2
colnames(m3) <- c("col1","col2","col3")
rownames(m3) <- c("row1","row2","row3")

#문제 5
alpha <- matrix(letters[1:6],2,3)
alpha2 <- rbind(alpha,c('x','y','z'))
alpha2
alpha3 <- cbind(alpha,c('s','p'))
alpha3