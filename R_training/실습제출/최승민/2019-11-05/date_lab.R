my_bir <- as.Date('92223','%y%b%d')
weekdays(my_bir)
#(2) 내가 태어난지 며칠이 되었는지 알아보기
as.Date("2019/11/05") - my_bir

#(3) 올해의 크리스마스 요일 2가지방법(요일명,숫자)
chris_19 <- as.Date('12/25/2019',format='%m/%d/%Y')
format(chris_19, "%m")
format(chris_19, "%B")

#(4) 2020년 1월 1일 어떤 요일
weekdays(as.Date("2020/01/01"))

#(5) 오늘은 xxxx년x월xx일x요일입니다 형식으로 출력
cat("오늘은", format(today, "%Y년 %m월 %d일")," 입니다")

#(6) emp 데이터셋에서 직원들의 입사년도만 출력
emp <- read.csv("emp.csv")
emp %>% 
  select(hiredate) 