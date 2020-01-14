#문제1

exam5 <- function(x,y='#'){             #exam5()로 정의X
        if(x>=0){
                print(rep(y,x))
        }
        return()
}


exam5(2,'!')







#문제2
exam6 <- function(score){
        for( x in score){              #not : length(score)
                if(x>=85 & x<=100){
                        result <- '상'
                        print(paste0(x,'점은 ',result,'등급 입니다.',sep=''))
                }else if(x>=75 & x<=84){
                        result <- '중'
                        print(paste0(x,'점은 ',result,'등급 입니다.',sep=''))
                }else if(x<=69) {
                        result <- '하'
                        print(paste0(x,'점은 ',result,'등급 입니다.',sep=''))
                }else if(is.na(x)){
                        print('NA는 처리불가')
                }
        }
}
#print(cat()) ..NULL
a<-c(90,60,50)
exam6(a)






#3 문제

countEvenOdd <- function(num){
        if(!is.vector(num) | !is.numeric(num)){    ## !F | !F  == F/T연산 
                return()
                # }else if(is.numeric(num)==F){
                #   return()
        }else{  
                odd <- 0;even <-0          
                for( i in num){
                        # odd <- 0;even <-0    ~ for문 밖에서!!
                        if(i %% 2 == 1){
                                odd <- odd + 1
                        }else{
                                even <- even + 1
                        }
                }
                result <- list(even = even , odd = odd)
                return(result)
        }
}

a<-c(20,65,11,53)
countEvenOdd(a)






#문제4

VmSum <-function(x){
        sum<-0
        if(is.vector(x)==F){
                print('벡터만 출력하숑')
        }else if(is.numeric(x)==F){
                print('숫자벡터를 전달하숑')
                return(0)
        }else {for(i in x){
                sum<-sum+i
        }
                
        } 
        return(sum)
} 


a<-c(120,30,66)
VmSum(a)        







#문제5

VmSum2 <- function(x){
        sum <-0
        if(is.vector(x)==F){
                stop('벡터만 출력하숑')
        }else if(is.numeric(x)==F){
                warning('숫자 벡터를 전달하숑')
                return(0)
                #warning('숫자 벡터를 전달하숑') return 만나서 warning 출력X
        }else {
                for(i in x){
                        sum <- sum+i
                }
        }
        return(sum)
}


VmSum2(a)

a<-list(1,1,1,1)
a<-matrix(1:9, ncol = 3)
a

a<-c('하하')

is.vector(a)