#문제1
exam5<-function(x,y="#"){
 if (x>0) {
   z=rep(y,x)
   print(z)
 }
}

exam5(3)
exam5(10,"@")
exam5(-3)

#문제2
exam6<-function(x){
  if (is.na(x)) {z="NA는처리불가"
  print(z)}
  else {
  if (x>=85 & x<=100){z="상"}
  else if (x>=70 & x<=84){z="중"}
  else {z="하"}
  print(paste(x,"점은",z,"등급이다."))
  }
}
exam6(NA)


#문제3
countEvenOdd<-function(x){
  as.list(x)
  odd=0
  even=0
  for(i in 1:length(x)) {
    if (x[i]%%2==1){
      odd=odd+1
      }
    else {
      even=even+1
      }
    }
  cat(even,odd)
  if (!is.numeric(x)){
    z=NULL
    return(z)
    }
  }
countEvenOdd(c(1,2,3))


#문제4
vmSum<-function(x){
  if(!is.vector(x)|is.list(x)){
    cat("백터만 전달하숑!")
    }
  else if(!is.numeric(x)){
    cat("숫자 백터를 전달하숑!!")
    return(0)
  }
 else return(sum(x))
}

vmSum(data.frame())
vmSum(c(1,"A",3))

#문제5
vmSum2<-function(x){
  if(!is.vector(x)|is.list(x))
    stop("백터만 전달하숑!")
  if(!is.numeric(x)){
    warning("숫자 백터를 전달하숑!!")
    return(0)
  }
  return(sum(x))
}

vmSum2(data.frame())
vmSum2(c("A",1))




