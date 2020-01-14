library(dplyr)
emp <- read.csv("c:/Rstudy/data/emp.csv")
head(emp)

#1
emp %>% filter(job=="MANAGER")
#2
emp %>% select(empno, ename, sal)
#3
emp %>% select(-empno)
#4
emp %>% select(ename, sal)
#5
emp %>% group_by(job) %>% summarise(n=n())
#6
emp %>% filter(sal>=1000 & sal<=3000) %>% select(ename, sal, deptno)
#7
emp %>% filter(job!="ANALYST") %>% select(ename, job, sal)
#8
emp %>% filter(job=="SALESMAN" | job=="ANALYST") %>% select(ename, job)
#9
emp %>% group_by(deptno) %>% summarise(sum_sal=sum(sal))
#10
emp %>% arrange(sal)
#11
emp %>% arrange(desc(sal)) %>% head(1)
#12
empnew <- rename(emp, salary=sal, commrate=comm)
head(empnew)
#13
empnew %>% group_by(deptno) %>% summarise(n=n()) %>% arrange(desc(n)) %>% head(1) %>% select(deptno)
#14
str(empnew)
empnew$ename <- as.character(empnew$ename)
empnew$enamelength <- nchar(empnew$ename)
empnew %>% arrange(enamelength) %>% select(ename)
#15
empnew %>% filter(commrate!="NA") %>% summarise(n=n())
