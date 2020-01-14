#문제1
v<-seq(1:24)
a<-array(v, dim = c(2,3,4))
a[2,3,4]
a[2, , ]
a+100
a[ , ,4]*100
a[1,-1, ]
a[2, ,2] <- a[2, ,2]+100
a[ , ,1] <- a[ , ,1]-2
a <- a*10
rm(a)
#문제2
x <- seq(1:5)
y <- seq(2,10, by = 2)
df1 <- data.frame(x=x,y=y)
df1
#문제3
col1<-seq(1:5)
col2<-c("a","b","c","d","e")
col3<-seq(6:10)
df2<-data.frame(col1=col1,col2=col2,col3=col3)
df2
#문제4
product<-c("사과","딸기","수박")
price<-c(1800,1500,3000)
sales<-c(24,38,13)
df3<-data.frame(제품명=product,가격=price,판매량=sales,stringsAsFactors=F)
df3
#문제5
mean(df3$가격)
mean(df3$판매량)
#문제6
name <- c("Potter", "Elsa", "Gates", "Wendy", "Ben")
gender <- factor(c("M", "F", "M", "F", "M"))
math <- c(85, 76, 99, 88, 40)
df4<-data.frame(name, gender, math, stringsAsFactors = F)
df4gender = factor(df4$gender)
str(df4)
df4$stat<-c(76,73,95,82,35)
df4$score<-df4$math+df4$stat
df4$grade <- ifelse(df4$score >= 150,"A",ifelse(df4$score >= 100, "B",ifelse(df4$score >= 70, "C", "D")))
#문제7
emp <- read.csv("data/emp.csv")
str(emp)
#문제8
emp[3:5]
#문제9
emp$ename
#문제10
emp[c("ename","sal")]
#문제11
emp[emp$job=="SALESMAN", c("ename","sal","job")]
#문제12
emp[emp$sal>=1000 & emp$sal<=3000, c("ename","sal","mgr")]
#문제13
emp[!emp$job=="ANALYST", c("ename","job","sal")]
#문제14
emp[emp$job=="SALESMAN" | emp$job=="ANALYST", c("ename","job")]
#문제15
emp[is.na(emp$comm), c("ename","sal")]
#문제16
emp[order(emp$sal,decreasing = F),]
