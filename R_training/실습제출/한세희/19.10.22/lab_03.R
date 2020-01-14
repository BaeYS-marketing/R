# 문제1

a <- array(1:24, c(2,3,4))
a
a[2,3,4]
a[2,,]
a[,1,]
a[,,3]
a + 100
a[,,4]*100
a[1,-1,]
a[2,,2] <- a[2,,2]+100
a[,,1] <- a[,,1]-2
a <- a*10


# 문제2
x <- c(1:5)
y <- c(2,4,6,8,10)
df1 <- data.frame(x,y); df1

# 문제3
col1 <- c(1:5)
col2 <- letters[1:5]
col3 <- c(6,7,8,9,10)
df2 <- data.frame(col1,col2,col3)
df2

# 문제4
제품명 <- c("사과","딸기","수박")
가격 <- c(1800,1500,3000)
판매량 <- c(24,38,13)
df3 <- data.frame(제품명,가격,판매량)
df3
df3$제품명 = as.character(df3$제품명)
str(df3)

# 문제5
mean(df3$가격)
mean(df3$판매량)

# 문제6
name <- c("Potter","Elsa","Gates","Wendy","Ben")
gender <- factor(c("M","F","M","F","M"))
math <- c(85, 76, 99, 88, 40)
df4 <- data.frame(name,gender,math); df4
str(name)
str(gender)
str(math)

df4$stat <- c(76,73,95,82,35)
df4$score <- df4$math + df4$stat
df4$grade <- ifelse(df4$score >= 150,"A",
                    ifelse(df4$score >= 100,"B", 
                           ifelse(df4$score >=70,"C",
                                  ifelse(df4$score < 70, "D"))))
                            

# 문제7
emp
str(emp)

# 문제8
emp[c(3,4,5),]

# 문제9
emp[,"ename"]

# 문제10
emp[,c("ename","sal")]

# 문제11
subset(emp, select=c("ename","sal"), subset= emp$job=="SALESMAN")

# 문제12
subset(emp, select=c("ename","sal","deptno"), subset= (emp$sal >= 1000 & emp$sal <=3000))

# 문제13
subset(emp, select=c("ename","sal","deptno"), subset= (emp$sal >= 1000 & emp$sal <=3000))
emp[!is.na(emp$comm), c("ename", "comm")]

emp[!is.na(emp$job), c("ename","job","sal")]
emp[emp$job==-ANALYST, c("ename","job","sal")]

# 문제14
subset(emp, select=c("ename","job"), subset=(==SALESMAN))
subset(emp, select=c("ename","job"), subset= emp$job==SALESMAN)
emp[emp$sal>=2000 & emp$sal <=3000, c("ename","sal")]
emp

# 문제15
emp[is.na(emp$comm), c("ename", "sal")]

# 문제16
sort(emp$sal)
order(emp$sal)
emp[order(emp$sal),]

