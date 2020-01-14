#즉석실습 - date_lab.R 로 제출한다.
#(1) 내가 태어난 요일 출력하기
weekdays(as.Date('9/15/1995',format='%m/%d/%Y'))


#(2) 내가 태어난지 며칠이 되었는지 알아보기
as.POSIXlt(today) - as.POSIXlt("1995/09/15")
#(3) 올해의 크리스마스 요일 2가지방법(요일명,숫자)
weekdays(as.Date('12/25/2019',format='%m/%d/%Y'))
as.POSIXlt("2019/12/25")$wday

#(4) 2020년 1월 1일 어떤 요일
weekdays(as.Date('1/1/2020',format='%m/%d/%Y'))

#(5) 오늘은 xxxx년x월xx일x요일입니다 형식으로 출력
today <- Sys.Date()
a=format(today, "%Y년%m월%d일%")
b=weekdays(today)
print(paste0("오늘은",
             a,
             b,
             "입니다"))

# (6) emp 데이터셋에서 직원들의 입사년도만 출력

emp <- read.csv("C:/Rstudy/data/emp.csv")
h=emp$hiredate
format(as.Date(h), "%Y")

