library(dplyr)

# 가로로 합치기
# 중간고사 데이터 생성
test1 <- data.frame(id = c(1, 2, 3, 4, 5),  midterm = c(60, 80, 70, 90, 85))
# 기말고사 데이터 생성
test2 <- data.frame(id = c(1, 5, 3, 4, 2),  final = c(70, 83, 65, 95, 80)) #순서가 바뀌어 있어도 알아서 찾아줌



# id 기준으로 합치기
total <- left_join(test1, test2, by = "id")#id 기준으로 합쳐 total에 할당 #cbind와 비슷하지만, id 값 별로 다르다는 차이점이 존재
cbind(test1,test2) #비교 


test3 <- data.frame(id = c(1,2,3,4,5,7,8,9,10), 
                  semi = c(56,31,78,65,80,100,90,95,80))

testLeft_join <- left_join(test1, test3, by='id') #id : 1~5까지만 join



#다른 데이터 활용해 변수 추가하기
# 반별 담임교사 명단 생성
name <- data.frame(class = c(1, 2, 3, 4, 5), teacher = c("kim", "lee", "park", "choi", "jung"))

# class 기준 합치기
exam_new <- left_join(exam, name, by = "class")



# 세로로 합치기
# 학생 1~5번 시험 데이터 생성
group_a <- data.frame(id = c(1, 2, 3, 4, 5),  test = c(60, 80, 70, 90, 85))
# 학생 6~10번 시험 데이터 생성
group_b <- data.frame(id = c(6, 7, 8, 9, 10),  test = c(70, 83, 65, 95, 80))
#세로로 합치기
group_all <- bind_rows(group_a, group_b)  # 데이터 합쳐서 group_all에 할당
#rbind 보다 빨라서 데이터가 클 때 사용하는 것이 권장된다. 




###############       결측치(NA)와 이상치 처리      ######################

#@@@@@@  결측치 부터 

'~ 이상치 정해진 범주에서 벗어나는 값.' 
df <- data.frame(sex = c("M", "F", NA, "M", "F"), 
                 score = c(5, 4, 3, 4, NA))


# 결측치 확인하기
is.na(df)         # 결측치 확인
a<-table(is.na(df))  # 결측치 빈도 출력


# 변수별로 결측치 확인하기
table(is.na(df$sex))    # sex 결측치 빈도 출력
table(is.na(df$score))  # score 결측치 빈도 출력

# !!!!!! 결측치 포함된 상태로 분석
'결측치가 포함된 연산 = NA!!!'
mean(df$score)  # 평균 산출
sum(df$score)   # 합계 산출

# 결측치 있는 행 제거하기
library(dplyr) # dplyr 패키지 로드
df %>% filter(is.na(score))   # score가 NA인 데이터만 출력
df %>% filter(!is.na(score))  # score 결측치 제거

# 결측치 제외한 데이터로 분석하기
df_nomiss <- df %>% filter(!is.na(score))  # score 결측치 제거
mean(df_nomiss$score)                      # score 평균 산출
sum(df_nomiss$score)                       # score 합계 산출

## 여러 변수 동시에 결측치 없는 데이터 추출하기
#방법1 : filter  _  score, sex 결측치 제외
df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))
df_nomiss  


#방법2 : omit 결측치!! 한번에 제거하는 함수!
df_nomiss2 <- na.omit(df)  # 모든 변수에 결측치 없는 데이터 추출



#방법3 : 함수 아규먼트 이용 'na.rm =T'
#        필요성)분석에 필요한 데이터까지 손실 될 가능성 유의
#        함수의 결측치 제외 기능 이용하기 - na.rm = T!!
mean(df$score, na.rm = T)  # 결측치 제외하고 평균 산출
sum(df$score, na.rm = T)   # 결측치 제외하고 합계 산출
#summarise()에서 na.rm = T사용하기 ~ 대부분 통계함수에 아규먼트로 포함되어있다.

# 결측치 생성
setwd('data')
exam <- read.csv("csv_exam.csv")            # 데이터 불러오기
table(is.na(exam))
exam[c(3, 8, 15), "math"] <- NA             # 3, 8, 15행의 math에 NA 할당


'갑자기 궁금 NA 인덱싱?'
exam[is.na(exam)==T]        # [1] NA NA NA
which(is.na(exam)==T)       # [1] 43 48 55   


#평균 구하기
exam %>% summarise(mean_math = mean(math))             # 평균 산출
exam %>% summarise(mean_math = mean(math, na.rm = T))  # 결측치 제외하고 평균 산출

