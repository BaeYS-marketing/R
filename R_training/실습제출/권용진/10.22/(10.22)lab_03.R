#문제1
a<-array(1:24, dim=c(2,3,4))
#문제1_(1)
a
#문제1_(2)
a[2,,]
#문제1_(3)
a[,1,]
#문제1_(4)
a[,,3]
#문제1_(5)
a<-a+100; a
#문제1_(6)
a[,,4]*100 
#문제1_(7)
a[1,-1,]
#문제1_(8)
a[2,,2]=a[2,,2]+100 #대입해줘야 함!!
#문제1_(9)
a[,,1]=a[,,1]-2 #대입해줘야 함!!
#문제1_(10)
a<-a*10 #대입해줘야 함!!
#문제1_(11)
rm(a)

#문제2
x <- c(1,2,3,4,5)  # x=1:5
y <- c(2,4,6,8,10) # y=seq(2,10,2)
df1 <- data.frame(x,y)

#문제3
col1 <- c(1,2,3,4,5) #col1=1:5
col2 <- c("a","b","c","d","e") #col2=letters[1:5]
col3 <- c(6,7,8,9,10) #col3=6:10
df2 <- data.frame(col1,col2,col3) 

#문제4
제품명 <- c("사과","딸기","수박")
가격 <- c(1800,1500,3000)
판매량 <- c(24,38,13)
df3 <- data.frame(제품명,가격,판매량,stringsAsFactors=F)

#문제5
mean(df3[,2]);mean(df3[,3])
# mean(df3$가격);mean(df3$판매량)

#문제6
name <- c("Potter", "Elsa", "Gates", "Wendy", "Ben")
gender <- factor(c("M", "F", "M", "F", "M"))
math <- c(85, 76, 99, 88, 40)
df4 <- data.frame(name,gender,math,stringsAsFactors=F)
df4$gender=as.factor(df4$gender)
class(name);class(gender);class(math);
str(df4)

#6-(a)
stat <- c(76, 73, 95, 82, 35)
df4$stat = stat

#6-(b)
df4$score <- df4$math+df4$stat

#6-(c)
df4$grade<-ifelse(df4$score >= 150,"A",
                    ifelse(df4$score >= 100 & df4$score <= 150 ,"B", 
                           ifelse(df4$score >= 70 & df4$score <= 100,"C","D")))

df4$grade<-ifelse(df4$score >= 150,"A",
                  ifelse(df4$score >= 100 ,"B", 
                         ifelse(df4$score >= 70 ,"C","D")))



#문제7
str(emp)

#문제8
emp[c(3,4,5),]

#문제9
emp["ename"] 
emp$ename #하나만 가능, 여러개 할때는 대괄호 사용

#문제10
emp[c("ename","sal")]

#문제11
emp[emp$job=="SALESMAN" ,c("ename","sal","job")]
#""인용부호 없으면 변수로 인식함

#문제12
emp[emp$sal>=1000 & emp$sal <=3000, c("ename","sal","deptno")]

#문제13
emp[emp$job!="ANALYST", c("ename", "job","sal")]

#문제14
emp[emp$job=="SALESMAN"|emp$job=="ANALYST", c("ename", "job")]

#문제15
emp[is.na(emp$comm), c("ename", "sal")]

#문제16
emp[order(emp$sal, decreasing=F),]
