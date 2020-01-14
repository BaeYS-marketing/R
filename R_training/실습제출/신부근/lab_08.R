#문제1
mySum <- function(x) {   
  if(is.null(x)){
    result <- NULL
  } else {
    if (is.vector(x) && !is.list(x)) {
      if(any(is.na(x))){
        warning("NA를 최저값으로 변경하여 처리함!!")
        x[is.na(x)] <- min(x, na.rm = T)
        print(x)
      }
      oddIndex <- seq(1, length(x), 2)
      evenIndex <- seq(2, length(x), 2)
      oddSum <- sum(x[oddIndex])
      evenSum <- sum(x[evenIndex])
      result <- list(oddSum=oddSum, evenSum=evenSum)
    } else {
      stop("벡터만 처리 가능!!")
    }
  }
  return(result)
}

mySum(1:10)
mySum(c(10,20,NA))
mySum(NULL)




mySum(c(1,2,3))
mySum(NULL)

#문제2
myExpr<-function(x){
  if(!is.function(x))
    stop("수행안할꺼임")
  else z=sample(1:45,6)
  print(z)
  return(x(z))
}
myExpr(sum)
myExpr(mean)
myExpr(3)

#문제3
createVector<-function(...){
  x<-c(...)
  if (is.null(x))
    return()
  if(any(is.na(x)))
    return(NA)
  else return(x)
}
createVector()

#문제4
iostest1<-scan("C:/Rstudy/data/iotest1.txt")
cat("오름차순:",sort(iostest1),"\n")
cat("내림차순:",sort(iostest1,decreasing = T),"\n")
sum(iostest1)
mean(iostest1)

#문제5
iotest2<-scan("C:/Rstudy/data/iotest2.txt",what="")
fdata<-factor(iotest2)
countdata<-summary(fdata)
sortdata<-sort(countdata,decreasing=T)
word<-names(sortdata[1])
paste("가장 많이 등장한 단어는",word,"입니다.")


