# Q.1
exam5 = function(n1, c1 = '#'){
  if(n1<0){
    
  }else{
    for(i in 1:n1){
      cat(c1)
    }
  }
  return(NULL)
}

exam5(-4,'a')

# Q.2
exam6 = function(x){
  if(is.na(x)){ 
    print('NA는 처리불가')
  }else if(x>=85){ 
    print(cat(x,'점은 상등급입니다.'))      
  }else if(x>=70){
    print(cat(x,'점은 중등급입니다.'))
  }else{
    print(cat(x,'점은 하등급입니다.'))  
  }
}  
  
exam6(c(95))
exam6(NA)

# Q.3

countEvenodd = function(...){
  
  data = c(...)
  odd = 0
  even = 0
  print(class(data))
  if(!is.numeric(data)){
    return(NULL)
  }else{
    for(i in data){
      if(i %% 2 == 0){
        even = even + 1
      }else{
        odd = odd + 1
      } 
    }
    data = list(even,odd)
    names(data) = c('even','odd')
  } 
    return(data)
}

countEvenodd(7,8,9)
countEvenodd('7,8,9')

# Q.4
vmSum = function(...){
  data = c(...)
  sum<- 0;
  print(clss(data))
  if(!is.vector(data)){
    print('벡터만전달하숑!')
    result = 0
  }else if(!is.numeric(data)){
    print('숫자 벡터를 전달하숑!')
    result = 0
  }else{
    result = sum(data)
  }
  return(result)
}
vmSum(1,2,3)
vmSum(1,2,3)

# Q.5
vmSum2 = function(...){
  data = c(...)
  sum<- 0;
  print(clss(data))
  if(!is.vector(data)){
    stop('벡터만전달하숑!')
  }else if(!is.numeric(data)){
    warning("숫자벡터만 전달하숑")
    return(0)
  }else{
    result = sum(data)
  }
  return(result)
}

vmSum(array(1:3, c(1,2,3)))
vmSum('가')

