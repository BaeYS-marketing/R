#즉석실습 - date_lab.R 로 제출한다.
#(1) 내가 태어난 요일 출력하기
birth = as.Date("1993-12-07", format = "%Y-%m-%d")
weekdays(birth)
# 문자열을 날짜형으로
birth <- "1993-12-07"
as.Date(birth, "%Y-%m-%d")
#(2) 내가 태어난지 며칠이 되었는지 알아보기
as.POSIXct("2019/11/05") - as.POSIXct("1993/12/07")
#(3) 올해의 크리스마스 요일 2가지방법(요일명,숫자)
xmas = as.Date("2019-12-25", format = "%Y-%m-%d")
weekdays(xmas)
as.POSIXlt("2019/12/25")$wday
#(4) 2020년 1월 1일 어떤 요일
as.POSIXlt("2020/01/01")$wday
#(5) 오늘은 xxxx년x월xx일x요일입니다 형식으로 출력
(today <- Sys.Date())
format(today, "오늘은 %Y년 %m월 %d일 %A입니다")
# (6) emp 데이터셋에서 직원들의 입사년도만 출력
emp$hiredate
xx = as.Date(emp$hiredate, format = "%Y")
format(xx, "%Y")