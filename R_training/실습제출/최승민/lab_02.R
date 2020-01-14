#문제1
m1 <- matrix(3,5,byrow=T)
m1 <- seq(10, 38, 2)
m2 <- m1 + 100
m_max_v <- max(m1)
m_min_v <- min(m1)

row_max <- apply(m1, 1, max)
col_max <- apply(m1, 2, max)

m1
m2
m_max_v
m_min_v
row_max
col_max

#문제2

n1 <- c(1,2,3)
n2 <- c(4,5,6)
n3 <- c(7,8,9)

m1 <- cbind(n1, n2, n3)
m1

#문제3

m2 <- matrix(1:9, 3, 3, byrow = T)

#문제4

rownames(m2) <- c("row1", "row2", "row3")
colnames(m2) <- c("col1", "col2", "col3")
(m3 <- m2)

#문제5

alpha <- matrix(letters[1:6], 2, byrow=T)
newrow <- c("x","y","z")
newcol <- c("s", "p")

alpha2 <- rbind(alpha, newrow)
alpha3 <- cbind(alpha, newcol)