# 다른 함수들에 적용
exam %>% summarise(mean_math = mean(math, na.rm = T),      # 평균 산출
                   sum_math = sum(math, na.rm = T),        # 합계 산출
                   median_math = median(math, na.rm = T))  # 중앙값 산출
mean(exam$math, na.rm = T)  # 결측치 제외하고 math 평균 산출


boxplot(exam$math)
summary(exam$math)

# 평균으로 대체하기
exam$math <- ifelse(is.na(exam$math), 55, exam$math)  # math가 NA면 55로 대체
table(is.na(exam$math))                               # 결측치 빈도표 생성
mean(exam$math)  # math 평균 산출


#@@@@@@ 이상치 

# 이상치 포함된 데이터 생성 - sex 3, score 6
outlier <- data.frame(sex = c(1, 2, 1, 3, 2, 1),  score = c(5, 4, 3, 4, 2, 6)) 

# 이상치 확인하기
table(outlier$sex)

table(outlier$score)

# 결측 처리하기 - sex
# sex가 3이면 NA 할당
outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)

#결측 처리하기 - score
# sex가 1~5 아니면 NA 할당
outlier$score <- ifelse(outlier$score > 5, NA, outlier$score)
'왜 NA로 변경?? : omit()함수나 na.rm=T 아규먼트로 없앨 수 있으니까 
 NA를 다루는 함수와는 달리 이상치를 다루는 함수 거의 없다... '

# 결측치 제외하고 분석
outlier %>%
  filter(!is.na(sex) & !is.na(score)) %>%
  group_by(sex) %>%
  summarise(mean_score = mean(score))

mpg <- as.data.frame(ggplot2::mpg)
boxplot(mpg$hwy)  #똥그라미 : 이상치 ~ boxplot에서 이상치 확인 가능!!

#상자그림 통계치 출력
boxplot(mpg$hwy)$stats  # 상자그림 통계치 출력

# 결측 처리하기
# 12~37 벗어나면 NA 할당
mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy > 37, NA, mpg$hwy)
table(is.na(mpg$hwy))
# 결측치 제외하고 분석하기
mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy, na.rm = T))



#질문
format(today, "%d일 %B %Y년")  #%B  : Augst
format(today, "%d일 %b %Y년")  #        Aug




##############    시간 처리하기  ######################

#Sys. ~~  : 시스템에서 제공하는 정보를 활용하는 함수

(today <- Sys.Date())
tt<-Sys.time()
class(tt)
#format 함수 이용   :  %O  : 이런 형식을 포맷문자라고 한다. 

format(today)
format(today, "%Y년 %m월 %d일")
format(today, "%d일 %B %Y년")    #%B : 월을 출력하는데 월 이름으로 출력해라.는 함수  ==  %m월
format(today, "%y")
format(today, "%Y")         #2019
format(today, "%B")         #월 이름
format(today, "%a")         #요일
format(today, "%A")         #요일_풀네임

format(tt, '%H')         #시간
format(today2, '%S')         #초

format(20170812, "%Y년 %m월 %d일")   #Error


today2 <- strptime('2019-08-21 14:10:30', "%Y-%m-%d %H:%M:%S")


#Sys.Date() : Date객체 
'1. Date객체를 문자열로 바꾸는 함수 : format(date, format=)
    
    >ex. format(today, format="%Y:%m:%d" )   ~ 문자열
 
 
 2. 반대로 문자열을 Date객체로 바꾸는 방법 : as.Date(string, format=)
   

    >ex. as.Date(2019-11-07), as.Date("07일 11월 2019년",format ="%d일 %B %Y년")'


a<-as.Date('2019-11-07', format = '%Y-%m-%d')
class(a)


' 3. # 문자열을 날짜형으로 :  as.Date()
  4. # 문자열을 날짜+시간형으로  : strptime()



  5. Date는 날짜까지... 
     시간/초 단위 사용하려면 POSIX'






weekdays(today)  #  == %A    : 날짜함수 vs 포맷문자 
months(today) 
quarters(today)
unclass(today)  # 1970-01-01을 기준으로 얼마나 날짜가 지났지는 지의 값을 가지고 있다.
Sys.Date()
Sys.time()
Sys.timezone()

as.Date('1/15/2018',format='%m/%d/%Y') # format 은 생략 가능
as.Date('4월 26, 2018',format='%B %d, %Y')
as.Date('22118',format='%d%b%y')   #년 - 월 - 일  ~  

#자릿수 맞추는것이 원칙 
as.Date('220118',format='%d%b%y') 

