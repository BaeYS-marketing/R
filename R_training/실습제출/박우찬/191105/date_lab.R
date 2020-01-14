#(1) 내가 태어난 요일 출력하기
weekdays(as.Date("1996-01-14"))

#(2) 내가 태어난지 며칠이 되었는지 알아보기
Sys.Date() - as.Date("1996-01-14")

#(3) 올해의 크리스마스 요일 2가지방법(요일명,숫자)
weekdays(as.Date("2019-12-25"))
as.POSIXlt("2019-12-25")$wday

#(4) 2020년 1월 1일 어떤 요일
weekdays(as.Date("2020-01-01"))

#(5) 오늘은 xxxx년x월xx일x요일입니다 형식으로 출력
today = format(Sys.Date(), "%Y년 %B %d일")
today_wday = weekdays(Sys.Date())
cat("오늘은", today, today_wday, "입니다")

# (6) emp 데이터셋에서 직원들의 입사년도만 출력
emp = read.csv("emp.csv")
format(as.Date(emp$hiredate), "%Y")

