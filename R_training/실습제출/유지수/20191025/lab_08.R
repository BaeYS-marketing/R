#문제1
mySum <- function(x){
    if(any(is.vector(x))|any(is.list(x)!=T))
    if (any(is.na(x))){
     x[is.na(x)] <- min(x,na.rm = T)
     for (i in 1:length(x))
       if (i%%2==0)
         sum <- sum + x[i]
       else
         sum <- sum + x[i]
     oddSum <- sum(x[a])
     evenSum <- sum(x[b])
     try(warning("NA를 최저값으로 변경하여 처리함!"))
     return(list(oddSum=oddSum,evenSum=evenSum))
    }else{
      oddSum <- sum(x[a])
      evenSum <- sum(x[b])
      return(list(oddSum=oddSum,evenSum=evenSum))
    } 
  else if (is.null(x))
    return()
  else
    return(stop("벡터만 처리가능!!"))
}

mySum(c(2,10,3))


#문제2

myExpr <- function(func){
  if (is.function(func)!=T)
    stop("수행 안할거임!!")
  else
    a <- sample(1:45,6)
    b <- func(a)
    return(b)
}

myExpr(max)
myExpr(min)


#문제3

createVector <- function(...){
  x <- c(...)
  if (is.null(x))
    return()
  else if (any(is.na(x)))
    return("NA")
  else
    return(x)
}

createVector("d",14)

#문제4

a <- scan("data/iotest1.txt")
sort(a)
sort(a,decreasing = T)
sum(a)       
mean(a)

#문제5

a <- scan("data/iotest2.txt",what = "", encoding = "UTF-8")
name <- levels(factor(a))
cat("가장 많이 등장한 단어는",
    name[which(table(a)==max(table(a)))],
    "입니다.")







