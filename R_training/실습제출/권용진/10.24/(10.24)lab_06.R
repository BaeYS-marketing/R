#q1
exam1 = function() {
  a=LETTERS[1:26]
  b=letters[1:26]
  return(paste(a,b,sep='')) 
}
exam1()
# x=paste0(LETTERS,letters) -> 중간에 블랭크 주지 않아도 됨 
# return(x)  

#q2
exam2 = function(i)
{
  sum=0 #초기화 과정 필요
  for (i in 1:i) { 
    sum = sum+i
}
    return(sum)
  }
exam2(7)

#q3
exam3 = function(a,b){
  if (a>b) {gap=a-b}
  else if (a<b) {gap=b-a}
  else {gap=0}
  return(gap)
}
exam3(75,85)

#q4
exam4 <- function(x,mark,z){
  if (mark == '+'){
    return(x+z)
  }
  if (mark == '-'){
    return(x-z)
  }
  if (mark == '*'){
    return(x*z)
  }
  if (mark == '%/%'){
    if(x==0){
      print('오류1')
    }
    else return(x%/%z)
  }
  if (mark == '%%'){
   if(z==0){
      print('오류2')
    }
    else return(x%%z)
  }
  else print('규격의 연산자만 전달하세요')
}
exam4(5,'%%',0)           


  
