# 문제1
mySum <- function(vec){
  if(!is.vector(vec)){
    stop("벡터만 처리 가능!!")
  } else if (any(is.na(vec))){
    warning("NA를 최저값으로 변경하여 처리함!!")
    vec[is.na(vec)] <- min(vec, na.rm = T)
    evenSum = 0;
    oddSum = 0;
    for(i in 1:length(vec)){
      if(i %% 2 == 0){
        evenSum <- evenSum + vec[i]
        } else {
          oddSum <- oddSum + vec[i]
          }
      }
      lst <- list(evenSum = evenSum, oddSum = oddSum)
      return(lst)
  } else if (is.null(vec)){
    return()
  } else {
    evenSum = 0;
    oddSum = 0;
    for(i in 1:length(vec)){
      if(i %% 2 == 0){
        evenSum <- evenSum + vec[i]
      } else {
        oddSum <- oddSum + vec[i]
      }
    }
    lst <- list(evenSum = evenSum, oddSum = oddSum)
    return(lst)
  }
}

mySum(data.frame())
mySum(c(NA, 1, 2, 3, 4))
mySum(NULL)
mySum(c(10, 20, 30, 40))


# 문제2
myExpr <- function(f){
  if(!is.function(f)){
    stop("수행 안할꺼임!!")
    } else {
    data <- sample(1:45, 6)
    print(data)
    return(f(data))
  }
}

myExpr(1:10)
myExpr(sum)
myExpr(max)


# 문제3
createVector <- function(...){
  v <- c(...)
  if(length(v) == 0){
    v <- NULL
    print(v)
  } else if(any(is.na(v))){
    v <- NA
    print(v)
  } else {
    return(v)
  }
}

createVector()
createVector(NA, 1, 2)
createVector(1, 2, 3, 4, 5)


# 문제4
data <- scan("data/iotest1.txt")
d <- function(d){
  cat("오름차순: ", sort(data), "\n")
  cat("내림차순: ", sort(data, decreasing = TRUE), "\n")
  cat("합: ", sum(data), "\n")
  cat("평균:", mean(data), "\n")
  }
d(data)

# 문제5
data2 <- scan("iotest2.txt", what = "")
countdata <- table(data2)
sortdata <- sort(countdata, decreasing = TRUE)
word <- names(sortdata[1])
cat("가장 많이 등장한 단어는 ", word, "입니다.\n")
