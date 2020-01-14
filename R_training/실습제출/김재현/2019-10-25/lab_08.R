#문제1
mySum <- function(...){
  vec <- c(...)
  if(is.null(vec)){
    return()
  }else if(!is.vector(vec)|is.list(vec)){
    stop("벡터만 처리가능")
  }else if(any(is.na(vec))){
    warning("NA를 최저값으로 변경하여 처리함!!")
    t1 <- NULL
    for(t in vec){
      if(is.na(t)){
        t <- vec[which.min(vec)]
      }
      t1 <- c(t1,t)
    }
    return(SumOddEven(t1))
  }else{
    return(SumOddEven(vec))
  }
}

SumOddEven <- function(vec){
  oddSum <- sum(vec[1:length(vec)%%2==1])
  evenSum <- sum(vec[1:length(vec)%%2==0])
  result <- list(oddSum,evenSum)
  return(result)
}

A <- c(10,8,NA,9,1,11,23)
mySum(A)
B <- c(10,8,3,9,1,11,23)
mySum(B)
C <- list(2,3,4)
mySum(C)
D <- NULL
mySum(D)


#문제2
myExpr <- function(func){
  if(!is.function(func)){
    stop("수행 안할꺼임!!")
  }else{
    a <- sample(1:45,6)
    result <- func(a)
    return(result)
  }
}

myExpr(1)
myExpr(sum)
myExpr(mean)


#문제3
createVector <- function(...){
  vec_ele <- c(...)
  if(is.null(vec_ele)){
    return()
  }else if(any(is.na(vec_ele))){
    return(NA)
  }else{
    return(vec_ele)
  }
}

createVector(10,"123","a",1233)
createVector()
createVector(10,NA,"123",1010)
createVector(10,123,445,1010)

#문제4
data <- scan("data/iotest1.txt",what="")
data <- as.numeric(data)
inc.data <- sort(data)
dec.data <- sort(data,decreasing = T)
sum.data <- sum(data)
avg.data <- mean(data)

#문제5
data2 <- scan("data/iotest2.txt",what="")
fdata <- factor(data2)
countdata <- summary(fdata)
sortdata <- sort(countdata, decreasing = T)
word <- names(sortdata[1])
cat("가장 많이 등장한 단어는", word, "입니다")
