#문제 3
a <- array(1:24,c(2,3,4))
a[2,3,4]
a[2,,]
a[,1,]
a[,,3]
a+100
a[,,4]+100
a[1,c(2,3),]
a[2,,2]<- a[2,,2]+100
a[,,1]<- a[,,1]-2
a<- a*10
rm(a)

#문제 2
df1 <- as.data.frame(matrix(1:10,5,2))
colnames(df1) <- c('x','y')

#문제 3
col1 <- 1:5
col2 <- letters[1:5]
col3 <- 6:10
df2 <- data.frame(col1,col2,col3)

#문제 4
name <- c("사과",'딸기','수박')
price <- c(1800,1500,3000)
sales <- c(24,38,13)
df3 <- data.frame(name,price,sales,stringsAsFactors = F)
colnames(df3) <- c('제품명','가격','판매량')
str(df3)
df3

#문제 5
apply(df3[,c(2,3)],2,mean)

#문제 6
name <- c('Potter', 'Elsa', 'Gates', 'Wendy', 'Ben')
gender <- factor(c('M', 'F', 'M', 'F', 'M'))
math <- c(85, 76, 99, 88, 40)
df4 <- data.frame(name,gender,math,stringsAsFactors = F)
str(df4)

df4$stat <- c(76, 73, 95, 82, 35)
df4$score <- df4$math + df4$stat
df4$grade <- ifelse(df4$score >=150, "A",
                    ifelse(df4$score >=100,"B",
                    ifelse(df4$score <100,"C",
                    ifelse(df4$score <70,"D",NA))))

#문제 7
emp <- read.csv(file.choose(),
                stringsAsFactors = F)
str(emp)

#문제 8
emp[c(3,4,5),]

#문제 9
emp[,2, drop=F]

#문제 10
emp[,c(2,6)]

#문제 11
subset(emp,emp$job=="SALESMAN",c(2,6,3))

#문제 12
subset(emp,emp$sal>=1000&emp$sal<=3000,c(2,6,1))

#문제 13
subset(emp,emp$job!="ANALYST",c(2,3,6))

#문제 14
subset(emp,emp$job=="SALESMAN"|emp$job=="ANALYST",c(2,3))

#문제 15
subset(emp,is.na(emp$comm),c(2,6))

#문제 16
emp[c(order(emp$sal)),]
