# Q.1
exam1 = function(){
  x = paste0(LETTERS,letters,sep = '')
  return(x)
}
exam1()

# Q.2
exam2 = function(p1){
  for(i in 1:p1){
    sum = sum + i
  }
  return(sum)
}
exam2(3)

# Q.3
exam3 = function(p1,p2){
  if(p1>=p2){
    x = p1-p2
  }else{
    x = p2-p1}
return(x)}
exam3(10, 20)
exam3(20, 5)
exam3(5, 30)
exam3(6, 3)

# Q.4
exam4 = function(n1,a1,n2){
  if(a1 == '+'){
    x = n1+n2
  }else if(a1 == '-'){
    x = n1-n2 
  }else if(a1 == '*'){
    x = n1*n2
  }else if(a1 == '%/%' & n1 != 0 & n2 !=0){
    x = n1%/%n2
  }else if(a1 == '%%' & n1 != 0 & n2 !=0){
    x = n1%%n2
  }else if((a1 == '%/%' | a1 == '%%' )& n1 == 0 & n2 !=0){
    x = "오류1"
  }else if((a1 == '%/%' | a1 == '%%' )& n1 != 0 & n2 == 0){
    x = '오류2'
  }else{
    x = '규격의 연산자만 전달하세요'
  }
  return(cat(n1,a1,n2,'=',x))}

exam4(10,'+',5)
exam4(10,'-',5)
exam4(10,'*',5)
exam4(10,'%/%',5)
exam4(10,'%%',5)
exam4(0,'%/%',5)
exam4(10,'%%',0)
exam4(10,'힣',5)














