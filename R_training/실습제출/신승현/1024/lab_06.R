#문제1
exam1 <- function(){
  xx <- LETTERS
  yy <- letters
  return(paste(xx, yy, sep=""))
}

exam1()


#문제2
exam2 <- function(num){
  for(i in 1:num)
    sum=sum+i
  return(sum)
}
exam2(3)


#문제3

exam3() <- function(num1, num2){
  xx <- num1-num2>=0
  result(xx==10|20)
  return(xx=10)
  result(xx==20|5)
  result(xx==5|30)
  return(xx==25)
  result(xx==6:3)
  return(xx==3)
  return(xx==0)
}
exam3(xx)


exam3() <- function(p1, p2){
}if(p1>p2){
 x=p1-p2
}else{
 x=p2-p1
}
return(x)

exam3(10,20)
exam3(20,5)
exam3(5,30)
exam3(6,3)




#문제4

exam4()<-function(n3, d, n4){
  x=0
  if(d=="+"){
    x=n3+n4
  }else if(d=="-"){
    x=n3-n4
  }else if(d=="*"){
    x=n3*n4
  }else if(d=="%/%"&n3!=0&n4!=0){
    x=n3%/%n4
  }else if(d=="%%"&n3!=0 & n4!=0){
    x=n3%%n4
  }else if(d=="%/%" & n3!=0 & n4!=0){
    x="오류1"
  }else if(d=="%%" & n3!=0 & n4!=0){
    x="오류2"
  }
return(x)
}
exam4()