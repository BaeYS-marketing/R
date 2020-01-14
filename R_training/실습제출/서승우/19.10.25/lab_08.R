#문제1
mySum <- function(x){
  oddSum<-0
  evenSum<-0
  if(is.null(x))
    return()
  if(!is.vector(x))
    stop("벡터만 처리 가능!!")
  if(any(is.na(x)))
    x[is.na(x)]<-min(x, na.rm=TRUE)
  return(list(
    oddSum=sum(x[seq(1,length(x),2)]),
    evenSum=sum(x[seq(2,length(x),2)])
  ))
}


#문제2
myExpr<- function(x){
  if(!is.function(x)){
    stop("수행 안할꺼임!!")
  }else{
    p<-sample(1:45,6)
    q<-x(p)
    }
    return(q)
}


#문제3
createVector<- function(...){
  x<-c(...)
  if(is.null(x))
    return()
  else{
    if(any(is.na(x))){
      return("NA")
    }else{
      a<-c(x)
      return(a)
    }
  }
}

#문제4
nums<-scan("data/iotest1.txt")
cat("오름차순 : ", sort(nums), "\n",
    "내림차순 : ", sort(nums, decreasing=T), "\n",
    "합 : ", sum(nums), "\n",
    "평균 : ", mean(nums))

#문제5
words<-scan("data/iotest2.txt", what="", encoding="UTF-8")
cat("가장 많이 등장한 단어는 ",words[max(table(words))],"입니다.")

