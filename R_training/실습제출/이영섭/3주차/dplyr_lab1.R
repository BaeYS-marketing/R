library(dplyr)
emp <- read.csv(file = "data/emp.csv",stringsAsFactors = F)

# 1번
emp %>% filter(job == "MANAGER")

# 2번
emp %>% select(empno,ename,sal)

# 3번
emp %>% select(-empno)

# 4번
emp %>% select(ename,sal)

# 5번
emp %>% group_by(job) %>% summarise(n= length(job))
  
  
# 6번
emp %>% filter(sal >=1000 & sal <=3000) %>% select(ename,sal,deptno)

# 7번
emp %>% filter(job != "ANALYST") %>% select(ename, job,sal)

# 8번
emp %>% filter(job == "SALESMAN" | job == "ANALYST") %>% select(ename, job)

# 9번
emp %>% group_by(deptno) %>% summarise(sum(sal))

# 10번
emp %>% arrange(sal)

# 11번
emp %>% arrange(desc(sal)) %>% head(1)

# 12번
empnew <- emp %>% rename(salary ="sal", commrate="comm")
head(empnew)

# 13번
emp %>% group_by(deptno) %>% summarise(n = length(deptno)) %>%  arrange(desc(n)) %>% head(1)

# 14번 
emp %>% mutate(enamelength=nchar(ename)) %>% arrange(enamelength) %>% select(ename)

# 15번
emp %>% filter(!is.na(comm)) %>% summarise(n =length(comm))



