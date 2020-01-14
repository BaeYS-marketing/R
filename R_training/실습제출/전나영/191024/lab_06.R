# 문제1
exam1 <- function(){
  alpha <- paste(LETTERS[1:26], letters[1:26], sep = "")
  return(alpha)
}

exam1()

# 문제2
exam2 <- function(n){
  return(sum(1:n))
}

exam2(3)

# 문제3
exam3 <- function(x, y){
  if(x > y){
    return(x - y)
  } else if(x < y){
    return(y - x)
  } else{
    return(0)
  }
}

exam3(6, 3)

# 문제4
oper <- c("+", "-", "*", "%/%", "%%")
exam4 <- function(x, oper, y){
  if(oper == "+"){
    return(x+y)
  } else if(oper == "-"){
    return(x-y)
  } else if(oper == "*"){
    return(x*y)
  } else if(oper == "%/%"){
    if(x==0){
      return("오류1")
    } else if(y==0){
      return("오류2")
    } else return(x%/%y)
  } else if(oper == "%%"){
    if(x==0){
      return("오류1")
    } else if(y==0){
      return("오류2")
    } else return(x%%y)
  } else if(oper != "+" | oper != "-" | oper != "*" | oper != "%/%" | oper != "%%"){
    return("규격의 연산자만 전달하세요")
  }
}

exam4(5, "%%", 0)