#(1) 내가 태어난 요일 출력하기
b <- as.Date("9529", format = "%y%b%d")
format(b, "%A")


#(2) 내가 태어난지 며칠이 되었는지 알아보기
as.Date(Sys.time()) - b


#(3) 올해의 크리스마스 요일 2가지방법(요일명,숫자)
christmas <- as.Date("2019-12-25", format = "%Y-%m-%d")
format(christmas, "%A")

as.POSIXlt("2019/12/25")$wday


#(4) 2020년 1월 1일 어떤 요일
d <- as.Date("2011", format = "%y%b%d")
format(d, "%A")


#(5) 오늘은 xxxx년x월xx일x요일입니다 형식으로 출력
t <- Sys.time()
format(t, "%Y")
cat("오늘은",
    format(t, "%Y"), "년",
    format(t, "%B"),
    format(t, "%d"), "일",
    format(t, "%A"), "입니다")


# (6) emp 데이터셋에서 직원들의 입사년도만 출력
emp <- read.csv("data/emp.csv")
hiredate <- emp$hiredate
lt<-as.POSIXlt(hiredate)
lt$year+1900
