#제어문 (계속)


#1
sum <- 0
for(i in 5:15){
        if(i%%10 ==0){          #10배수에서 break
                break;          #break 종료
        }
        sum <- sum+i
        print(paste(i,':',sum))
}



#2
sum <- 0
for(i in 5:15){
        if(i%%10 ==0){         
               next;               #next 스킵
        }
        sum <- sum+i
        print(paste(i,':',sum))
}




####### 분기문 제대로 알기!!  @사용 : 웹크롤링할 떄 #########


#break  = 끝                      ~ if
'만난 순간 해당 루프(반복문)를 [종료].'

#next  = 다음순서                 ~ for, while
'만난 순간 현재 실행반복을 종료하고 
다시 원래 반복문으로 돌아가서 [ 다음 반복 순서 차례로] 이동.'






#이번 예제 확인 포인트 
'왜 sumNumber 출력 횟수가 다른가'

sumNumber <-0                #반복문 돌릴 때 변수초기화 중요성!!
                             #그 다음부터 넣는 것은 대입이라고 한다.
while(sumNumber <=20) {
        i <- sample(1:5,1)
        sumNumber <- sumNumber+i
        cat(sumNumber,'\n')           
}


#계속 돌리는데 변수 초기화 안하면 출력 값 안나올꺼야
#for  : 얼마만큼 반복할꺼야
#while : 특정 조건만큼 반복할지 몰라.







#while vs repeat  : 조건을 할당할 수 없을 때 무한루프 안에서 조건 / 성능 테스트 

repeat{
        cat('zzz\n')               #\n : 위치 확인
}


sumNumber<-0
repeat {
        i <- sample(1:5,1)
        sumNumber <- sumNumber+i;
        cat(sumNumber,'\n')
        if (sumNumber>20){
                break;                 #조건 설정해서 빠져나오게
        }
}





baebae <-function(){
        print('qoqoek@naver.com')                #수행문장1
        print(' 배윤성씨 이메일 입니다.')        #수행문장2
                                                 #함수 리턴(결과) :없음 
}

baebae() # 매개변수가 없는 함수 : 호출 시 데이터를 안받겠다.
baebae(1)  #에러






baebae <-function(x){
        print('qoqoek@naver.com')                #수행문장1
        print(' 배윤성씨 이메일 입니다.')        #수행문장2
        return()                                 #함수 리턴 값 없음.
}

baebae(1) # 매개변수가 1개 -> 아규먼트 하나
          # 즉 매개변수(1개)를 통해서 들어오는 아규먼트는 당연히 하나.




baebae <-function(x){
        print('qoqoek@naver.com')                #수행문장1
        print(' 배윤성씨 이메일 입니다.')        #수행문장2
        return('수고하세요')                     #함수 리턴 값 : 문자형 _수고하세요 
}                                                # cf. return(xx) 
                                       #: 함수 출력에서 오류 ~ object 'xx' is not found 

baebae(1)   
#[1] "qoqoek@naver.com"
#[1] " 배윤성씨 이메일 입니다."
#[1] "수고하세요"






#1
f1 <- function()print('TEST')
f1()


#2                           
f2<- function(num){print('TEST');print(num)}
f2(100)
f2('가')
f2(가)  #에러
f2()    #에러 argument 'num' is missing

#print('num') 이면 매게변수 못 받는다. num 문자 받음.


#3
f3 <- function(p='R')print(p)
f3()
f3(p=Python)
f3(p='Python')
f3(python)
f3('Python')


#4
f4<- function(p1='ㅋㅋㅋ',p2)for(i in 1:p2)print(p1)     

#p1은 전달해도 되고 안해도 되고 , 디퐅트 값 'ㅋㅋㅋ'
#p2는 반드시 설정해줘야 한다.


f4(p1='abc',p2=3)
f4()
f4('abc',3)

