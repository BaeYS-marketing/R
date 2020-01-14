#(1) 내가 태어난 요일 출력하기
birthday<-as.Date('1991-08-05', format='%Y-%m-%d')
format(birthday, '%a')

#(2) 내가 태어난지 며칠이 되었는지 알아보기
as.Date('2019-11-05') - as.Date('1991-08-05')

#(3) 올해의 크리스마스 요일 2가지방법(요일명,숫자)
x_mas<-as.Date('2019-12-25')
format(x_mas, '%A')
as.POSIXlt(x_mas)$wday

#(4) 2020년 1월 1일 어떤 요일
day<-as.Date('2020-01-01')
format(day, "%A")


#(5) 오늘은 xxxx년x월xx일x요일입니다 형식으로 출력
today<-Sys.Date()
wday<-format(today, '%a')
today<-as.POSIXlt(today)
paste0("오늘은 ", today$year+1900, "년",today$mon+1,"월",
    today$mday,"일", wday,"요일입니다")

# (6) emp 데이터셋에서 직원들의 입사년도만 출력
hiredate<-as.Date(emp$hiredate)
format(hiredate, '%Y')