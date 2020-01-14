#문제1

exam1 <- function() 
  return(paste(LETTERS[1:26], letters[1:26], sep=""))		
exam1()

#문제2

exam2<- function(num){
return(sum(1:num))
}
exam2(10)

#문제3
exam3 <- function(a,b){
  result=1
  if(a>=b){ 
    result=a-b
  }else{
    result=b-a
  }
  return(result)
}
exam3(10,30)

#문제4
exam3 <- function(num1,d,num2){
  result=0
  if (d == "+"){
    result = num1 + num2
  }else if(d == "-"){
    result = num1 - num2
  }else if(d == "*"){
    result = num1 * num2
  }else if(d == "%/%"){
    if (num1 == 0) {
      result = "오류1"
    }else if(num2==0){
     result="오류2"
    }else{
     result = num1%/%num2
    }
  }else if(d == "%%"){
     if(num2==0){
       result="오류2"
    }else if (num1 == 0) {
       result = "오류1"
    }else {
       result=num1%%num2
    }
  }else{
    result=print('규격의 연산자만 전달하세요')
  }
  return(result)
}

exam3(e,"e",d)


#연산자간의 우선순위
#&>|
  

