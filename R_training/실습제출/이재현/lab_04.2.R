#문제 1
exam5 <- function(a,b="#"){
  if(a>=0){
    for(i in 1:a){
      cat(b)
    }
    
  }
}


#문제2
exam6 <- function(a){
  for(a in a){
  if(a>=85){
    grade="상"
    print(paste0(a,"점은",grade,"등급입니다"))}
  else if(a>=70){
    grade="중"
    print(paste0(a,"점은",grade,"등급입니다"))}
  else if(a<70){
    grade="하"
    print(paste0(a,"점은",grade, "등급입니다"))}
  else{
    print("NA는 처리불가")
  }
}
}

#문제3
countEvenOdd<-function(x){
  y<-0
  z<-0
  for(x in x){
    if(!is.numeric(x)|!is.vector(x)){
      return(NULL)
    }else if(x%%2==1){
      z=z+1
    }else if(x%%2==0){
      y=y+1
    }
  }
  return(list(even=y, odd=z))
}





#문제4
vmSum<- function(a){
  if(!is.vector(a)){
    print("백터를전달하숑")
    return(NULL)
  }
  else{
    if(!is.numeric(a)){
      print("숫자벡터를전다라숑")
      return(0)
    }else{
      return(sum(a))
    }
  }
 }
  
 
#문제5
vmSum2<- function(a){
  if(!is.vector(a)){
    stop("백터를전달하숑")
    return(NULL)
  }
  else{
    if(!is.numeric(a)){
      warning("숫자벡터를전달하숑")
      return(0)
    }else{
      return(sum(a))
    }
  }
}
  

