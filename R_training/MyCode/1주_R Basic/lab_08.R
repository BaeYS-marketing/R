#문제1

mySum <- function(vec){
        if(!is.vector(vec)) {
                stop('백터만 처리가능!')
        }
        if(is.null(vec)) {
                return()
        }
        if(any(is.na(vec))) {
                warning('NA를 최저값으로 변경하여 처리함')
                vec[is.na(vec)] <- min(vec,na.rm =T)  #na.rm 안하면 다 NA로 출력된다.
        }
        evenSum <- 0; oddSum<-0
        for(i in vec){
                if(i%%2 == 0){
                        evenSum <- evenSum + i
                }else {
                        oddSum <- oddSum +i 
                }
        }
        final <- list(oddSum = oddSum , evenSum = evenSum)
        return(final)
}


################################################################
# [ 하나 ]
#벡터 안 원소를 하나하나 뽑아서 분류한 후 연산
#벡터 안 홀수번 째 원소를 뽑고, 짝수 번째 원소를 뽑은 후 연산.

# [ 둘 ]
# 벡터[ 인덱싱 조건 ] : 조건 만족 원소만 추출 
# 벡터 == 값   :   값과 같은지 TRUE , FLASE지 원소별로 출력 


#  [ 셋 ]
# if 는 명사,   else if 종속절


#   [ 넷  ]
# stop(), warning()은 독립적인 함수
#################################################################


c(T,F,F,T,T,F,T,T) == F
'[1] FALSE  TRUE  TRUE FALSE FALSE
 [6]  TRUE FALSE FALSE'

A<-c(T,F,F,T,T,NA,F,T,T)


A[T,F,F,T,T,F,T,T]
'Error'


A == T
'[1]  TRUE FALSE FALSE  TRUE  TRUE
 [6]    NA FALSE  TRUE  TRUE'


A[T]
'[1]  TRUE FALSE FALSE  TRUE  TRUE
 [6]    NA FALSE  TRUE  TRUE'


A[is.na(A)]
'[1] NA'


A[A==T]
'[1] TRUE TRUE TRUE   NA TRUE TRUE'

A[A==30]
'[1] NA'


B<-c(123,60,12,78,31)

B[B>50]
'[1] 123  60  78'

B>50
'[1]  TRUE  TRUE FALSE  TRUE FALSE'

B==T
'[1] FALSE FALSE FALSE FALSE FALSE'



###############################################################


is.null(vec)

#벡터 인덱싱..
vec <- c(1,2,NA,4,6,NA)
is.na(vec)
vec[is.na(vec)]
vec[is.na(vec)] <- 99
vec
min(vec)


#1
if(!is.vector(vec)) {
        stop('백터만 처리가능!')
}
        
if(any(is.na(vec))) {
        warning('NA를 최저값으로 변경하여 처리함')
        vec[is.na(vec)] <- min(vec)
        
}


for(i in vec){
        evenSum <- 0; oddSum<-0
        if(i%%2 == 0){
                evenSum <- evenSum + i
        }else {
                oddSum <- oddSum +i 
        }
}






for( i in vec) {
        even<-0; odd<-0; result<-0
        if(length(vec)%%2 ==0) {
                for(i in seq(1:length(vec)-1,by=2)){
                        odd <- result + vec[i]
                }
                for(i in seq(2:length(vec),by=2)){
                        even <- result + vec[i]
                }
                        
        }else { 
                for(i in seq(1:length(vec),by=2)){
                        odd <- result + vec[i]
                }
                for(i in seq(2:length(vec)-1,by=2)){
                        even <- result + vec[i]
                }
                
              
        }
        final <- list(oddSum = odd, evenSum = even)
}




#2
error <- function(vec){
        if(!is.vector(vec)) {
                stop('백터만 처리가능!')
        }if(any(is.na(vec))) {
                warning('NA를 최저값으로 변경하여 처리함')
                
        }
}





