install.packages("dplyr")
library(dplyr)
library(stringr)
install.packages("ggplot2")
emp <- read.csv("emp.csv")

emp %>%  filter(job == "MANAGER")
emp %>%  select(empno, ename, sal)
emp %>%  select(-ename)
emp %>%  select(ename, sal)
emp %>%  
  group_by(job) %>% 
  summarise(n = n() )
emp %>%  
  filter(1000 <= sal & sal <= 3000) %>% 
  select(empno, ename, sal)
emp %>%  
  filter(job != "ANALYST") %>% 
  select(empno, ename, sal)
emp %>%  
  filter(job == "SALESMAN" | job == "ANALYST") %>% 
  select(ename, job)

emp %>% 
  group_by(job) %>% 
  summarise(sum_sal = sum(sal))

emp %>% arrange(sal)
  
emp %>% arrange(desc(sal)) %>% head(1)

empnew <- rename(emp, salary = sal, commrate = comm)

emp %>% 
  group_by(deptno) %>% 
  summarise(n= n()) %>% 
  arrange(desc(deptno)) %>% 
  head(1)
  
emp %>%  
  mutate(enamelength = str_length(ename)) %>%
    arrange(enamelength) %>% 
  select(ename, enamelength)

emp %>%  
  filter(comm != "NA") %>%
  summarise(n = n())
