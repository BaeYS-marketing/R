#문제1
exam1 <- function(){
  com_alpha <- paste0(LETTERS,letters)
  return(com_alpha)
}

exam1()

#문제2
exam2 <- function(n){
  sum_n <- sum(1:n)
  return(sum_n)
}

exam2(10)

#문제3
exam3 <- function(num1,num2){
if(num1 > num2){
    print(num1 - num2)
  }else{
    print(num2 - num1)
  }
}

exam3(99,50)

#문제4
exam4 <- function(num1, oper_sym, num2){
  bridge <- if(oper_sym == "+"){
    1
  }else if(oper_sym == "-"){
    2
  }else if(oper_sym == "*"){
    3
  }else if(oper_sym == "%/%"){
    4
  }else if(oper_sym == "%%"){
    5
  }else{
    "A"
  }
  if(typeof(bridge) == "character"){
    cat("규격의 연산자만 전달하세요")
  }else{
    switch(bridge,
           print(num1+num2),
           print(num1-num2),
           print(num1*num2),
           if(num1 == 0){
               cat("오류1")
             }else if(num2 == 0){
               cat("오류2")
             }else{
               print(num1%/%num2)
             },
           if(num1 == 0){
               cat("오류1")
             }else if(num2 == 0){
               cat("오류2")
             }else{
               print(num1%%num2)
             }
          )
  }
}

exam4(80,"+-",23)
exam4(56,"*",10)
exam4(0,"%%",5)
exam4(14,"%/%",0)
