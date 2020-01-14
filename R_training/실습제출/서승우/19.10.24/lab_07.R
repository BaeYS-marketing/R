#문제1
exam5<- function(p1, p2="#"){
  if(p1>=0){
    for(i in 1:p1){
    cat(p2)
    }
  }
}

#문제2
exam6<- function(p1){
  for(i in p1){
    if(i>=85){
      grade="상"
      print(paste0(i, "점은 ", grade, "등급입니다." ))
    }else if(i>=70 && i<=84){
      grade="중"
      print(paste0(i, "점은 ", grade, "등급입니다." ))
    }else if(i<70){
      grade="하"
      print(paste0(i, "점은 ", grade, "등급입니다." ))
    }else{
      print("NA는 처리불가")
    }
  }
}




#문제3
countEvenOdd<-function(x){
  y<-0
  z<-0
  for(i in x){
    if(!is.numeric(i) | !is.vector(i)){
      return(NULL)
    }
    else if(i%%2==1){
      z=z+1
    }else if(i%%2==0){
      y=y+1
    } 
  }
  return(list(even=y, odd=z))
}

#문제4
vmSum<- function(x){
  if(!is.vector(x)){
    print("벡터를 전달하숑!")
    return(NULL)
    }
  else{
      if(!is.numeric(x)){
        print("숫자 벡터를 전달하숑!")
        return(0)
      }else{
        return(sum(x))
    }
  }
}

#문제5


vmSum2<-function(x){
  if(is.vector(x) & !is.list(x)){
    if(is.numeric(x)){
      return(sum(x))
    }else{
      warning("숫자 벡터를 전달하숑!")
      return(0)
    }
  }else{
    stop("벡터만 전달하숑!")
  }
}