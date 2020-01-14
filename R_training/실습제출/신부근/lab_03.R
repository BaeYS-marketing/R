# 문제1
a<- array(1:24,dim=c(2,3,4))
a
a[2,3,4]
a[2,,]
a[,1,]
a[,,3]

a<-a+100  
k1<-a[,,4]*100
a[1,c(2,3),]  
a[2,,2]<-a[2,,2]+100
a[,,1]<-a[,,1]-2
a<-a*10
rm(a)

#문제2
m1<-c(1:5)
m2<-m1*2
df1<- data.frame(m1,m2)

#문제3
n1<-c(1:5)
n2<-letters[1:5]
n3<-c(6:10)
df2<-data.frame(n1,n2,n3)

#문제4
제품명<-c("사과","딸기","수박")
가격<-c(1800,1500,3000)
판매량<-c(24,38,13)
df3<-data.frame(제품명,가격,판매량,stringsAsFactors=FALSE)

#문제5
가격평균<-mean(가격)
판매량평균<-mean(판매량)

#문제6
name <- c("Potter", "Elsa","Gates", "Wendy", "Ben")
gender <- factor(c("M", "F", "M", "F", "M"))
math <- c(85, 76, 99, 88, 40)

df4<-data.frame(name,gender,math)
df4$name<-as.character(df4$name)
str(df4)

stat<-c(76,73,95,82,35)
df4$stat<-stat
df4

df4$score<-df4$math+df4$stat
df4$grade<-ifelse(df4$score >= 150,"A",
                    ifelse(df4$score >= 100,"B", 
                           ifelse(df4$score>=70,"C","D")))

#문제7
str(emp)
#문제8
emp[c(3,4,5),]
#문제9
subset(emp,select=ename)
#문제10
subset(emp,select=c(ename,sal))
#문제11
subset(emp,emp$job=="SALESMAN",c("ename","sal","job"))
#문제12
emp[emp$sal>=1000 & emp$sal <=3000, c("ename","job","empno")]
#문제13
subset(emp,!emp$job=="ANALYST",c(ename,job,sal))
#문제14
subset(emp,emp$job=="ANALYST"|emp$job=="SALESMAN",c(ename,job))
#문제15
emp[is.na(emp$comm), c("ename", "sal")]
#문제16
emp[order(emp$sal,decreasing=F),]

