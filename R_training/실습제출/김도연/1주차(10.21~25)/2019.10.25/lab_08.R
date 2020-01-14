#Q1
mySum = function(x){
  if(!is.vector(x)){
    stop("벡터만 처리가능")
  }
  else if(any(is.na(x))){
    warning("NA를 최저값으로 변경하여 처리함!!","\n")
    x[is.na(x)] = min(x, na.rm = T) #다시 생각하자!!!!!!!!!!!!!!!!!!!!!!!!!
    evenSum = 0
    oddSum = 0
    for(i in 1:length(x))
      if(i%%2==0)
        evenSum = evenSum + x[i]
    else
      oddSum = oddSum + x[i]
    lst = list(oddSum = oddSum, evenSum = evenSum)
    return(lst)
  }
  else if(is.null(x)){
    return()
  }
  else
    evenSum = 0
    oddSum = 0
    for(i in 1:length(x))
    if(i%%2==0)
      evenSum = evenSum + x[i]
    else
      oddSum = oddSum + x[i]
  lst = list(oddSum = oddSum, evenSum = evenSum)
  return(lst)
}

mySum(c(2,3,4,5,6,7,8))
mySum(c(2,3,4,5,6,7,NA))
mySum(NULL)

#Q2
myExpr=function(abd){
  if(!is.function(abd)){
    stop("수행 안할꺼임!!")
  }else{
    y=sample(1:45,6)
  }
  return(abd(y))
}
y
myExpr(1)
myExpr(max)
myExpr(min)
print(mySum)


#Q3
creatVector = function(...){
  if(is.null(c(...))){
    return()
  }
  else if(any(is.na(c(...))))
    return(NA)
  else
    x=c(...)
    return(x)
}
creatVector("abc",11)
creatVector(NA)
creatVector(NULL)

#Q4
doc =  scan("data/iotest1.txt")
doc


cat("오름차순 :",order(doc))
cat("내림차순 :",order(doc,decreasing=T))
cat("합 :",sum(doc))
cat("평균 :",mean(doc))

#Q5
doc2=scan("data/iotest2.txt",what="",encoding="UTF-8")
doc2
doc3=factor(doc2)
summary(doc3)
table(doc3)
