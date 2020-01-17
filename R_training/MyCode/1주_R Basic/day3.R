y <- c(0,25,50,75,100)
z <- c(50,50,50,50,50)


y == z

##############  백터연산 이해  #################
y <- c(0,25,50,75,100)
y == 50     # 1. 50 이라는 백터 -> [50] | c(50)
            # 2. y 백터와 연산하기 위해 개수 자동으로 맞춘다.
            # 3. 50 -> 50 50 50 50 50
            # 4. 논리 연산자

num1 <- 11
num2 <- 3

#나눗셈 연산  :  /  , %%   ,  %/%
num1 / num2
num1 %% num2
num1 %/% num2




################## 리스트의 이해  ####################
#LIST
lds <- list(1,2,3)   # 리스트는 각각의 원소를 '데이터 셋'으로 저장한다.
lds                                         # = 서브리스트

lds +100        # 오류
lds[1]
class(lds[1])  
lds[1] + 100     # list : list _ 보따리로는 연산 불가능(오류)
lds[[1]] + 100   # 백터로 추출해서 원소마다 연산해준다. 

names(lds) <- LETTERS[1:3]
lds

lds[2]
lds[[2]]

lds['B']
lds[['B']]

lds$B
is.vector(lds$B)          #TRUE

d <- list(-1,-5)
d[1]
d[[1]]


a <- list(
    a = 1:3,
    b = 'a string',
    c = pi,            #pi는 내장벡터
    d = list(-1,-5)
    )
    
a[1]
a[[1]]     
a$a
is.vector(c(a[[1]],a$a))    #TRUE
a['a']
a[['a']]

a$a+1
a$a[1]
a[1]+1                    #FALSE : 연산은 벡터로 
a[[1]]+1                  
a[[1]][2] + 100

new_a <- unlist(a[1])
a[1]
new_a[1]                 #unlist() : 전부 벡터

new_aa <- unlist(a) ; new_aa 


names(a) ;a
names(a) <- NULL  ;a

names(new_a) <- NULL

new_a










######### 객체 저장  ##########

ls()
length(ls())
getwd()
save(list=ls(),file = 'all.rda')  #파일 저장: save()  .rda로 저장
rm(list=ls())                    
ls()
load('all.rda')                   #불러오기_save 저장파일 : load() 
ls()












#R의 데이터 입출력
#print 아규먼트(argument) : quote, print.gap
#cat
print(LETTERS)
print(LETTERS, quote = 'FALSE')
print(LETTERS, print.gap = 5)

print(100); print(101)
cat(100); cat(101)

######## print와 cat의 차이점 ##########
print('R','통계분석', '언어입니다.')    # print오류 : 단일출력만 

print(paste('R','통계분석', '언어입니다.'))
print('R은 통계분석 언어입니다.')

cat('R','통계분석' ,'언어입니다.')   #cat : print + paste

cat('R','통계분석' ,'\n','언어입니다.')   #\n : 개행







###########       #R이 불러올 수 있는 데이터     #############
'1.숫자로만 구성된 데이터 파일
 2.일반 텍스트 단위파일 : a. 행 단위
                          b. 워드 단위(스페이스or탭)
 3.csv 형식의 데이터 파일 
 4.EXCEL 형식의 데이터 파일
 5.XML 형식의 데이터 파일   등
 6.DataBase의 데이터 ~ 오라클, mySQL 등
 7.JSON 형식의 데어터 파일' 


#1) scan()
#2) reaLines()
#3) scan( , what= '') : 텍스트파일 읽어옴  //sep : 으로 구분!
#4) read.csv()
#5) 패키지 추가설치 
#6) 패키지 추가설치
#7)   "
#8)   "

 


#XML(Extensible Markup Language)
'공공관에서 특히 많이 사용
Markup 앞과 뒤에 표시했다.
시작 태그, 종료 태그 안에 있는 내용을 콘텐츠라고 함
태그 형태로 앞/뒤 표시, 태그는 우리가 설정(Extensible)'






#JSON (JavaScript Object Notation)

"www.janson.org  _ XML보다 가벼워서 뜨고있는 언어.

{
    '이름' : 값,'이름' : 값,'이름' : 값, ..
}"




    

    
#데이터 읽어오기
getwd()
setwd('c:/Rstudy')
nums <- scan('data/sample_num.txt')
word_ansi <- scan('data/sample_ansi.txt', what=''); word_ansi
#문자로 읽을 것인지 숫자로 읽은 것인지 , 문자있으면 문자로 읽어야된다.

words_utf8 <-scan("data/sample_utf8.txt", what="", encoding="UTF-8")
words_utf8
new_utf8<-words_utf8 <-scan("data/sample_utf8.txt", what="")
new_utf8






#################   encoding 해설   ######################

'컴퓨터는 : 0 과 1로만 인식한다.   ex. 3  -  00000011  - 1byte
                                             이진법    저장용량


질문 : 그럼 문자는 컴퓨터가 어떻게 인식할까?
답 : 숫자로 저장한다.

