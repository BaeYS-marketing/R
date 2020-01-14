#문제1
exam1<-function(){
  return(paste0(LETTERS[],letters[]))
}
exam1()

#문제2
exam2 <- function(x){
  sum=0
  for (i in 1:x)
  sum=sum+i
  return(sum)
  }
exam2(10)

#문제3
exam3<-function(x,y){
  if (x>y) {result=x-y}
  else if (x<y){result=y-x}
  else {result=0}
  return(result)
}
exam3(3,3)

#문제4
exam4<-function(x,y,z){
  if (y=="+") {result=x+z}
  else if(y=="-"){result=x-z}
  else if(y=="*"){result=x*z}
  else if(y=="%/%"){
    if(x==0){result="오류1"
    }else if(z==0){result="오류2"
    }else {result=x%/%z}}
  else if(y=="%%"){
    if(x==0){result="오류1"
    }else if(z==0){result="오류2"
    }else {result=x%%z}}
  else {result="규격의 연산자만 전달하세요"}
  return(result)
}
