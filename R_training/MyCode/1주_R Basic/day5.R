
#복습
#1
print(1)

myFunction()


myFunction <- function(){
        print(LETTERS[1])
        print(LETTERS[2])
        print(LETTERS[3])
        print(LETTERS[4])
        return("end")       #return(end)   : Error
}

print(20)







#2
myFunction<- function() {
        print(LETTERS[1])
        print(LETTERS[2])
        today <- weekdays(Sys.Date())
        if(today == '금요일'){
                return() }
        print(LETTERS[3])
        print(LETTERS[4])
        return("end")  

} 

watch<-myFunction()

watch

#Sys.Date()  :  "2019-10-25"
#weekdays(Sys.Date())  :  "금요일"

noPossible<-print('a')
nopossible  # Error 







#3
function(p) {}       #반드시 받아서 해야한다.

        
function(p='ㅋ')  {}
#전달하지 않으면 'ㅋ' 받아서 실행 , P 값 할당하면 'ㅋ'는 사용X

#(심화) p를 꼭 벡터로 받고싶다.
'function의 바디를 보지 않으면 ~ is.vetor() == T 부분의 내용
헤더만으로는 알 수 없다. 
따라서 document화 시켜서 알려줘야 한다. '


#4
sum(LETTERS)
"Error in sum(LETTERS) : invalid 'type' (character) of argument"        
        


#5
matrix(1:7, nrow=3)
'Warning message:
In matrix(1:7, nrow = 3) :
  data length [7] is not a sub-multiple or 
  multiple of the number of rows'




#6 에러 발생 함수 만들기 !! _ stop()함수 
#함수 수행 중단처리 + ERROR 처리

testError <- function(x){
        if(x<= 0)
                stop('양의 값만 전달하십시오')
        return(rep('테스트',x))
}

testError(-1)
testError(0)
testError(6)



#7 경고 발생 함수 
#warning()은 메세지는 주지만 수행은 된다.
##!!!! warning 과 stop은 function 안에 필수로 묶이지X , 단독 사용가능.

testWarn <- function(x){
        if(x<= 0)
                stop('양의 값만 전달하십시오')
        if(x>5){                     #if ? 연속할 필요가 없으니까.
                x<-5
                warning('입력 값이 5보다 커서 5로 처리')
        }
        return(rep('테스트',x))
}

test(-1)
testWarn(3)
testWarn(10)






# 두번 째 p=-1 -> cat함수는 수행이 안됌, testError(-1)의 stop수행문
test1 <- function(p){
        cat('수행\n')
        print(testError(p))
        #testError(p)     명령 수행만 하고 그 결과 출력하지 않음.
        #                return으로 값만 리턴 받고 출력까지 리턴에 하지 않았기 떄문.                  
        cat('수행해야 되나? \n')
}

test1(-1)   
test1(3)        



#try() 반복문 안에 있다는 가정하에, 에러가 나면 건너뛰고 계속 시행.
test2 <- function(p){
        cat('수행합니다. \n')
        try(testError(p))
        cat('수행을 계속합니다?')
}

test2(-2)



#########################  try - catch   ########################
#try()심화 - 그냥 묻어두고 가는 것이 아니라 구체적인 처리를 하고 싶다.


#{ }실수 : 코드 크게 보는 눈 부족.
testAll <- function(p){
        tryCatch({
                if(p == '오류테스트'){
                        testError(-1)
                }else if (p== '경고테스트'){
                        testWarn(6)
                }else{
                        cat('정상 수행...\n')
                        print(testError(2))
                        print(testWarn(3))
                }
        warning = function(w){
                print(w)
                cat('-.-;; \n')
        error = function(e){
                print(e)
                cat('ㅠㅠ \n')
        finally = {
                cat('오류 , 경고 발생 여부를 따라서 반드시 수행')
        }
        }
                
        }
        })
}

testAll('오류테스트')






#제대로 입력 
testAll <-function(p){
  tryCatch({
    if(p=="오류테스트"){
      testError(-1)
    }else if (p =="경고테스트"){
      testWarn(6)
    }else{
      cat("정상 수행..\n")
      print(testError(2))
      print(testWarn(3))
    }
  },warning = function(w){
    print(w)
    cat("-.-;;\n")
  }, error = function(e){
    print(e)
    cat("ㅠㅠ \n")
  },finally ={
    cat("오류, 경고 발생 여부를 따라서 반드시 수행되는 부분입니다요..\n")
  })
}

testAll("오류테스트")
testAll("경고테스트")
testAll("아무거나")



#해석 및 설명명
#tryCatch 구문 _ 만든사람 사고를 받아들이면 된다.
'tryCatch(코드블럭, warning =함수, error = 함수, finally = 코드블럭)'

testAll <-function(p){
  tryCatch({
    if(p=="오류테스트"){
      testError(-1)
    }else if (p =="경고테스트"){
      testWarn(6)
    }else{
      cat("정상 수행..\n")
      print(testError(2))
      print(testWarn(3))
    }
  }, error = function(e){
    print(e)
    cat("ㅠㅠ \n")
  },warning = function(w){    #waring 났을 때를 function(w)로 받는다.
                              #왜 function으로? 발생하는 아규먼트를 객체로 전달하기 위해 
                              #코드블럭은 이렇게 못하고 다시 일일히 입력해야 되니까
                              #-> w로 다시 받는다 _print(w)  : 에러 함수 메세지(w)출력 
    print(w)
    #print("warning")
    cat("-.-;;\n")
  },finally ={
    cat("오류, 경고 발생 여부를 따라서 반드시 수행되는 부분입니다요..\n")
  })
}

testAll("오류테스트")
testAll("경고테스트")
testAll("아무거나")








#any함수

#필요성
f.case1 <- function(x){
        if(is.na(x))
                return('NA가 있슈')
        else
                return('NA가 없슈')
}

f.case1(100)
f.case1(NA)
f.case1(1:6)
f.case1(c(10,20,30))
f.case1(c(NA,20))
f.case1(c(10,NA,20)) 

#is.na() : 첫번째 것만 해준다.





#any
f.case2 <- function(x){
        if(any(is.na(x)))
                return('NA가 있슈')
        else
                return('NA가 없슈')
}

f.case2(100)
f.case2(NA)
f.case2(1:6)
f.case2(c(10,20,30))
f.case2(c(NA,20))
f.case2(c(10,NA,20)) 


#any()  데이타 덩어리를 다 체크해서 하나라도 TRUE면 바로 리턴 / 전부 아니면 F
#                       <- 이렇게 안하면 is.na에서 for문 돌려야 된다.





#all                   any에 비해 사용도는 낮지만...
f.case3 <- function(x){
        if(all(is.na(x)))
                return('NA가 있슈')
        else
                return('NA가 없슈')
}

f.case3(100)
f.case3(NA)
f.case3(1:6)
f.case3(c(10,20,30))
f.case3(c(NA,20))
f.case3(c(10,NA,20)) 


#all()  :  데이타 덩어리를 다 체크해서 모두가 TRUE면 








#Sys.sleep(초시간) 함수 _  데이터 입출력 지연처리 
#크롤링에서 자료 읽어올때 네트워크 상황에 따라 지연 필요.

testSleep <- function(x) {
        for(data in 6 :10) {
                cat(data,'\n')
                if(x)
                        Sys.sleep(1)
        }
        return()
}
testSleep(FALSE)
testSleep(TRUE)



testSleep <- function(x) {
        for(data in 6 :10) {
                cat(data,'\n')
                        Sys.sleep(1)
        }
        return()
}
testSleep(FALSE)
testSleep(TRUE)
