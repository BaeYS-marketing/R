rm(list=ls())

# Q1
mySum = function(vec){
  if (is.null(vec)){
    return(NULL)
  }else if (!is.vector(vec)){
    stop("벡터만 처리 가능!")
  }else if (any(is.na(vec))){
    warning("NA를 최저값으로 변경하여 처리함!")
    vec[is.na(vec)] = min(vec, na.rm=T)
  }
  
  oddSum = 0
  evenSum = 0
  
  for (idx in 1:length(vec)){
    if (idx %% 2){
      oddSum = oddSum + vec[idx]
    }else{
      evenSum = evenSum + vec[idx]
    }
  }
  result = list(oddSum = oddSum, evenSum = evenSum)
  return(result)
}

mySum(c(1,2,3,4,5,6,7,8))
mySum(NULL)
mySum(c(1,2,3,4,5,6,NA))


# Q2
myExpr = function(func){
  if (!is.function(func)){
    stop("수행 안할꺼임!!")
  }else{
    sample_num = sample(1:45, 6)
    result = func(sample_num)
  }
  return(result)
}

myExpr(sum)
myExpr(min)
myExpr(list)
myExpr(matrix(1:5))


# Q3
createVector = function(...){
  holder = list(...)
  
  if (is.null(holder)){
      result = NULL
    }else{
      if (any(is.na(holder))){
        result = NA
      }else{
        result = c(...)
      }
    }
  return(result)
}

createVector(NULL)
createVector(1,2,3,5,NA)
createVector(1,2,3,5)
createVector(1,2,34,4,5,6,7,5)
createVector(NULL, NULL)
createVector(NA,NA,NA,NA,NA)


# Q4
setwd('C:/Rstudy/data')
iotest1_data = scan('iotest1.txt', encoding="UTF-8")
print(sort(iotest1_data))
print(sort(iotest1_data, decreasing=T))
print(sum(iotest1_data))
print(mean(iotest1_data))

# Q5
iotest2_data = scan('iotest2.txt', encoding="UTF-8", what = '')
max_freq = max(iotest2_data)

print(paste0("가장 많이 등장한 단어는 ", max_freq, "입니다."))
