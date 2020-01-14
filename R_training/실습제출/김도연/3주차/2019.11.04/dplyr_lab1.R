library(dplyr)
emp <- read.csv("emp.csv")

#문제1
emp %>% filter(job == "MANAGER")

#문제2
emp %>% select("empno", "ename", "sal")

#문제3
emp %>% select(-"empno")

#문제4
emp %>% select("ename", "sal")

#문제5
#SALESMAN = emp %>% filter(job=="SALESMAN")
#SALESMAN = as.vector(SALESMAN)
#cat(paste0("SALESMAN", "은 ", count(SALESMAN), "명 입니다."))

emp %>% filter(job == "ANALYST") %>% count("ANALYST")
emp %>% filter(job == "CLERK") %>% count("CLERK")
emp %>% filter(job == "MANAGER") %>% count("MANAGER")
emp %>% filter(job == "PRESIDENT") %>% count("PRESIDENT")
emp %>% filter(job == "SALESMAN") %>% count("SALESMAN")

#문제6
emp %>% filter(sal>=1000 & sal<=3000) %>% select("ename", "sal", "empno")

#문제7
emp %>% filter(job != "ANALYST") %>% select("ename", "job", "sal")

#문제8
emp %>% filter(job == "SALESMAN" | job == "ANALYST") %>%  select("ename", "job")

#문제9
ANALYST1 = emp %>% filter(job == "ANALYST")
sum(ANALYST1$sal)
CLERK1 = emp %>% filter(job == "CLERK")
sum(CLERK1$sal)
MANAGER1 = emp %>% filter(job == "MANAGER")
sum(MANAGER1$sal)
PRESIDENT1 =emp %>% filter(job == "PRESIDENT")
sum(PRESIDENT1$sal)
SALESMAN1 = emp %>% filter(job == "SALESMAN")
sum(SALESMAN1$sal)

#문제10
emp %>% arrange(sal)

#문제11
emp %>% arrange(desc(sal))

#문제12
empnew = emp %>% rename(salary = sal, commrate = comm)

#문제13
emp %>% 
  group_by(deptno) %>% 
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  head(1)
  

#문제14
count(emp$ename[1])
emp %>%
  group_by(ename) %>% 
  summarise(enamelength = nchar(as.character(ename))) %>% 
  arrange(enamelength)

#문제15
emp %>%
  filter(comm != "NA") %>%
  summarise(n = n())
