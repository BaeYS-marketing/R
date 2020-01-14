#즉석실습 - date_lab.R 로 제출한다.

#(1) 내가 태어난 요일 출력하기
birth <-as.Date("1996/11/3")
format(birth, "%A")



#(2) 내가 태어난지 며칠이 되었는지 알아보기
t <-as.Date("1996/11/3")
ct <- as.POSIXct(t);
unclass(ct)



#(3) 올해의 크리스마스 요일 2가지방법(요일명,숫자)
xmas <- as.Date("2019/12/25")
format(xmas , "%A")

t<-Sys.time()
lt<-as.POSIXlt(t)
as.POSIXlt("2019/12/25")$wday



#(4) 2020년 1월 1일 어떤 요일

year<-as.Date("2020/1/1")
format(year, "%A")



#(5) 오늘은 xxxx년x월xx일x요일입니다 형식으로 출력
t<-Sys.time()
format(t, "오늘은%Y년%B%d일%A입니다")



# (6) emp 데이터셋에서 직원들의 입사년도만 출력
emp<-read.csv("C:/Rstudy/data/emp.csv")
year <- as.Date(emp$hiredate)
format(year, "%Y") 
