

#문제1
grade <- sample(1:6,1)
grade <- paste(grade,'학년' ,sep='')
grade

result<- switch(EXPR = grade ,"1학년"=,"2학년"=,'3학년'='저학년입니다.', 
       '고학년입니다.')

cat( grade,'은 ', result ,sep='')



################# 문제2 ##############

#교훈1 : { } 를 쓰는 이유와 위치
#교훈2 : else 다음에는 조건문 X
#교훈3 : ~~문 > 단독으로만 쓰인다 대입X

choice <- sample(1:5,1)

if(choice ==1){ result<-300+50  
}else if(choice ==2){ result<-300-50
}else if(choice ==4) { result<-300/50
}else if(choice ==3) { result<-300*50
}else {result<-300%%50}

result

cat('결과값',':',result)




#컴파일언어 : C,C++,C#,Java
'[프로그램 소스파일작성](.java , .R)
--> [번역] (컴파일) 
-->[실행파일](.exe , .class 등)    #번역과 실행파일 과정에서 엄격하게 따짐
-->[실행파일로 실행]

장점 : 엄격한 대신 수행이 빠르다'

#인터프리터언어 : R,Python,JavaScript
'[소스파일작성 or 코드 명령어 작성](현재 우리가 하고있는 것)

-------------> [번역] + [실행] 동시에 수행

코드의 간편화 
실행속도는 느리다. 느슨하다( result <-if 가 실행됐던 이유 )'






#문제3
count <- sample(3:10,1)
deco <- sample(1:3,1)

if(deco==1){
        rep('*',count)
}else if(deco ==2){
        rep('$',count)
}else {
        rep('#',count)}



count <- sample(3:10,1)
deco <- sample(1:3,1)
if(deco==1){
  for(i in 1:count)            #for(i in count) vs for(i in 1:count)
    cat('*')                      
}else if(deco ==2){
  for(i in 1:count) 
    cat('#')
}else { for(i in 1:count) 
  cat('$') 
}





count <- sample(3:10,1)
deco <- sample(1:3,1)

if(deco==1){
  for(i in 1:count)cat('*')
}else if(deco ==2){
  for(i in 1:count) cat('#')
}else{ 
  for(i in 1:count) cat('$') 
} 




for(i in 1:count){
  if(deco==1){
    cat('*')
  }else if(deco ==2){
    cat('$')
  }else if(deco ==3){
    cat('#')
  }
}


# a*4 > error   백터 연산은 안된다.



########## 벡터에 대해 내가 헷갈리는 지식 ##############

#백터의 정의, 연산 <-> 인덱싱


a<-c(1,2)             #성공
a*2

b<-[1,2,3,4]          ###오류   백터정의 명령어 따로X


c<-c('*')             ###오류   문자는 수리연산 못한다.
c*4

##########################################################







#문제4
score <- sample(1:100,1)
score2<-as.character(score %/% 10)
score2

result <- switch(EXPR = score2 , '0'=,'9'= 'A 등급',
                 '8'= 'B 등급',
                 '7'= 'C 등급',
                 '6'='D 등급',
                 'F 등급')
result

cat( score,'점은 ',result,'입니다.' ,sep='')






#문제5
Alpha<-paste(LETTERS[1:26],letters[1:26], sep='')
Alpha

