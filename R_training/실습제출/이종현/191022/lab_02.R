# Q1
x = seq(10,38,2)
m1 = matrix(x, nrow = 3)
m2 = m1 + 100

m_max_v = max(m1)
m_min_v = min(m1)
row_max = apply(m1, 1, max)
col_max = apply(m1, 2, max)

m1; m2; m_max_v; m_min_v; row_max; col_max;

# Q2
n1 = c(1,2,3)
n2 = c(4,5,6)
n3 = c(7,8,9)

Q2_mat = cbind(n1, n2, n3)
colnames(Q2_mat) = NULL

# Q3
m2 = matrix(1:9, ncol = 3, byrow=T)

# Q4
colnames(m2) = c("col1", "col2", "col3")
rownames(m2) = c("row1", "row2", "row3")
print(m2)

# Q5
alpha = matrix(letters[1:6], ncol=3)

alpha2 = rbind(alpha, c('x', 'y', 'z'))
print(alpha2)

alpha3 = cbind(alpha, c('s', 'p'))
print(alpha3)
