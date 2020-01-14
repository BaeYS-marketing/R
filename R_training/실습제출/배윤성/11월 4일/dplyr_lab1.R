library(ggplot2)
library(dplyr)


getwd()
emp <- read.csv('emp.csv')
emp


#1
emp %>% filter(job == 'MANAGER')

#2
emp %>% select(empno,ename,sal)


#3
emp %>% select(-sal)


#4
emp %>% select(ename,sal)

#5
emp %>%  select(deptno)


#6
emp %>% filter(sal >=1000 & sal <= 3000)


#7
emp %>% filter(job != 'ANALYST') %>% 
        select(ename,job,sal)


#8
emp %>% filter(job =='ANALYST' | job == 'SALESMAN')

##9
unique(emp$job)
emp %>% group_by(job) %>% 
        summarise(totalSal = sum(sal))


#10
emp %>%  arrange(sal)


#11
emp %>%  arrange(desc(sal))


#12
empnew<-emp %>%  mutate(salary = sal, commrate = comm) %>% 
        select(-sal, -comm)


##13
emp %>% group_by(deptno) %>%  summarise('직원 수' = n())
        
        
        
####14
nc <- nchar(as.character(emp$ename))
emp %>% mutate(enameLength = nc)




##15
emp
emp %>% filter(!is.na(comm)) %>% summarise('직원 수 ' =n())
