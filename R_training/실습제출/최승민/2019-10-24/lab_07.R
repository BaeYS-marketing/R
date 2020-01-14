#문제1
exam5 <- function(num , cha = "#"){
    if(num >=0) {
      for(num in 1:num) 
        print(cha)
    } else return(NULL)
}

exam5(-3, "jdd")
exam5(3, "jdd")
exam5(3)

#문제2

exam6 <- function(scr){
  if(is.na(scr)) print("NA는 처리불가")
  
  if(85 <= scr & scr <= 100) {
    print(paste("",scr,"점은 상등급입니다."))
  } else if(70 <= scr) {
    print(paste("",scr,"점은 중등급입니다."))
  } else {
    print(paste("",scr,"점은 중등급입니다."))
  }
}

exam6(70)
exam6(NA)

#문제3

countEvenOdd <- function(n) {
  if(!is.numeric(n)) 
    return(NULL)
  even= 0
  odd = 0 
  for(n in n){
  if(n %% 2 ==0)
    even = even + 1
    else 
      odd = odd + 1
  } 
  return(list(odd = odd, even= even))
}

rst_list <- countEvenOdd(1:21)
countEvenOdd(letters)
rst_list

#문제4

vmSum <- function(...){
  data <- c(...)
  if(!is.vector(data)) {
    print("벡터만 전달하숑")
    return(NULL)
  }
  if(is.vector(data)== T & !is.numeric(data)) {
    print("숫자 벡터만 전달하숑")
    return(0)
  }
  sum = 0 
  for(i in data){
    sum = sum + i
  }
  return(sum)
}

mtx <- matrix(2,2)

vmSum(mtx)
vmSum(letters)
vmSum(c(1:5), c(31:39))
