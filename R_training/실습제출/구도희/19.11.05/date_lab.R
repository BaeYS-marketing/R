#즉석실습 - date_lab.R 로 제출한다.

#(1) 내가 태어난 요일 출력하기

i <- "19971029"
i <- as.Date(i,"%Y%m%d")
weekdays(i) 


#(2) 내가 태어난지 며칠이 되었는지 알아보기
as.Date(today) - as.Date(i)



#(3) 올해의 크리스마스 요일 2가지방법(요일명,숫자)
chr <- "2019/12/25"
as.POSIXlt(chr)$wday
weekdays(as.Date(chr))


#(4) 2020년 1월 1일 어떤 요일
new <- "2020/01/01"
weekdays(as.Date(new))


#(5) 오늘은 xxxx년x월xx일x요일입니다 형식으로 출력
Sys.Date()
format(Sys.Date(), "오늘은 %Y년 %m월 %d일 %A입니다")


# (6) emp 데이터셋에서 직원들의 입사년도만 출력
library(dplyr)
emp <- read.csv("data/emp.csv")
format(as.Date(emp$hiredate), "%Y")
# 년-월-일 형태로 되어있어 format 문자 안주어도 됨



