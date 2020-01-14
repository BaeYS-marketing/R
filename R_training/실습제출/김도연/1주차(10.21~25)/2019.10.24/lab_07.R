#Q1
exam5 = function(v1,v2="#"){
  if(v1>0){
    for(i in 1:v1)
      cat(v2)
  }
  return(NULL)
}

exam5(5, "^")
exam5(10)

#Q2

exam6 = function(x){
  {
  if(x>=85)
    y="상"
  else if(x>=70)
    y="중"
  else if(x<70)
    y="하"
  else(x=="NA")
    y="NA"
    print(paste(y,"는 처리불가"))

  z=paste(x,"점은 ",y,"등급입니다.",sep="")
  print(z)
}
  return()
}

a=c(50,75,90)
exam6(a)

#Q2

exam6 = function(x){
  for(i in 1:length(x)){
    if(is.na(x[i]))
      print(paste(x[i],"는 처리불가"))
    else if(x[i]>=85)
      print(paste(x[i],"점은 상등급입니다."))
    else if(x[i]>=70)
      print(paste(x[i],"점은 중등급입니다."))
    else
      print(paste(x[i],"점은 하등급입니다."))
  }
  return()
}

exam6(c(50,75,90,NA))

#Q3
countEvenOdd = function(x){
  if(is.numeric(x) != T){
    return()
  }
  even = 0
  odd = 0
  for(i in x){
    if(i%%2==0)
      even = even + 1
    else
      odd = odd + 1
  }
  list = list(even=even, odd=odd) 
  #names(list)[1] = "even"
  #names(list)[2] = "odd"
  return(list)
}
countEvenOdd(c(2,3,4,5,6,7,8))

#Q5
vmSum = function(x){
  if((is.vector(x) != T) | (is.list(x) == T)){
    cat("벡터만 전달하숑!")
    return()
  }
  else {
    if(is.numeric(x) !=T){
      cat("숫자 벡터를 전달하숑!")
      return(0)
    }
    else{
      return(sum(x))
    }
  }
}

vmSum(c(1,2,3,4))


#Q5
vmSum2 = function(x){
  if((is.vector(x) != T) | (is.list(x) == T)){
    stop("벡터만 전달하숑!")
  }
  else {
    if(is.numeric(x) !=T){
      warning("숫자 벡터를 전달하숑!")
      return(0)
    }
    else{
      return(sum(x))
    }
  }
}

vmSum2(c(1,2,3,4))
