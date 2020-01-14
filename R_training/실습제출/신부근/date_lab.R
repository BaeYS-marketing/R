#(1) 내가 태어난 요일 출력하기
as.POSIXlt("1989/04/09")$wday
#(2) 내가 태어난지 며칠이 되었는지 알아보기
as.Date("2019/11/05") - as.Date("1989/04/09")
#(3) 올해의 크리스마스 요일 2가지방법(요일명,숫자)
as.POSIXlt("2019/12/25")$wday

#(4) 2020년 1월 1일 어떤 요일
as.POSIXlt("2020/01/01")$wday

#(5) 오늘은 xxxx년x월xx일x요일입니다 형식으로 출력
format(today, "%Y년 %m월 %d일")

#(6) emp 데이터셋에서 직원들의 입사년도만 출력
emp<-read.csv("C:/Rstudy/data/emp.csv")
emp %>% select(hiredate)
