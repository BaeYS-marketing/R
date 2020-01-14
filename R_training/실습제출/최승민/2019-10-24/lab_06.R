#문제1
exam1 <- function() return(paste("",LETTERS,letters,"",sep=""))
exam1()

#문제2  
exam2 <- function(a){
  sum <- 0
  for(i in 1:a) {
    sum <- sum +a
  }
return(sum)
}
exam2(5)
  
#문제3

exam3 <- function(Lr, Sm){
  if(Lr > Sm) return(Lr-Sm)
  else if(Lr == Sm) return(0)
  else return(Sm-Lr)
}
exam3(3,5)

#문제4

exam4 <- function(num1, cal, num2){
  if(cal == "+"){ return(num1+num2)
  } else if(cal == "-") { return(num1-num2)
  } else if(cal == "*") { return(num1*num2)
  } else if(cal == "%/%") {
    if(num1 ==0 ) return(cat("오류1"))
    if(num2 ==0 ) return(cat("오류2"))
    return(num1%/%num2)
  } else if(cal == "%%") {
    if(num1 ==0 ) return(cat("오류1"))
    if(num2 ==0 ) return(cat("오류2"))
    return(num1%%num2)
  } else return(cat("규격의 연산자만 전달하세요."))
  }

exam4 <- function(num1, cal, num2){
  if(cal == "+"){ rst <- num1+num2
  } else if(cal == "-") { rst <- num1-num2
  } else if(cal == "*") { rst <- num1*num2
  } else if(cal == "%/%") {
    if(num1 ==0 ) return(cat("오류1"))
    if(num2 ==0 ) return(cat("오류2"))
    rst <- num1%/%num2
  } else if(cal == "%%") {
    if(num1 ==0 ) return(cat("오류1"))
    if(num2 ==0 ) return(cat("오류2"))
    rst <- num1%%num2
  } else return(cat("규격의 연산자만 전달하세요."))
  return(rst)
  }

exam4(3,"+",5)
exam4(6,"-", 2)
exam4(4,"*", 5)
exam4(20, "%/%", 4)
exam4(20, "%/%", 0)
exam4(0, "%/%", 4)
exam4(22, "%%", 4)
exam4(22, "%%", 0)
exam4(0, "%%", 4)
