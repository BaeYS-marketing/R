#2주차 수업일정과 복습.


#28일
'교재내용, 웹기술의 개요'


#app 
'스마트폰에 들어가는 조그마한 프로그램 _ 간단한 프로그램'
#application
'app 보다 더 큰'



#웹 기술의 개요(HTML, CSS Selector, Xpasth, javaScript)
'대략 어떤 건지 구분만 할줄 알면 된다.'

#HTML
'거의 대부분 웹은 HTML 인데 특정 부분만 크롤링할 거니까 그런 걸 할 줄 알면된다.'





#29일
'정적 컨텐츠의 크롤링 &스크래핑'


#30일
'동적 컨텐츠의 크롤링 &스크래핑'


#31일
'크롤링 &스크래핑 실습'


#1일
'공공DB , SNS의 Open API를 활용한 데이터 수집'




#교재 복습.

' ----------------------  데이터 불러오기 ----------------------------- '

?read.csv
#, 로 구분되면 

search()  # 설치된 패키지 중 load 된 함수
installed.packages()

?read.table #  ,로 구분이 아닌   _ tab등 공백(balnk)가 구분자. // read.talbe( sep =',') == read.csv

read.csv() # ,로 구분된   _ argument : head, nrows(skip) 자주 쓴다. +, col.names = 

?read_excel
??read_excel

install.packages('readxl')
library(readxl)


read_data_ex <- read_excel('C:/Rstudy/book/data_ex.xls')
read_data_ex


read_data_ex2<-read.table('C:/Rstudy/book/data_ex.xls')
read_data_ex2        #엑셀 파일 : read_excel()로 
                    


###### 불러오기 비교

#1 txt1 <- read.csv("csv_test.txt")    //정상적으로 불러집니다
#2 txt2 <- readLines("csv_test.txt")     //파일의 여러 줄을 한 줄로 쭉 불러옵니다
#3 txt3 <- read.table("csv_test.txt")     //컬럼 구분을 하지 못합니다

#4 scan() : 함수로 텍스트 파일 불러오기
#5 read.table() : 일반 텍스트 형태의 파일을 읽어서 데이터프레임에 담기
#6 read.line() : 함수로 한줄 읽어들이기
#7 readLines() : 파일에서 데이터를 읽어서 벡터 배열로 만들어주는 함수

#8 read.csv 1행 header로 인식 [vs] read.table 1행 인식X





' ----------------------  데이터 저장하기 ----------------------------- '

#1 .rda로 저장하기  : save()
ID <- c(1,2,3,4)
SEX <- c('F','M','F','M')
data.ex <- data.frame(ID = ID, SEX = SEX)
data.ex

save(data.ex, file = 'data_ex.rda') #rda : R전용 파일.
getwd()
load('C:/Rstudy/data_ex.rda')


#2 .csv로 저장하기  :  write.csv()


#3 .txt로 저장하기  :  write.talbe()







' -------------------데이터 전처리 시작 :  변수명 변경하기 ------------------- '

#1. names()  ~ 단점 : 바꿀려면 전체를 불러서 셋팅해야된다.

#2. dplyr 패키지 설치.




