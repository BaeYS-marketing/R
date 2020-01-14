# 문제1
a <- array(1:24, c(2,3,4))
a
a[2,3,4]
a[2,,]
a[,1,]
a[,,3]
a + 100
a[,,4] * 100
a[1,2:3,]
a[2,,2] <- a[2,,2] + 100
a[,,1] <- a[,,1] - 2
a <- a * 10
rm(a)

# 문제2
df1 <- data.frame(x=c(1:5),
                  y=seq(2,10,2))

# 문제3
df2 <- data.frame(col1=c(1:5),
                  col2=letters[1:5],
                  col3=c(6:10))

# 문제4
제품명 <- c('사과', '딸기', '수박')
가격 <- c(1800, 1500, 3000)
판매량 <- c(24, 38, 13)
df3 <- data.frame(제품명, 가격, 판매량,
                  stringsAsFactors=F)
df3

# 문제5
paste('과일 가격 평균', mean(df3$가격), sep=':')
paste('판매량 평균', mean(df3$판매량), sep=':')

# 문제6
name <- c('Potter', 'Elsa', 'Gates', 'Wendy', 'Ben')
gender <- factor(c('M', 'F', 'M', 'F', 'M'))
math <- c(85, 76, 99, 88, 40)
df4 <- data.frame(name, gender, math,
                  stringsAsFactors=F)
str(df4)
df4['stat'] <- c(76, 73, 95, 82, 35)
df4['score'] <- df4['math'] + df4['stat']
df4['grade'] <- ifelse(df4['score'] >= 150, 'A',
                       ifelse(df4['score'] >= 100, 'B',
                              ifelse(df4['score'] >= 70, 'C', 'D')))
df4

# 문제7
emp <- read.csv('data/emp.csv')
str(emp)

# 문제8
emp[3:5,]

# 문제9
emp['ename']

# 문제10
emp[c('ename', 'sal')]

# 문제11
emp[emp['job']=='SALESMAN', c('ename', 'sal', 'job')]

# 문제12
emp[(emp['sal']>=1000)&(emp['sal']<=3000), c('ename', 'sal', 'deptno')]

# 문제13
emp[emp['job']!='ANALYST', c('ename', 'job')]

# 문제14
emp[(emp['job']=='SALESMAN')|(emp['job']=='ANALYST'), c('ename', 'job')]

# 문제15
emp[is.na(emp['comm']), c('ename', 'sal')]

# 문제16
emp[order(emp['sal']),]
