library(dplyr)
a<-read.csv('data/emp.csv')
#문제1
a %>% filter(job=='MANAGER')
#문제2
a %>% select(empno, ename, sal)
#문제3
a %>% select(-empno)
#문제4
a %>% select(ename,sal)
#문제5
a %>% group_by(job) %>% 
  summarise(n=n())
#문제6
a %>% select(ename, sal, empno) %>% 
  filter(sal>=1000 & sal<=3000)
#문제7
a %>% select(ename, job, sal) %>% 
  filter(job!='ANALYST')
#문제8
a %>% select(ename, job) %>% 
  filter(job=='SALESMAN' | job=='ANALYST')
#문제9
a %>% group_by(deptno) %>% 
  summarise(sum<-sum(sal))
#문제10
a %>% arrange(sal)
#문제11
a %>% arrange(desc(sal)) %>% 
  head(1)
#문제12
empnew <- a %>% rename('salary'='sal','commrate'='comm')
#문제13
a %>% group_by(deptno) %>% 
  summarise(n=n()) %>%
  arrange(desc(n)) %>%
  select(deptno) %>% 
  head(1)

emp %>% group_by(deptno) %>% summarise(n = n()) %>% arrange(desc(n)) %>% head(1)[1]


#문제14
a$ename<-as.vector(a$ename)
a %>% mutate(enamelength=nchar(a$ename)) %>% 
  arrange(enamelength)

#문제15
a %>% filter(comm!='NA') %>% 
  summarise(n=n())



emp %>% group_by(deptno) %>% summarise(n = n()) 
emp %>% group_by(deptno) %>% summarise(n = length(deptno)) 
emp %>% group_by(deptno) %>% count()












