#1
mySum <- function(ex1) {
  if(is.vector(ex1) & !is.null(ex1)) {
    as.list(ex1)
    oddSum=0
    evenSum=0
    for (i in 1:length(ex1)) {
      if (i%%2==1)
        oddSum=oddSum + ex1[i]
      else
        evenSum=evenSum + ex1[i]
      }
    result = paste("홀수행의 합=", oddSum, "짝수행의 합=",evenSum)
    return(result)
    } else if(is.null(ex1)) {
      return()
    } else
      return("벡터만 처리가능!")
  }
mySum(c(1,3,5,7))  
mySum(NULL)  
mySum(data.frame())
  


#2
myExpr <- function(ex2) {
  if (is.function(ex2)) {
    result=sample(1:45, 6)
    cat(result,"\n")
  } else {
    stop("수행 안할꺼임!!")
  }
  return(ex2(result))
}
myExpr(min)
myExpr(3)



#3
createVector <- function(...) {
  ex3 <- c(...)
  if(any(is.na(ex3))) {
    return(NA)
    } else if (is.null(ex3)) {
      return()
    } else {
      return(ex3)
    }
  }
createVector(c(NA,1,"a"))
createVector()
createVector(c(1,2,"a"))
sample3 <- createVector(c(3,"A",5))
is.vector(sample3)



#4
data4 <- scan("c:/Rstudy/data/iotest1.txt")
sort(data4)
sort(data4, decreasing=TRUE)
sum(data4)
mean(data4)



#5
data5 <- scan("c:/Rstudy/data/iotest2.txt", what="")
max_word <- max(data5)
cat("가장 많이 등장한 단어는", max_word,"입니다.")

min(data5)