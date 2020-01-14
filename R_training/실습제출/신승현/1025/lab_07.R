#문제1
exam5<-function(p1,p2="#"){
  if(p1<0){
    NULL
  }else if(p1>0){
    rep(p2,p1)
  }
}
exam5(p1=3,p2="a")

  
  #문제2
  exam6<-function(x){
 for(x in data)
   if(
     if(x>=85&x<=100){
      score<-"상"
    }else if(x>=70&x<=84){
      score<-"중"
    }else if(x<=69){
      score<-"하"
    }
    print(x)
    print(x, "점은",score, "등급입니다.")
    
    
  }

#문제3

countEvenOdd<- function(p1){
    if(is.numeric(p1) & is.vector(p1)){
      for( p1 in countEvenOdd){
    odd_count<-0
    even_count<-0
        if(p1%%2==0){
          even_count<-even_count+1
        }else if(p1%%2==1){
          odd_count<-odd_count+1
        }
    }else{
     return()
    }
}


f7 <- function(...){
  data<-c(...)
  sum<-0;
  for(item in data){
    if(is.numeric(item))
      sum<-sum+item
    else
      print(item)
  }
  return(sum)
}

f7(10,20,30)
f7(10,20,"test",30,40) 
  
f8
function(...) {
  data<
    list(...)
  sum<
    0;
  for(item in data) {
    if(is.numeric(item))
      sum< sum + item
    else
      print(item)
    return(sum)
  }
  
  
  #문제4

vmSum<-function(...){
  data<-c(...)
  sum<-0;
  for(item in data)
    if(is.vector(item){
      sum<-"벡터만 전달하숑!"
    }
      sum<-"벡터만 전달하숑!"
    }if(is.numeric(item)){
      sum<-"숫자 벡터를 전달하숑!"
    }
    
    return(sum)
    
    vmSum()
}


#문제5

vmSum2 <- function(){
  if(is.vector)
    warning("숫자 벡터를 전달하숑!")
  if(!is.vector||is.list)
           stop("벡터만 전달하숑!")
           result<-0
}
vmSum2()


vmSum2 <- function(){
  if(is.vector)
    warning("숫자 벡터를 전달하숑!")
  if(!is.vector()||is.list())
     stop("벡터만 전달하숑!")
     result <- 0
     
     result(sum)
     }
return()

#문제5
testWarn <- function(x){
  if(x<=0)
    stop("양의 값만 전달 하숑!! 더 이상 수행 안할거임..")
  if(x>5){
    warning("5보다 크면 안됨!! 하여 5로 처리했삼...!!")
  }
  return(rep("테스트",x))
}

testWarn(3)
testWarn(10)


vmSum2<-function()
tryCatch()
  
  
  
  countEvenOdd<- function(p1){
    if(is.numeric(p1) & is.vector(p1)){
      for( p1 in countEvenOdd){
        odd_count<-0
        even_count<-0
        if(p1%%2==0){
          even_count<-even_count+1
        }else if(p1%%2==1){
          odd_count<-odd_count+1
        }
      }else{
        return()
      }
    }