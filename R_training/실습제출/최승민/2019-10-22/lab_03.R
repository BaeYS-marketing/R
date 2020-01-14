#문제1
a <- array(1:24, dim=c(2,3,4))
a[2,,]
a[,1,]
a[,,3]  
(a + 100)
(a[,,4] * 100) 

a <- array(1:24, dim=c(2,3,4))
a[1,c(2,3),]

a[2,,2] + 100
a[,,1] - 2

a <- a*10
rm(a)

#문제2

x <- seq(1,5)
y <- seq(2,10,2)
df1 <- data.frame(x,y)

#문제3

col1 <- c(1:5)
col2 <- letters[1:5]
col3 <- c(6:10)
df2 <- data.frame(col1, col2, col3)

#문제 4
product <- c("사과", "딸기", "수박")
price <- c(1800, 1500, 3000)
qty <- c(24, 38, 13)
df3 <- data.frame(제품명 = product, 가격 = price, 판매량 = qty)

#문제5
mean(df3$가격)
mean(df3$판매량)

#문제6

name <- c("Potter", "Elsa", "Gates", "Wendy", "Ben")
gender <- factor(c("M","F", "M", "F", "M"))
math <- c(85, 76, 99, 88, 40)

df4 <- data.frame(name, gender, math)
class(df4)

df4$stat <- c(76, 73, 95, 82, 35)
df4$score <- df4$math + df4$stat

df4$grade <- ifelse(df4$score >= 150,"A",
                    ifelse(100 <= df4$score & df4$score <150 ,"B", 
                           ifelse(70 <= df4$score & df4$score <100 ,"C", "D")))


#문제7
str(emp)

#문제8
emp[c(3,4,5),]

#문제9
emp$ename

#문제10
emp[,c("ename","sal")]

#문제11

subset(emp, select =c("ename", "job", "sal"), emp$job == "SALESMAN")

#문제12 

# subset(emp, select =c("ename", "sale", "empno"),subset = (2000 <= sal & sal <= 3000))
emp[emp$sal>=2000 & emp$sal <=3000, c("ename","sal","empno")]

#문제13

# emp[!is.na(emp$job == ANALYST), c("ename", "job", "sal")]
subset(emp, select =c("ename", "job", "sal"), !is.na(emp$job == "ANALYST"))

#문제14

emp[emp$job == "SALESMAN" | emp$job == "ANALYST", c("ename", "job", "sal")]

#문제15

emp[!is.na(emp$comm), c("ename", "sal")]

#문제16

emp[order(emp$sal),]
