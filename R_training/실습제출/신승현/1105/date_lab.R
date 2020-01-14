#즉석실습 - date_lab.R 로 제출한다.
#(1) 내가 태어난 요일 출력하기
SH <- "19930111"
as.Date(SH, "%Y%m%d")
as.POSIXlt("2019/01/11")$wday
#5: 금요일

#(2) 내가 태어난지 며칠이 되었는지 알아보기

sh <- "19930111"
unclass(sh)

#(3) 올해의 크리스마스 요일 2가지방법(요일명,숫자)
as.POSIXlt("2019/12/25")$wday  #3: 수요일
as.POSIXlt("2019/11/05")$wday


#(4) 2020년 1월 1일 어떤 요일

as.POSIXlt("2020/01/01")$wday #3, 수요일


#(5) 오늘은 xxxx년x월xx일x요일입니다 형식으로 출력

(today <- Sys.Date())
format(today, "오늘은 %Y년 %m월 %d일 %A입니다")


# (6) emp 데이터셋에서 직원들의 입사년도만 출력

emp <- read.csv("emp.csv")
as.Date(emp$hiredate, "%Y")

