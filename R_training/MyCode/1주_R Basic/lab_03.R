
#rm(list=is())



#문제1

#0 
a<-array(1:24, dim=c(2,3,4))
a

#1
a[2,3,4]

#2
a[2,, , drop=F]

#3
a[,1, ,drop=F]

#4
a[,,3]

#5
a+100

#6
a[,,4]*100

#7
a[1,c(2,3), ,drop=F]

#8
a[2,,2]<-a[2,,2]+100
a

#9
a[,,1]<-a[,,1]-2
a

#10
a<-a*10
a

#11
rm(a)



#문제2
#0-1
c1<-1:5              #오류 c1 <- [1:5]
c2<-seq(2,10,2)

df1<- cbind(c1,c2)
df1
class(df1)
df1<-as.data.frame(df1)

#0-2
c1<-1:5              #오류 c1 <- [1:5]
c2<-seq(2,10,2)

df1<-data.frame(c1,c2)
df1



#문제3
c1<-1:5
c2<-letters[1:5]
c3<-seq(6,10)

df2<- data.frame(c1,c2,c3)
df2


#문제4
df3<-data.frame('제품명'=c('사과','딸기','수박'),
                '가격'=c(1800,1500,3000),
                    '판매량'=c(24,18,13))
df3

'c2<-letters[1:5]
factor(c2)'

#문제5
mean(df3$가격)
mean(df3$판매량)


#문제6
name <- c('Potter', 'Elsa', 'Gates', 'Wendy', 'Ben')
gender <- factor(c('M', 'F', 'M', 'F', 'M'))
math <- c(85, 76, 99, 88, 40)

df4<-data.frame(name,gender,math)
df4
str(df4)

df4$name <- as.character(df4[,1])
str(df4)


#문제6-2
#a
stat <- c(76, 73, 95, 82, 35)
stat

#b
df4$score <- df4$math + stat
df4
str(df4)

#c
df4$grade <- ifelse(df4$score>=150,'A',
                    ifelse(df4$score>=100,"B",
                           ifelse(df4$score>=70,"C","D")))
df4


#문제7
emp<-read.csv(file.choose(),stringsAsFactors = F)
emp
str(emp)


#문제8
emp[c(3,4,5),]


#문제9
emp$ename
emp[,'ename']
emp['ename']
subset(emp,select = ename)

#문제10
emp$c(ename,sal) ###오류  : $는 하나의 컬럼만 호출가능
emp[c(ename,sal)] #오류   : 여러개 일 때 ''를 붙인다.
emp[c('ename','sal')]


#문제11          #subset에서는 +select 절에서는 칼럼에 '' 안 붙인다.
str(emp)

subset(emp, select = c(sal,ename,job), subset = job =='SALESMAN' )


emp[emp$job == 'SALESMAN', c('ename','sal','ename')]



#문제12
subset(emp,select = c(ename,sal,deptno), subset = sal>1000 & sal<3000)


#문제13
subset(emp, select = c(ename,job,sal), subset = job != 'ANALYST')


#문제14
subset(emp, select = c(ename,job), 
       subset = job == 'SALESMAN' | job == 'ANALYST')
       

#문제15
View(emp)
subset(emp, select =c(ename, empno), subset = comm == NA) 
#오류 : NA 는 데이터가 아니다.

##subset으로 추출하기
subset(emp, select =c(ename, empno), subset = is.na(emp$comm)==T)

emp[emp$job!='ANALYST', c('ename','job','sal')]

'subset(emp, select =c(ename, empno), subset = comm == is.na(emp$comm))
is.na(emp$comm)  오류'

##인덱싱으로 추출하기
emp[is.na(emp$comm),c('ename','empno')]



#문제16
emp[order(emp$sal),]