today
x1 <- "2019-01-10 13:30:41"
# 문자열을 날짜형으로
as.Date(x1, "%Y-%m-%d %H:%M:%S")   #%m : 월 ,  %M : 분
# 문자열을 날짜+시간형으로
'strptime() 함수는 날짜처럼 생긴 문자열을 받아서 사람이 지정한 포맷으로 R이 읽게 해서 시간으로 이해하게끔 하는 함수이다.
'
strptime(x1, "%Y-%m-%d %H:%M:%S")
strptime('2019-08-21 14:10:30', "%Y-%m-%d %H:%M:%S")

x2 <- "20180601"
as.Date(x2, "%Y%m%d")
as.Date(x2, '%d')
strptime(x2, "%Y%m%d")
strptime(x1, '%Y-%m-%d %H:%M:%S')
strptime(x1, '%H')
strptime(x2, '%S')
str(strptime(x2, "%Y%m%d"))
#POSIXlt 날자,시간 처리객체 
#POSIXct :초 단위로 저장 ,POSIXlt :  날짜에 맞춰 리스트로 보관

#DATE는 날자
as.Date("2018/01/01 08:00:00") - as.Date("2018/01/01 05:00:00")   #년/월/일/ 형식이 안맞으면, format문자로 지정해줘야 한다.



#초단위는 POSIX  _ 시간
as.POSIXct("2018/01/01 08:00:00") - as.POSIXct("2018/01/01 05:00:00")
as.POSIXlt("2018/01/01 08:00:00") - as.POSIXlt("2018/01/01 05:00:00")

t<-Sys.time()  #국제표준규정시 
ct<-as.POSIXct(t); 
lt<-as.POSIXlt(t)


str(ct) 
str(  )
is.list(lt)
unclass(ct) #1970-01-01을 기준으로 지난 초시간  unclass 객체를 푼다.  
ul<-unclass(lt)   # 따라서 단순 시간 차이가 아니라 날짜 / 월 등 뽑아서 쓸 일이 많으면 POSTLT형식이 좋다. 
ul[1]             # 인덱싱 가능 
unlist(lt)

lt$mon+1       #  만든사람 특이점; mon +1  ... 배열형식에 맞춰서
lt$hour
'unlist( ) 함수로 받아 인덱싱해서 활용가능 요일+1, 월+1, 년도 + 1990'

lt$year+1900
as.POSIXct(1449894437,origin="1970-01-01")     #이런 1970년 기준 초시간 : 리눅스 시간 형태..
as.POSIXlt(1449894437,origin="1970-01-01")

as.POSIXlt("2019/11/05")$wday  #요일에 해당되는 숫자 0~6 : 일 ~토 
as.POSIXlt("2019/08/23")$wday
as.POSIXlt("2019/08/24")$wday
as.POSIXlt("2019/08/25")$wday
as.POSIXlt("2019/08/26")$wday


#즉석실습 - date_lab.R 로 제출한다.
#(1) 내가 태어난 요일 출력하기
me <- as.Date("1993/08/15")
weekdays(me)

#(2) 내가 태어난지 며칠이 되었는지 알아보기
# Sys.Date - me
as.Date('2019/11/05') - me


#(3) 올해의 크리스마스 요일 2가지방법(요일명,숫자)
#1
ch <- as.Date('2019/12/25')
weekdays(ch)

lt <- as.POSIXlt(ch)
unclass(lt) 
#3  ....근데 왜 타임좀 UTC??


#(4) 2020년 1월 1일 어떤 요일
new <- as.Date('2020/01/01')
weekdays(new)

#(5) 오늘은 xxxx년x월xx일x요일입니다 형식으로 출력

cat( format(today, "%Y"),'년',format(today, '%B'),'월',format(today, '%d'),'일',
     weekdays(today),'요일 입니다.'
     )


# (6) emp 데이터셋에서 직원들의 입사년도만 출력
emp <- read.csv('emp.csv')
View(emp)
emp$hiredate
as.character(emp$hiredate)[3]

as.Date(emp$hiredate)


format(as.Date(emp$hiredate),"%Y") 











##################    데이터 시각화    ###################
 

######### 1.plot함수 



국어<- c(4,7,6,8,5,5,9,10,4,10)  
plot(국어)       #plot 원래 2개 데이터로 하는데 하나로 하면 x축은 index가 지정된다. 

plot(국어, type="o", col="blue")       
title(main="성적그래프", col.main="red", font.main=7) 

국어 <- c(4,7,6,8,5,5,9,10,4,10)
수학 <- c(7,4,7,3,8,10,4,10,5,7)

