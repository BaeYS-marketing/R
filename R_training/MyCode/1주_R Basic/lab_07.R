#문제1

exam5 <- function(x,y='#'){             #exam5()로 정의X
        if(x>=0){
                print(rep(y,x))
        }
        return()
}


exam5(2,'!')




#문제2 wrong
exam6 <- function(x){
        if(x>=85 & x<=100){
                result <- '상'
                print(cat(x,'점은 ',result,'등급 입니다.',sep=''))
        }else if(x>=75 & x<=84){
                result <- '중'
                print(cat(x,'점은 ',result,'등급 입니다.',sep=''))
        }else if(x<=69) {
                result <- '하'
                print(cat(x,'점은 ',result,'등급 입니다.',sep=''))
        }else if(is.na(x)){
                print('NA는 처리불가')
        }else return()
}

exam6(78)
#첫번 째 오답 : 매개변수에 백터를 넣는다.
#1.전) 1.스칼라 값이 대입된다 / 2.백터 길이만 매개변수에 대입된다.
#2.후) 백터 전체가 매개변수에 대입된다.

#두번 째 오답 : for (i in x)에서
#1. 전) x의 원소 수 만큼 i에 해당 : 1,2,3...
#2. 후) x의 원소가 i에 해당되고, 결국 그 원소 수 만큼 for문 반복
#       즉. i = x[1] - x[2] =x[3] ...


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



'[ 문제3 ]
다음 사양의 함수 countEvenOdd() 을 생성한다.
매개변수 : 1 개
리턴값 : 리스트
기능 : 숫자벡터를 아규먼트로 받아 짝수의 갯수와 홀수의 갯수를 카운팅하여 
리스트(각 변수명 : even, odd)로 리턴한다.
전달된 데이터가 숫자 백터가 아니면 NULL 을 리턴한다.'



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

a%%2
countEvenOdd(a)






#문제3  wrong

countEvenOdd <- function(num){
        if(is.numeric(num)) {
                if((num%%2)==0){
                        e <- num%%2
                        o <- num%%2
                        return(list(even = e,odd = o))
                }else if((num%%2)!=0){
                        e <- num%%2
                        o <- num%%2 +1
                        return(list(even = e,odd = o))
                }
        }else return()
        }

countEvenOdd(150)


#오답 
a<-c(3,4,5,6,7)

c(3,4,5,6,7)%%2
(c(3,4,5,6,7)%%2==0)

# [1] 1 0 1 0 1
#[1] FALSE  TRUE FALSE  TRUE FALSE

#if((num %% 2) == 0) 이거는  if(FALSE  TRUE FALSE  TRUE FALSE) ==T )z ...
#논리든 수리든 백터 연산 결과는 원소마다 별로 여러개인데 하나로 값이 나오는 지 착각.



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

