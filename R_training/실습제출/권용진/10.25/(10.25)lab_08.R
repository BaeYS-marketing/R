#q1
mySum = function(p){
  evenSum = 0
  oddSum = 0
  if (any(is.na(p))){
    vec[is.na(p)] = min(p, na.rm =T)
    warning("NA를 최저값으로 변경하여 처리함!!")
 }
  if (!is.vector(p)){
    stop("벡터만 처리가능")
  }else{ 
    for(i in 1:length(p)){
      if(i%%2==0){
        evenSum <- evenSum + p[i]
      }else{
        oddSum <- oddSum + p[i]
      }
        result = list(evenSum = evenSum, oddSum = oddSum)
      }
       return(result)
  }
}
mySum(c(1,2,3))

#q2
myExpr = function(f1){
  if (!is.function(f1)) stop("수행 안할거임")
  f1.num = sample(1:45,6)
  return(f1(f1.num))
}
myExpr(exam2)


#q3
createVector = function(...)
{
  vec = c(...)
  if (any(is.na(vec)))
    return(NA)
  else 
  result = vec
  return(result)
}
createVector("hi")

#q4
nums = scan("data/iotest1.txt")
cat(paste("오름차순",":"),sort(nums, decreasing = F)) 
cat(paste("내림차순",":"),sort(nums, decreasing = T)) 
cat(paste("합",":"),sum(nums))
cat(paste("평균",":"),mean(nums))

#q5
data <- scan("data/iotest2.txt", what="")
?countdata <- table(data)
sortdata <- sort(countdata, decreasing=T)
word <- names(sortdata[1])
cat("가장 많이 등장한 단어는 ", word,"입니다")