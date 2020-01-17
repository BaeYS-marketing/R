#즉석실습 - date_lab.R 로 제출한다.
#(1) 내가 태어난 요일 출력하기
me <- as.Date("1993/08/15")
weekdays(me)

#(2) 내가 태어난지 며칠이 되었는지 알아보기
# Sys.Date - me  date객체 - date 객체 =  객체 
as.Date('2019/11/05') - me


#(3) 올해의 크리스마스 요일 2가지방법(요일명,숫자)
#1
ch <- as.Date('2019/12/25',tz = 'KST')  #년/월/일 순서면 포맷문자 지정 안해도 된다.
weekdays(ch)

#1
lt <- as.POSIXlt(ch)
unclass(lt) 
                                #디폴트 UCT : 협정 세계시

#2
as.POSIXlt(ch)$wday


#(4) 2020년 1월 1일 어떤 요일
new <- as.Date('2020/01/01')
weekdays(new)

#(5) 오늘은 xxxx년x월xx일x요일입니다 형식으로 출력

#1
cat( format(today, "%Y"),'년',format(today, '%B'),'월',format(today, '%d'),'일',
     weekdays(today),'요일 입니다.'
)


#2
format(today, '오늘은 %Y년%B%d일 입니다.')




# (6) emp 데이터셋에서 직원들의 입사년도만 출력
emp <- read.csv('emp.csv')
View(emp)
emp$hiredate
as.character(emp$hiredate)[3]

as.Date(emp$hiredate)


format(as.Date(emp$hiredate),"%Y")   
#함수 출력이 백터로 연산 결과로 각각 뱉어준다. 