plot(국어, type="o", col="blue") #아규먼트_ 첫 번째 x축(디폴트 :인덱스), 두 번째 y축 
lines(수학, type="o", pch=16, lty=2, col="red")     
title(main="성적그래프", col.main="red", font.main=4)

국어 <- c(4,7,6,8,5,5,9,10,4,10)
par(mar=c(1,1,1,1), mfrow=c(4,2))  #상하좌우 마진  /  구간나누기행렬

                                                   #x축제거  y축 제거 
plot(국어, type="p", col="blue", main="type = p", xaxt="n", yaxt="n")
plot(국어, type="l", col="blue", main="type = l", xaxt="n", yaxt="n")
plot(국어, type="b", col="blue", main="type = b", xaxt="n", yaxt="n")
plot(국어, type="c", col="blue", main="type = c", xaxt="n", yaxt="n")
plot(국어, type="o", col="blue", main="type = o", xaxt="n", yaxt="n")
plot(국어, type="h", col="blue", main="type = h", xaxt="n", yaxt="n")
plot(국어, type="s", col="blue", main="type = s", xaxt="n", yaxt="n")
plot(국어, type="S", col="blue", main="type = S", xaxt="n", yaxt="n")

국어 <- c(4,7,6,8,5,5,9,10,4,10); 
수학 <- c(7,4,7,3,8,10,4,10,5,7)
par(mar=c(5,5,5,5), mfrow=c(1,1))
plot(국어, type="o", col="blue", ylim=c(0,10), axes=FALSE, ann=FALSE) 
                                # y축 범위    축           축 라벨
# x, y 축 추가하기
axis(1, at=1:10, lab=c("01","02","03","04", "05","06","07","08","09","10")) # x축 추가
axis(2, at=c(0,2,4,6,8,10))  # y축 추가

#사이즈가 안 맞아서 글씨 다 안나와 _ 글씨 크기를 줄여서...해결..



# 그래프 추가하고, 그래프에 박스 그리기
lines(수학, type="o", pch=16, lty=5, col="red")    
box()   # 박스 그리기


# 그래프 제목, 축의 제목, 범례 나타내기
title(main="성적그래프", col.main="red", font.main=4) 

title(xlab="학번", col.lab=rgb(0,1,0))  #16진수로 표현해도 되고 
                                        #rgb함수를 사용해도 된다.
title(ylab="점수", col.lab=rgb(1,0,0)) 


legend(8, 2, c("국어","수학"), cex=0.8, col=c("blue","red"), pch=c(21,16), lty=c(1,2))  
#legend(x축 위치,y축 위치, 레전드명, 크기, 칼라, 점 모양, 선 형태)
      

(성적 <- read.table("성적.txt", header=TRUE));
#read.csv 는 무조건 첫번째 행을 제목으로 읽으들인다  ,가 seperator.
#read.table은 헤더 없이 데이터로 다 인식해버린다  공백이나 탭이 seperateor . 


plot(성적$학번, 성적$국어, main="성적그래프", xlab="학번", ylab="점수",  xlim=c(0, 11), ylim=c(0, 11)) 
#학번별 국어성적을 그리겠다. 



ymax <- max(성적[3:5]) #성적 데이터 중에서 최대값을 찾는다(y 축의 크기 제한)
ymax
pcols<- c("red","blue","green")


#png : 지금부터 출력되는 플롯은 플롯창이 아니라 성적.png라는 파일로 보내겠어 : 파일네임, 픽셀지정, 배경색 
png(filename="성적.png", height=400, width=700, bg="white") # 출력을 png파일로 설정

'png말고도 
gif : 사이즈는 작은데 해상도가 떨어진다. 고화질 사진같은건 gif로는 버겁다.  , 
>jpeg : 해상도가 높다. 거의 사진들은 jpeg 근데 너무 사이즈가 크다 
>>png : jpeg보다는 가벼운데 해상도도 높다. 모바일환경에서 특히 대세 '


plot(성적$국어, type="o", col=pcols[1], ylim=c(0, ymax), axes=FALSE, ann=FALSE)
axis(1, at=1:10, lab=c("01","02","03","04","05","06","07","08","09","10"))
axis(2, at=c(0,2,4,6,8,10), lab=c(0,2,4,6,8,10))
box()
lines(성적$수학, type="o", pch=16, lty=2, col=pcols[2])
lines(성적$영어, type="o", pch=23, lty=3, col=pcols[3] )
title(main="성적그래프", col.main="red", font.main=4)
title(xlab="학번", col.lab=rgb(1,0,0))
title(ylab="점수", col.lab=rgb(0,0,1))
legend(1, ymax, names(성적)[c(3,4,5)], cex=0.8, col=pcols, pch=c(21,16,23), lty=c(1,2,3))

