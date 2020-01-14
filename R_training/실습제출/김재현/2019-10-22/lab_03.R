#문제1
a <- array(1:24,dim=c(2,3,4))
a[2,3,4]
a[2,,]
a[,1,]
a[,,3]
a + 100
a[,,4]*100
a[1,c(2,3),]
a[2,,2] <- a[2,,2]+100
a[,,1] <- a[,,1]-2
a <- a*10
remove(a)

#문제2
x <- 1:5 ; y <- x*2
df1 <- data.frame(x,y)

#문제3
col1 <- 1:5 ; col2 <- letters[1:5] ; col3 <- 6:10
df2 <- data.frame(col1,col2,col3)

#문제4
제품명 <- c("사과","딸기","수박")
가격 <- c(1800,1500,3000)
판매량 <- c(24,38,13)
df3 <- data.frame(제품명,가격,판매량,stringsAsFactors=F)

#문제5
과일가격평균 <- sum(df3$가격)/3;과일가격평균
판매량평균 <- sum(df3$판매량)/3;판매량평균

#문제6
name <- c("Potter", "Elsa", "Gates", "Wendy", "Ben")
gender <- factor(c("M", "F", "M", "F", "M"))
math <- c(85, 76, 99, 88, 40)
df4 <- data.frame(name,gender,math)
df4$name <- as.character(df4$name)
str(df4)
#(a)
df4$stat <- c(76,73,95,82,35)
#(b)
df4$score <- df4$math + df4$stat
#(c)
df4$grade <- ifelse(df4$score>=150,"A",
                    ifelse(df4$score>=100 & df4$score<150,"B",
                           ifelse(df4$score>=70 & df4$score<100,"C","D")))

#문제7
str(emp)

#문제8
emp[c(3,4,5),]

#문제9
emp$ename

#문제10
emp[c("ename","sal")]

#문제11
subset(emp,emp$job=="SALESMAN",c(2,6,3))

#문제12
subset(emp,emp$sal>=1000 & emp$sal<=3000,c(2,6,8))

#문제13
subset(emp,!emp$job=="ANALYST",c(2,3,6))

#문제14
subset(emp,emp$job=="SALESMAN"|emp$job=="ANALYST",c(2,3))

#문제15
subset(emp,is.na(emp$comm),c(2,6))

#문제16
emp[c(order(emp$sal)),]