<영어>
"a" ~ "z" , "A" ~ "Z"    :   16진수 : 0x61  - a   ,  0x41  -  b
                             
                        a -  컴퓨터 저장 2진수 : 01100001
                        

<한글>
1970년대만 해도 제조사마다 한글표현 방법이 각기 달랐다.

1989년 행정전상망 도입 : 옛날 증서 발급받을려면 그 지역으로 가야됐다
- 따라서 제조사별로 지역 배정 - 코드 통일화 프로젝트 실시

1989년 즉! 완성형한글코드(KSC5601) 배급됐다.

: 영어는 그대로, 한글은 가-힣
  한글 시작코드 : 가 (16진수 : 0xB0A1 _ 2byte) ~ 2진수 2개로 구성된다.
  한글 마지막코드 : 힣 
 

<ANSI> 한국에서 
KSC5601

cf.한국처럼 중국,일본 등 각기 16진수 2바이트로 각기 나라 언어 지정
   영어는 그대로

<EUC-KR,  CP949,MS949 _ 마이크로소프트에서>
외국에서 한글 캐릭터셋을 나타내는 고유셋
: 메모장에서는 EUC-KR, CP949,MS949  > ANSI로 표기


왜 굳이 이렇게 복잡한가?!
<전세계 문자를 하나로 통일하자>
> UNICODE
 
: 모든 언어 2byte(16bit)로 저장 - UTF-16


2바이트 체제이다 보니 제외된 나라의 언어가 생기기 시작

그래서 다시 전세계 언어를 다 담았다.
:1바이트~4바이트로 표현 : UTF-8    (cf. 한글은 3바이트)


우리나라 보면 80% UTF-8로 넘어가는 단계
운영체제가 따라줘야되는거 :맥,OS는 다 넘어갔어
MS가 아직 다 넘어가지 못했다.
현재 MS도 많이 UTF-8 지원하고 있는 단계 

: 따라서 인코딩을 맞춰서 해줘야 된다.
CP949,KSC5601 .. 로 만들어진 파일 인코딩 : ANSI
UTF-16 로 만들어진 파일 인코딩 : UTF-16
UTF-8 로 만들어진 파일 인코딩 : UTF-8'
 
 
 
 #결론 : default 값은 ANSI 
 #      한글이 깨지면 UTF-8로 인코딩
 
 




#제어문 if
#1
randomNum <- sample(1:10,1)
if(randomNum>5){
    cat(randomNum, ": 5보다 크군요","\n")
}else{
    cat(randomNum,":5보다 작거나 같군요",'\n')
}

#2
if(randomNum%%2){
  cat(randomNum,'홀수','\n')
}else{
  cat(randomNum, '짝수',"\n")
}
 

############# 조건식이해 ############

#if(randomNum%%2) 에서 조건식이 T/F로 주어지지 않는데 
#어떻게 수행이 되는 것인가!!!!

#>>> '0' or '1'로만 결과값이 나오기 떄문에 가능


#3
score <- sample(1:100,1)

if (score >=90){
  cat(score, "는 A등급입니다.",'\n')
}else if ( score >=80) {
  cat(score, "는 B등급입니다.",'\n' )
}else if ( score >=70){
  cat(score, "는 C등급입니다.",'\n')
}else if ( score >= 60 ) {
  cat(score, "D등급 입니다.",'\n')
}else cat(score,"F등급 입니다.",'\n')
 
 
 
 
 
 
#제어문 for
#1
for(data in month.name){
    print(data)}
for(data in month.name)print(data);print('zz') 
for(data in month.name){print(data);print('zz')}  #중괄호 차이
                      

#2
for(n in 1:5)cat('hello?', '\n')

####차이점 알기!!!!!    n in 1:5   <->   n %in% 1:5



#3
for(i in 1:5){
  for(j in 1:5){
    cat('i=',i,'j=',j,'\n')}
}




#4
for(dan in 1:9){
  for(num in 1:9){
    cat(dan,'*',num,'=',dan*num,'\t')}
  cat('\n','\n')
}

# \n : 개행문자  ,  \t : 탭문자
#     (연산 안됌)







#switch
#1. 문자형
month <- sample(1:12,1)
month <- paste(month,'월',sep='')      #sep = '' 안하면 출력 '가을'
class(month)
result <- switch(EXPR = month,         #EXPR = expression 약자
                 "12월" =, "1월" =,"2월" = '겨울',
                 '3월'=, '4월'=, '5월'= '봄',
                 '6월'=, '7월'=, '8월'= '여름',
                 '가을')
cat(month,'은' ,result, '입니다\n',sep = '')





#2. 숫자형
num <- sample(1:10,1)
num

result2<-switch(EXPR=num, 'a','b','c','d')
result2


#3
for(num in 1:10){
  cat(num, ":", switch(EXPR = num, 'a','b','c','d'),'\n')
}


#4
for(num in 1:10){
  cat(num, ":", switch(EXPR = num, 'a','b','c','d'),'\n')
}


#5
for(num in 1:10){
  num <- as.character(num)
  cat(num, ":", switch(EXPR = num,'7'='a','8'='b','9'='c','10'='d','ㅋ'),'\n')
}

