#문제1
a <- array(1:24,dim = c(2,3,4))
a

#문제2
a[2,3,4]
a[2,,]
a[,2,]
a[,,3]
a+100
a[,,4]*100
a[1,-1,]
a <- a[2,,2]+100
a <- a[,,1]-2
a <- a*10
rm(a)
#변수삭제

#문제2
x <- c(1:5)
y <- c(seq(2,10,2))
df1 <- data.frame(x,y)
df1

#문제3
col1 <- c(1:5)
col2 <- c(letters[1:5])
col3 <- c(6:10)
df2 <- data.frame(col1,col2,col3)
df2

#문제4, 5
df3 <- data.frame(제품명=c('사과','딸기', '수박'), 가격=c(1800,1500,3000), 판매량=c(24,38,13))
df3

mean(df3$가격)
mean(df3$판매량)

#문제6
name <- c('Potter', 'Elsa', 'Gates', 'Wendy', 'Ben')
gender <- c('M', 'F', 'M', 'F', 'M')
gender<- as.factor(gender)
math <- c(85, 76, 99, 88, 40)
df4 <- data.frame(name,gender,math)
df4

df4 <- cbind(df4,stat= c(76, 73, 95, 82, 35))
df4

df4$score <- df4$math + df4$stat
df4$grade <- ifelse(df4$score >= 150,"A",
                       ifelse(df4$score >=100 & df4$score <150  ,"B", 
                              ifelse(df4$score >=70 & df4$score <100, "C","D")))
#문제7~16
str(emp)
emp[3:5, ,]
emp$ename
emp[,c("ename", "sal"),]
subset(emp, emp$job=="SALESMAN",select = c(ename, job, sal))
subset(emp, emp$sal>=1000&emp$sal<=3000, select = c(ename, sal, deptno))
subset(emp,!emp$job=="ANALIST", select = c(ename, job, sal))
subset(emp, emp$job=="SALESMAN" | emp$job=="ANALYST", select=c(ename, job))
emp[is.na(emp$comm), c("ename", "sal")]
emp[order(emp$sal),]


