#문제1
x1 <- c(10:38, 2)
x1

m1 <- matrix(x1, nrow= 3, ncol = 5)
m1
x1 <- x1 + 100 
x1

m2 <- matrix(x1, nrow = 3, ncol = 5)
m2

m_max_v <- max(m1)
m_max_v
m_min_v <- min(m1)
m_min_v
row_max <- apply(m1, 1, max)
row_max
col_max <- apply(m1, 2, max)
col_max

# 문제2 
n1 <- c(1, 2, 3)
n1
n2 <- c(4, 5, 6)
n2
n3 <- c(7, 8, 9)
n3
matrix(1:9, 3, 3)


# 문제3
m2 <- matrix(1:9, nrow = 3, ncol = 3)
m2

# 문제4
matrix(m2, nrow = 3, ncol = 3, byrow = T)

rownames(m2) <- c("row1", "row2", "row3")
m2
colnames(m2) <- c("col1", "col2", "col3")
m2

# 문제5
(alpha <- letters[1:6])
alpha <- matrix(alpha, 2, 3)
alpha2 <- rbind(alpha, c('x', 'y', 'z')); alpha2
alpha3 <- cbind(alpha, c('s', 'p')); alpha3