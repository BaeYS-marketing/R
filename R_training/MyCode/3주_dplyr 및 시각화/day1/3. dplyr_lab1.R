library(ggplot2)
library(dplyr)


getwd()
emp <- read.csv('data/emp.csv')
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
emp %>% group_by(deptno) %>%  summarise(number = n()) %>% 
        arrange(desc(number)) %>%  head(1)

?count()        
        
        
####14



nc <- nchar(as.character(emp$ename))
nc2<-as.character(emp['ename'])

'[1] "c(12, 2, 14, 7, 9, 3, 4, 11, 8, 13, 1, 6, 5, 10)"'

class(nc2)  #character
mode(nc2)   #character
typeof(nc2)     #character
is.vector(nc2)   #TRUE

View(emp)
emp %>% mutate(enameLength = nc)



#삭제
#1번
emp[,'nchar'] = NULL
emp

#2번
emp %>% select(-nchar)


#1:length(emp$ename)
aaa<-NULL
for(i in 1:length(emp$ename)){
        nnn <-nchar(as.character(emp$ename[i]))
        print(nnn)
        aaa <- c(aaa,nnn)
}
aaa


##15
emp
emp %>% filter(!is.na(comm)) %>% summarise('직원 수 ' =n())
