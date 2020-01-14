#즉석실습
#(1) 내가 태어난 요일 출력하기
myBirth <- as.Date('1986/05/25',format='%Y/%m/%d')
weekdays(myBirth)
#(2) 내가 태어난지 며칠이 되었는지 알아보기
Sys.Date()-myBirth
#(3) 올해의 크리스마스 요일 2가지방법(요일명,숫자)
xmas <- as.Date('2019/12/25',format='%Y/%m/%d')
weekdays(xmas)
format(xmas,"%A")
unclass(as.POSIXlt(xmas)$wday)
#(4) 2020년 1월 1일 어떤 요일
weekdays(as.Date('2020/01/01',format='%Y/%m/%d'))
#(5) 오늘은 xxxx년x월xx일x요일입니다 형식으로 출력
format(today, "오늘은 %Y년 %m월 %d일 %A 입니다.")
# (6) emp 데이터셋에서 직원들의 입사년도만 출력
emp_date=emp %>% select(ename,hiredate)
emp_date$hiredate=as.Date(emp_date$hiredate,format="%Y-%m-%d")
emp_date$hiredate=format(emp_date$hiredate,"%Y년")
emp_date

