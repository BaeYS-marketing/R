#문제 1
exam1 <- function(){
  x <- paste(LETTERS,letters,sep="")
  return(x)
}

exam1()

#문제 2
exam1 <- function(p1){
  x <- sum(1:p1)
  return(x)
}

exam1(p1=10)

#문제 3
exam3 <- function(x,y){
 if(x>y){
   z <- x-y
 }else if(x<y){
   z <- y-x
 }else{z <- 0}
   return(z)
}

#문제 4
exam4 <- function(p1,p2,p3){
  if(p2=="+"){
    z = p1+p3
  }else if(p2=="-"){
    z = p1-p3
  }else if(p2=="*"){
    z = p1*p3
  }else if(p2=="%/%"){
    if(p1==0){
      z="오류1"
    }else if(p3==0){
      z="오류2"
    }else{
      z=p1%/%P3}
  }else if(p2=="%%"){
    if(p1==0){
      z="오류1"
    }else if(p3==0){
      z="오류2"
    }else{
      z=p1%%p3
    }
  }
  else{
    z = "규격의 연산자만 전달하세요"
  }
  return(z)
}