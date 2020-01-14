#문제 1
mySum <- function(vec){
    if (is.null(vec)) return(NULL)
    else if (any(is.na(vec))) {
      warning("NA를 최저값으로 변경하여 처리함")
      min <- min(vec[!is.na(vec)])
      for (i in 1:length(vec)){
        if (is.na(vec[i])) {vec[i] <- min}
      }
      oddSum <- sum(vec[which(vec%%2==1)])
      evenSum <- sum(vec[which(vec%%2==0)])
      return(list(oddSum=oddSum,evenSum=evenSum))
    }
    else if (!is.vector(vec)) stop("벡터만 처리가능")
    else {oddSum <- sum(vec[which(vec%%2==1)])
        evenSum <- sum(vec[which(vec%%2==0)])
        return(list(oddSum=oddSum,evenSum=evenSum))
    }
}

mySum(c(1,2,3,4,NA))


#문제 2
myExpr <- function(fun_1){
  if (!is.function(fun_1)) stop("수행 안할꺼임")
  x <- sample(1:45,6)
  return(fun_1(x))
}

myExpr(sum)
myExpr(mean)
myExpr(data.frame)

#문제 3
createVector <- function(...){
  if (is.null(c(...))) return(NULL)
  else if (any(is.na(c(...)))) return(NA)
  else c(...)
}

createVector(1,2,3,4,5)


#문제 4
data4 <- scan("data/iotest1.txt")
sort(data4)
sort(data4, decreasing = T)
sum(data4)
mean(data4)

#문제 5
data5 <- scan("data/iotest2.txt",what="")
data5 <- data.frame(table(data5))
paste0("가장 많이 등장한 단어는 ",data5[which(data5$Freq==max(data5$Freq)),1],"입니다.")
