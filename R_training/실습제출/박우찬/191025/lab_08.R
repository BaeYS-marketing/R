# 2019-10-25

# Q 1

mySum =function(vec){
  oddSum = 0
  evenSum = 0
  if(any(is.na(vec))){
    vec[is.na(vec)] = min(vec, na.rm =T)
    warning('NA를 최저값으로 변경하여 처리함')
  }
  if(!is.vector(vec)){
    stop("백터만 처리가능!!")
  }else{
    for(i in 1:length(vec)){
      if(i %% 2 ==0){
        evenSum = evenSum + vec[i]
      }else{
        oddSum = oddSum + vec[i]
      } 
      result = list(evenSum = evenSum , oddSum = oddSum) 
    }
    return(result) 
  }  
}
mySum(1:20)
mySum(data.frame())
mySum(c(5,2,NA,NA,10))


# Q 2
myExpr = function(x){
  if(!is.function(x)){
    stop('수행 안할꺼임!!')
  }else{
    a = x
    return(a(sample(1:45, 6)))
  }
}

myExpr(max)
myExpr(c(1,2))


# Q 3

createVector = function(...){
  data = c(...)
  for(i in data){
    if(length(i)==0){
      return(NULL)
    }else if(any(is.na(data))){
      return(NA)
    }else
      return(as.vector(data))
    
  }
}
createVector(c(1,2,3))


# Q 4

test4 = scan('C:/Rstudy/data/iotest1.txt')
sort(test4)
rev(sort(test4))
sum(test4)
mean(test4)

# Q 5

test5 = scan('C:/Rstudy/data/iotest2.txt',what ="")
table(test5)
x = test5[max(table(test5))]
cat('가장 많이 등가하는 단어는',x,'입니다')









