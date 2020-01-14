#문제1
exam5 <- function(times, sym = "#"){
  sym <- as.character(sym)
  if(times > 0){
    for(x in 1:times){
      cat(sym,sep = "")
       }
    }
  return()
}

exam5(7)
exam5(5,0)
exam5(0,10)


#문제2
exam6 <- function(score){
  if(is.na(score) == 1){
    return("NA는 처리불가")
  }else if(score >= 85){
    grade = "상"
  }else if(score >= 70){
    grade = "중"
  }else{
    grade = "하"
  }
  x <- paste(score,"점은",grade,"등급입니다.")
  print(x)
}

exam6(NA)
exam6(90)

#문제3
countEvenOdd <- function(...){
  num_set <- c(...)
  no_even <- 0
  no_odd <- 0
  if(is.numeric(num_set)==F|is.vector(num_set)==F){
    return()
  }else if(is.list(num_set) == F){
    for(x in num_set){
      if(x %% 2 == 0){
        no_even = no_even + 1
      }else{
        no_odd = no_odd + 1
      }
    }
  }
  list(
    odd = no_odd,
    even = no_even
  )
}

list_a <- list(2,3,4)
countEvenOdd(list_a)
countEvenOdd(10,20,31,42,42,41,11,"2")
countEvenOdd(10,20,31,42,42,41,11)

#문제4
vmSum <- function(...){
  test <- c(...)
  if(is.vector(test) == F | is.list(test) == T){
    print("백터만 전달하숑!");return()
  }else if(is.numeric(test) == F){
    print("숫자 백터를 전달하숑!");return(0)
  }else{
    result <- sum(test)
  }
  return(result)
}


a <- list(2,3,4)
vmSum(a)
b <- c(10,20,30,40,50)
vmSum(b)
c <- c(10,20,30,40,"30")
vmSum(c)


#문제5
vmSum2 <- function(...){
  test <- c(...)
  if(is.vector(test) == F | is.list(test) == T){
    stop("백터만 전달하숑!")
  }else if(is.numeric(test) == F){
    warning("숫자 백터를 전달하숑!");return(0)
  }else{
    result <- sum(test)
  }
  return(result)
}


a <- list(2,3,4)
vmSum2(a)
b <- c(10,20,30,40,50)
vmSum2(b)
c <- c(10,20,30,40,"30")
vmSum2(c)

