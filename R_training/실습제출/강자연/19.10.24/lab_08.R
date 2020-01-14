#문제1

mySum <- function(vec){
  
  oddSum = 0
  evenSum = 0
  
  if (!is.vector(vec)){
    stop('벡터만처리가능 ')
  }else if (any(is.na(vec))){
    warning("NA를 최저값으로 변경하여 처리함")
    vec[is.na(vec)] = min(vec, na.rm = T)
    
    for (i in vec){
      if (i %% 2 == 1){
        oddSum = oddSum + i
      }else {
        evenSum = evenSum + i
      }
    }
  }else{
    for (i in vec){
      if (i %% 2 == 1){
        oddSum = oddSum + i
      }else {
        evenSum = evenSum + i
      }
    }
  }
  return(list(oddSum = oddSum, evenSum = evenSum))
}





#문제2


  
#문제3
  createVector2=function(...){
    data=list(...)
    vec=c()
    
    for(i in data){
      if(any(is.null(data))){
        return(NULL)
      }else if(any(is.na(data))){
        return(NA)
      }else {
        vec=c(unlist(data))
        return(vec)
      }
    }
  }
  
  
  

#문제4
  setwd('C:/Rstudy/data')
  iotest1 = scan('iotest1.txt', encoding="UTF-8")
  print(sort(iotest1))
  print(sort(iotest1, decreasing=T))
  print(sum(iotest1))
  print(mean(iotest1))
  
  #문제5
  iotest2 = scan('iotest2.txt', encoding="UTF-8", what = '')
  a = max(iotest2)
  
  print(paste("가장 많이 등장한 단어는 ", a, "입니다.",sep=""))
  
  
  

  
  
  