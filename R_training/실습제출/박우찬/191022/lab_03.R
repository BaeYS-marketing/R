a = array(1:24, dim=c(2,3,4))
# 문제 1
a
a[2,3,4]
a[2, , ]
a[,1,]
a[,,3]
a+100
a[, ,4]*100
a[1,c(2,3),]
a[2,,2]+100
a[,,1]-2
a*10
rm(a)

#문제 2
x = 1:5
y = seq(2,10,2)
df1 = data.frame(x,y)
df1

# 문제 3
col1 = 1:5
col2 = letters[1:5]
col3 = 6:10
df2 = data.frame(col1,col2,col3)
df2

#문제 4
제품명 = c('사과','딸기','수박')
가격 = c(1800,1500,3000)
판매량 = c(24,38,13)
df3 = data.frame(제품명, 가격,판매량)
df3$제품명 = as.character(df3$제품명)
str(df3)
df3

#문제5
mean(df3$가격)
mean(df3$판매량)

#문제6

name <- c('Potter', 'Elsa', 'Gates', 'Wendy', 'Ben')
gender <- factor(c('M', 'F', 'M', 'F', 'M'))
math <- c(85, 76, 99, 88, 40)
df4 = data.frame(name, gender, math)
df4$name = as.character(df4$name)
df4
str(df4)

stat = c(76,73,95,82,35)

df4$stat = c(76,73,95,82,35)
df4

df4$score = df4$math + df4$stat

df4$grade = ifelse(df4$score >=150,"A",
                   ifelse(df4$score>=100 & df4$score<150,"B",
                          ifelse(df4$score>=70 & df4$score<100,"C","D")))

# 문제7
emp <- read.csv("data/emp.csv")
str(emp)

# 문제8
emp[3:5,]

# 문제9
emp$ename

# 문제10
emp[,c('ename','sal')]

# 문제11
subset(emp,emp$job == 'SALESMAN')

# 문제12
subset(emp,emp$sal>=1000 & emp$sal <=3000, select = c('ename','sal','deptno'))

# 문제13
subset(emp,emp$job != 'ANALYST', select = c('ename','job','sal'))
subset(emp,select = c('ename','job','sal'), emp$job != 'ANALYST')

# 문제14
subset(emp,select = c('ename','job'), emp$job == 'SALESMAN' |emp$job == 'ANALYST' )


# 문제15
emp[is.na(emp$comm) , c('ename','sal')]

# 문제16
emp[order(emp$sal),]
