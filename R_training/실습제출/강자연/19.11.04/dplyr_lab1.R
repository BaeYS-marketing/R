
library(dplyr)
emp <- read.csv("data/emp.csv")
getwd()
View(emp)

#1
emp %>% filter(job=='MANAGER')

#2
emp %>% select(ename,mgr,sal)

#3
emp %>% select(-mgr)

#4
emp %>% select(ename,sal)

#5
emp %>%
  group_by(job) %>%             
  summarise( n = n())     

#6
emp %>% filter(sal >=3000 | sal >= 1000)%>%
  select(ename,mgr,sal)

#7
emp %>% filter(job!='ANALIST')%>%
  select(ename,job,sal)

#8
emp %>% filter(job=='ANALIST'|job=='SALESMAN')%>%
  select(ename,job)

#9
emp %>%
  group_by(deptno)%>%
  summarise(sum_sal = sum(sal))  
# 일부 추출
#10
emp %>% arrange(sal)

#11
emp %>% arrange(desc(sal))

#12
# install.packages("reshape")
library(reshape)
emp_new=rename(emp, c(sal='salary', comm='commrate'))

#13
emp %>%
  group_by(deptno) %>%             
  summarise( n = n())%>%
  arrange(desc(n))
  select(deptno)
  head(1)

#14
emp %>%
  mutate(enamelength =nchar(as.character(emp$ename)))%>%
  arrange(enamelength)

#15
emp %>%
  filter(!is.na(comm))%>%
  summarise( n = n())
  
  

