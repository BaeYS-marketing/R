

#문제1
exam1 <- function(){
        return(paste(LETTERS[1:26],letters[1:26], sep=''))
}
# == paste0(LETTERS[1:26],letters[1:26])


#전체 인덱싱 = 전체  _ LETTERS[1:26] = LETTERS

exam1()



# return() <- paste(LETTERS[1:26],letters[1:26], sep='')  :  오류










#문제2
exam2 <- function(x){
        sum <- 0
        for(i in 1:x){                  # for i in x ?      : x원소 하나 
                sum <- sum+i             
        }                      #[1:x] 1부터 x까지 원소 하나당 반복문 실행 
        return(sum)
}

#참고_ [1:x] = seq(1,x)
exam2(10)


#여기서 for 안쓰고 / while을 쓰면 i도 증가시켜줘야된다*복잡.
#sum(1,10) ; sum(1:10)     `11`, '55'







#문제3
exam3 <- function(x,y){
        if(x==y){
                result <- 0             #result <- print(0) : ERROR
        }                               #                     출력 != 값
        else {
                result <- abs(x-y)
        }
        return(result)
        
}


exam3(10,5)

#ㅇ..ㅇ   :   if((x %in% y) ==F) 




#문제3-2

exam3 <- function(x,y){
        if(x==y){
                return(0)            #알아둘 것 return() 만나면 함수종료 
        }
        else {
                return(abs(x-y))     #abs() : 절대값
        }
        
}

exam3(10,5)











#문제4  - y연산자는 문자로 입력한다는 가정.
exam4 <- function(x,y,z){
        if (y == '+'){
                return(x+z)         #바로 리턴안하고 변수 받아서 마지막 리턴도 가능
        }
        else if (y == '-'){
                return(x-z)
        }
        else if (y == '*'){
                return(x*z)
        }
        
        else if (y == '%/%'){
                if(x==0){             #if(x=='0')도 문자로 자동형변환되서 실행되긴한다.
                        print('오류1')
                }
                else return(x%/%z)
        }
        
        else if (y == '%%'){
                if(y==0){
                        print('오류2')
                }
                else return(x%%z)
        }
        
        else return('규격의 연산자만 전달하세요')
        
        
}


exam4(10,'+',7)        

#연산자 우선순위 : 대부분 그럴일이 없지만
# &(and) > \(or)




###############  벡터 제대로 알기!!!! ##############

#about. 벡터의 정의(심화) / 논리연산


y == ['a','b','c','d']                         #오류 Error: object 'y' not found

['y','y','y','y','y'] == ['a','b','c','d']     #오류

c('y','y','y','y','y') == c('a','b','c','d')   #warning : longer object length is not a multiple of
#          shorter object length

y == c('a','b','c','d')                  #오류 Error: unexpected '[' in "y <- ["

'y' == c('a','b','c','d')                # FALSE FALSE FALSE FALSE

c(y) == c('a','b','c','d')               # object 'y' not found

c('y') == c('a','b','c','d')             # FALSE FALSE FALSE FALSE

y <- [1,2,3]                   #오류 Error: unexpected '[' in "y <- ["



if((num %% 2) == 0) 
if(FALSE  TRUE FALSE  TRUE FALSE) ==T ) ...

#논리든 수리든 백터 연산 결과는 원소마다 별로 여러개인데 
#하나로 값이 나오는 지 착각.



#+벡터복습
########## 벡터에 대해 내가 헷갈리는 지식 ##############

#백터의 정의, 연산 <-> 인덱싱


a<-c(1,2)             #성공
a*2                   #벡터 수리연산 가능    // 논리연산은 가능

a<-[1,2,3,4]          ###오류   백터정의 명령 : c(  )   // not : [  ]


c<-c('*')             ###오류   문자는 수리연산 못한다.
c*4



##########################################################




#문제4-2 (이용주씨)
exam4 <- function(x, y, z){
        
        if((y == "%/%") |( y == "%%")){
                if(x==0) return("오류1")
                if(z==0) return("오류2")
        }
        
        switch(y,
               "+"=return(x+z),
               "-"=return(x-z),
               "*"=return(x*z),
               "%/%"=return(x %/% z),
               "%%"=return(x %% z),
               "규격의 연산자만 전달하세요"
        )
}
print(exam4(1,"%%",0))







#문제5
f<- c(...)




