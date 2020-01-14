#문제 1
(v1 = seq(1,38,2))
m1 = matrix(v1, nrow = 3, ncol = 5, byrow=T)

(m2 = m1 + 100)
m_max_v = max(m1)
m_min_v = min(m1)
row_max = apply(m1, 1, max)
col_max = apply(m1, 2, max)
m1;m2;m_max_v;m_min_v;row_max;col_max

#문제 2
n1 = c(1,2,3)
n2 = c(4,5,6)
n3 = c(7,8,9)

(m1 = cbind(n1,n2,n3))

#문제 3
(m2 = rbind(n1,n2,n3))

#문제 4
m3 = m2

rownames(m3) = c('row1','row2','row3')
colnames(m3) = c('col1','col2','col3')

m3


#문제 5
alpha = matrix(letters[1:6], nrow = 2)
alpha

alpha2 = rbind(alpha, c('x','y','z'))
alpha3 = cbind(alpha, c('s', 'p'))

alpha2;alpha3
