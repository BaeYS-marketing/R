#즉석실습 - date_lab.R 로 제출한다.
#(1) 내가 태어난 요일 출력하기
mybirthday <- as.Date("1993-03-05",format="%Y-%m-%d")
format(mybirthday,"%A")

#(2) 내가 태어난지 며칠이 되었는지 알아보기
as.Date("2019-11-05")-as.Date("1993-03-05")


#(3) 올해의 크리스마스 요일 2가지방법(요일명,숫자)
X_Mas <- as.Date("2019-12-25",format="%Y-%m-%d")
format(X_Mas,"%A")
as.POSIXlt(X_Mas)$wday

#(4) 2020년 1월 1일 어떤 요일
whatday <- as.Date("2020-01-01", format="%Y-%m-%d")
format(whatday,"%A")

#(5) 오늘은 xxxx년x월xx일x요일입니다 형식으로 출력
today <- Sys.Date()
paste0("오늘은 ",format(today, "%Y"),"년",format(today,"%B"),format(today, "%d"),"일",format(today,"%A"),"입니다")


# (6) emp 데이터셋에서 직원들의 입사년도만 출력
emp <- read.csv("emp.csv")
employee <- as.Date(emp$hiredate)
format(employee,"%Y")