# 문제1
exam5 <- function(num,char="#"){
  for(i in num){
    if(is.character(char)=="TRUE"){
      print(rep(char,i))
    }else {
      char = "#"
    }
  if(num < 0){
    print("")
  }
  return()
}
}

exam5(5,)

# 문제2
exam6 <- function(x = c(0:100))
  if(x<=100){
    print(paste("x","점은"," ","상등급입니다."))
  }else if(x<85){
    print(paste("x","점은"," ","중등급입니다."))
  }else if(x<70){
    print(paste("x","점은"," ","하등급입니다."))
  }else if(x==""){
    print(paste("NA는 처리불가")
  }


# 문제3
countEvenodd() <- function


# 문제5

testError <- function(p){
  if(is.vector(p) == FALSE)
    stop("벡터만 전달하숑!")
}
testError(matrix())

testWarn <- function(p){
  if(is.vector(p) == FALSE)
    stop("벡터만 전달하숑!")
  if(is.numeric(p) == FALSE)
    warning("숫자 벡터만 전달하숑!")
  return("0")
}

testWarn("A")

vmSum2 <- function(p){
  if(is.vector(p)==FALSE | is.list(p)==TRUE){
   stop("벡터만 전달하숑!") 
  }else if(is.numeric(p)==FALSE){
    warning("숫자 벡터만 전달하숑!")
    return(0)
  }else
    return(sum(p))
}
vmSum2(c(5,7,8))