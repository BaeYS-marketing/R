# 문제1
a <- array(1:24,dim=c(2,3,4))
a
a[2,3,4]
a[2,,]
a[,1,]
a[,,3]
a+100
a[,,4]*100
a[1,2:3,]
a[2,,2] <- a[2,,2]+100
a[,,1] <- a[,,1]-2
a <- a*10
rm(a) 

# 문제2
x <- c(1,2,3,4,5)
y <- c(2,4,6,8,10)
df1 <- data.frame(x,y)

# 문제3
df2 <- data.frame(col1=c(1,2,3,4,5),
                  col2=c("a","b","c","d","e"),
                  col3=c(6,7,8,9,10))

#문제4

제품명 <- matrix(c('사과', '딸기', '수박'))
가격 <- matrix(c(1800,1500,3000))
판매량 <- matrix(c(24,38,13))
df3 <- data.frame(제품명,가격, 판매량,stringsAsFactors=FALSE)
df3

#문제 5
mean(df3$가격)
mean(df3$판매량)
     
# 문제 6
name <- c('Potter','Elsa','Gates', 'Wendy', 'Ben')
gender <- factor(c('M', 'F', 'M', 'F', 'M'))
math <- c(85, 76, 99, 88, 40)
df4 <- data.frame(name,gender,math,stringsAsFactors=FALSE)
df4$gender <- factor(df4$gender)
str(df4)

stat <- c(76, 73, 95, 82, 35)
df4 <- cbind(df4,stat)

df4$score <- df4$math + df4$stat
df4$grade <- ifelse(df4$score >= 150,"A",
                ifelse(df4$score >=100,"B",
                       ifelse(score >=70, "C","D")))

# 문제 7
str(emp)

#문제 8
emp[,c(3,4,5),]

#문제 9
emp[,"ename"]

#문제 10
subset(emp,select = c(ename, sal))
emp[,c("ename","sal")]

#문제 11
subset(emp,emp$job=="SALESMAN", c('ename','sal','job') )

#문제 12
emp[emp$sal > 1000 & emp$sal < 3000, c("ename","sal", "empno")]
subset(emp, select=c("ename","sal"), subset= emp$sal>= 2000)

#문제 13
subset(emp,select=c('ename','job','sal'),!subset="ANALYST")


#문제 14
subset(emp,select=c('ename','job'), subset=emp$job=="ANALYST"|emp$job=="SALESMAN")

#문제 15
em[[is.na(emp$comm),c("ename","sal")]]

#문제 16
emp[order(emp$sal,decreasing=T)]

     
     
     