dev.off() #출력다 넣고 dev.off해줘야 한다. 


#포뮬라 식 ; 개발자들 마다 마음에 드는 것으로 쓰면된다. 
plot(국어, 수학)
plot(수학~국어) #y축~x축  : 국어 성적에 기반한 수학성적의 분포 _뒤부터 읽는다. 









#########  2.막대그래프 그리기


#디폴트 :  x: 인덱싱,  y축 : 인덱싱 값
'백터형 : 막대기 하나  /   매트릭스 : 막대누적 or 나란히 '

국어
barplot(국어)


coldens <- seq(from=10, to=100, by=10)   # 막대그래프의 색밀도 설정을 위한 벡터


# 막대그래프 X 축 설정 = 백터 데이터 이름  
xname <- 성적$학번                       


#barplot(백터or매트릭스,  mian = '그래프제목' , x/ylab = 'x/y라벨링', border = '테두리 색', col =' 그래프 색', density='밀도', names.arg = 'x아규먼트 네이밍')
barplot(성적$국어, main="성적그래프", xlab="학번", ylab="점수", border="red", col="green", density=coldens, names.arg=xname)
                                                                                                #밀도          

# 학생의 각 과목에 대한 각각의 점수에 대한 그래프
성적1<- 성적[3:5] 
View(성적1)
str(성적1)
par(mar=c(5,5,5,5), mfrow=c(1,1))
barplot(as.matrix(성적1), main="성적그래프", ylab="점수", beside=T, col=rainbow(10))
barplot(as.matrix(성적1), main="성적그래프", ylab="점수", col=rainbow(10))  #stat방식 


par(mar=c(5,5,5,5), mfrow=c(1,2))
barplot(as.matrix(성적1), main="성적그래프", ylab="점수", col=rainbow(10))

#transposition : 행렬 바꾼다.                                       원래는 과목을 기준으로 한 학생 수 
barplot(t(성적1), main="성적그래프", ylab="점수", col=rainbow(10))  #학생을 기준으로 한 취득 점수 



# 학생의 각 과목에 대한 합계 점수에 대한 그래프

par(mar=c(5,5,5,5), mfrow=c(1,1)) #초기화 

xname <- 성적$학번;    #  x축 레이블용 벡터


par(xpd=T, mar=par()$mar+c(0,0,0,4));   # 우측에 범례가 들어갈 여백을 확보
                                        #원래 마진에서 오른쪽만 공간 추가.
                                        # 6시 기준으로 시계방향
                                        # xpd = T : 그래프를 그릴 때 공간 부족하면 마진영역까지 확장해서 그려라 

barplot(t(성적1), main="성적그래프", ylab="점수", col=rainbow(3), space=0.1, cex.axis=0.8, names.arg=xname, cex=0.8)
legend(11,30, names(성적1), cex=0.8, fill=rainbow(3));

# 학생의 각 과목에 대한 합계 점수에 대한 그래프(가로막대 그래프)
xname <- 성적$학번;    #  x축 레이블용 벡터
barplot(t(성적1), main="성적그래프", ylab="학번", col=rainbow(3), space=0.1, cex.axis=0.8, names.arg=xname, cex=0.8, horiz=T);
legend(30,11, names(성적1), cex=0.8, fill=rainbow(3))








############## 3. 파이그래프


'R에서 구분이 잘 안된다는 이유로 가장 활용도가 낮다.
파이 그래프 시작각도 : 3시 방향에서 +  반시계 방향'


(성적 <- read.table("성적.txt", header=TRUE));

pie(성적$국어, labels=paste(성적$성명, "-", 성적$국어), col=rainbow(10))

pie(성적$국어, clockwise=T, labels=paste(성적$성명, "-", 성적$국어), col=rainbow(10))
               #시계방향 시작   + 자동으로 12시부터 시작각도 시작(디폴트) _조정가능 

pie(성적$국어, density=10, clockwise=T, labels=paste(성적$성명, "-", 성적$국어), col=rainbow(10))
               #밀도 조절

pie(성적$국어, labels=paste(성적$성명, "-", 성적$국어), col=rainbow(10), main="국어성적", edges=10)
                                                                          # edges : 값이 클수록 끝에 잘라  

pie(성적$국어, labels=paste(성적$성명,"\n","(",성적$국어,")"), col=rainbow(10))

pie(rep(1, 24), col = rainbow(24), radius = 1)
               #라벨 지정안해서 값이 라벨 /  radius는 반지름 : 확대정도 