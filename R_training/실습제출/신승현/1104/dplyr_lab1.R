install.packages("dplyr")
library(dplyr)
install.packages("ggplot2")
str(ggplot2::mpg)
head(ggplot2::mpg)
mpg <- as.data.frame(ggplot2::mpg)
head(mpg)
emp <- read.csv("emp.csv")
str(emp)
dim(emp)
head(emp);tail(emp)
View(emp)

#1
emp %>% filter(job == 'MANAGER')
#2
emp %>% select(empno, ename, sal) %>% head(14)
#3
emp %>% select(-empno)
#4
emp %>% select(ename, sal)
#5
emp %>% group_by(job) %>%
  summarise(n=n())
#6
emp %>%
  filter(sal >= 1000 & sal<=3000) %>% select(ename, empno, sal)
#7
emp %>%
  filter(job != 'ANALYST') %>% select(ename, job, sal)
#8
emp %>%
  filter(job == 'SALESMAN' | job == 'ANALYST') %>% select(ename, job)
#9
emp %>% 
  group_by(mgr) %>% 
  summarise(sum(emp$mgr))
#10
emp %>% arrange(sal) %>% head(14)
#11
emp %>% arrange(sal) %>% head(1)
#12
library(reshape)
emp_new=rename(emp, c(sal='salary', comm='commrate'))
#13
emp %>% group_by(dempno) %>% summarise (n = n()) %>% arrange(desc(n))
  select(deptno)
  head(1)
#14


#15
emp %>% group_by(deptno) %>% summarise(n=n())




#14
emp %>%
  mutate(enamelength =nchar(as.character(emp$ename)))%>%
  arrange(enamelength)

#15
emp %>%
  filter(!is.na(comm))%>%
  summarise( n = n())
