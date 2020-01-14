#문제1
exam5<- function(num,cha="#"){
  if (num>=0){
    rep(cha,num)
  }
}

exam5(5,"강")

#문제2

exam6<- function(scores){
  for (num in scores) {
    if ((num<=100) & (num>=85)){
      print(paste(num,'점은 상등급입니다.',sep=' '))
    }else if((num<85)&(num>=70)){
      print(paste(num,'점은 중등급입니다.',sep=' '))
    }else if((num<70)&(num>=0)){
      print(paste(num,'점은 하등급입니다.',sep=' '))
    }else{
      print("NA는 처리불가")
    }
  }
}
  
scores<-c(100,50,40,60,80,-1)
exam6(scores)

#문제3
countEvenOdd<-function(nums){
  even=0
  odd=0
  for (num in nums) {
    if(num%%2==1){
      odd=odd+1
    }else if(num%%2==0){
      even=even+1
    }
  }
  counts = list(even, odd)
  names(counts) = c('even', 'odd')
  return(counts)
}
nums<-c(3,4,5,6,7,8,4,3)
countEvenOdd(nums)

#문제4
vmsum<-function(nums){
  if(!is.vector(nums)){
    print("벡터만 전달하숑!")
  }else if(!is.numeric(nums)){
    print("숫자 벡터를 전달하숑!")
    return(0)
  }else{
    sum=0
    for(num in nums){
      sum=sum+num
    }
    return(sum)
  }
}

nums<-list("3","4","5")
vmsum(nums)
  
#문제5
vmsum2<-function(nums){
  if(!is.vector(nums)){
    stop("벡터만 전달하숑!")
  }else if(!is.numeric(nums)){
    warning("숫자벡터를 전달하숑")
    return(0)
  }else{
    sum=0
    for(num in nums){
      sum=sum+num
    }
    return(sum)
  }
}

nums<-list("3","4","5")
vmsum2(nums)
































