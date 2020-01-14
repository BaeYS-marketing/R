library(dplyr)

emp <- read.csv("data/emp.csv", stringsAsFactors = F)
emp

# 문제1
emp %>% filter(job ==  "MANAGER")

# 문제 2
emp %>% select(empno, ename, sal )

# 문제 3
emp %>% select(-empno)

# 문제 4
emp %>% select(ename, sal)

# 문제 5
emp %>% group_by(job) %>% summarise(n = n())

# 문제 6
emp %>% group_by(sal) %>%
  filter(sal >= 1000 & sal <= 3000) %>% 
  select(ename, sal, deptno)

# 문제 7
emp %>% group_by(job) %>%
  filter(job != "ANALYST") %>%
  select(ename, job, sal)

# 문제 8
emp %>%   group_by(job) %>%
  filter(job == "SALESMAN" | job == "ANALYST") %>%
  select(ename, job)

# 문제 9
emp %>% group_by(deptno) %>% summarise(mean_sal = mean(sal))

# 문제 10
emp %>% arrange(sal)

# 문제 11
emp %>% arrange(desc(sal))

# 문제 12
empnew <- rename(emp, salary = sal, commrate = comm)
empnew

# 문제 13
empnew %>% group_by(deptno) %>%
  summarise(n = n()) %>%
  arrange(desc(deptno)) %>%
  head(1)

# 문제 14
emp %>% mutate(enamelength= nchar(emp$ename)) %>%
  arrange(enamelength) 

emp %>% mutate(enamelength= nchar(ename)) %>%
  arrange(enamelength)

# 문제 15

emp %>% filter(!is.na(comm)) %>% summarise(n = n())