f4(5)    #에러
f4(p2=5)
f4(,3)   #인터프리터언어라 대강 되는 듯하다.

#cf. rep()로 확인
rep(1:2,3); rep(1:3,times =4); rep(1:3, each=4)








#1
func1 <- function() {
        xx <- 10           #지역변수
        yy <- 20
        return(xx*yy)s
}

func1()

result <- func1()
result

xx   #Error: object 'xx' not found 
     #지역변수는 함수 안에서만 쓸 수 있다. 함수 끝과 동시에 메모리에서 빠짐.
     
     # xx는 '전역변수'



#2
func2 <- function(x,y){
        xx <- x+1 
        yy <- y+1
        return(sum(xx,yy))
}



#3
func3 <- function(x,y) {
        x3 <- x+1
        y3 <- y+1
        x4 <- func2(x3,y3)       #변값(식) : 변수, 리터럴(프로그래밍에서 사용하는 데이터 값,
                                 #         연산식, 호출식 
        return(x4)
}

func3(9,19)




#4
func4 <- function(x=100,y=200,z) {
        return(x+y+z)
}

func4()               #에러  : z아규먼트 디폴트값 없음
func4(10,20,30)       #60
func4(x=1,y=2,z=3)    #5
func4(y=11,z=22,x=33) #66    ~ 아규먼트 지정해서 값 할당할 때는 아규먼트 순서 상관 없다.
func4(z=1000)         #1300



 

#지역변수, 전역변수

a<-3;b<-7;c<-11 #전역변수     

#a<-3, b<--7 ,c<-11 : 에러 ~unexpected ',' in "a<-3,"

ft <- function(a) {
        b<- a+10          # 238행 b  (새로운 지역변수)  !=  233행 b  (전역변수)  
        c<<- a+10         # <<- : 전역대입연산!!!
        d<- a
        print(a);print(b);print(c);print(d)
        return()          # NULL
}

ft(100)
print(ft(100))
print(a);print(b);print(c)     
print(d) #에러 






#자료구조 ( 어떤 데이타셋에 따라 다른 액션을 해야할 때를 위해 )
testParamType <- function(x){
        if(is.vector(x)) print('벡터를 전달했군요!')
        if(is.data.frame(x)) print('데이터프레임을 키인했군요')
        if(is.list(x)) print('리스트를 전달했군요!')
        if(is.matrix(x)) print('매트릭스를 키인했군요')
        if(is.array(x)) print('배열을 전달했군요')
        if(is.function(x)) print('함수를 키인했군요')
}


testParamType(100)
testParamType(LETTERS)

testParamType(data.frame())       #data.frame() : 비어있는 데이터프레임
'[1] "데이터프레임을 키인했군요'
'[1] "리스트를 전달했군요!"'    # 벡터로 구성된 리스트 > 그렇게 생각하니까 그런가보다...

testParamType(matrix())
'[1] "매트릭스를 키인했군요"'
'[1] "배열을 전달했군요"'

testParamType(list())
'[1] "벡터를 전달했군요!"'
'[1] "리스트를 전달했군요!"'     #list를 1차원 여러가지 데이터 타입이 들어가는 1차원 벡터로 설명하는 책도 있음 
testParamType(array())

testParamType(factor)



#활용
f7 <- function(...){
        data<- c(...)
        sum <-0;
        for(item in data) {
                if(is.numeric(item))
                        sum<- sum+item
                else
                        print(item)
        
        }
        return(sum)
}

f7(10,20,30)
f7(10,20,'test',30,40)   #문자형 벡터로 자동형변환
   


#8 list로 받으면           
f8<- function(...) { 
        data<- list(...) 
        sum<- 0; 
        for(item in data) { 
                if(is.numeric(item)) 
                        sum<- sum + item 
                else 
                        print(item) 
        } 
        return(sum) 
}



f8(10,20,30)
f8(10,20,'test',30,40)      #'test' , '100'으로 출력
