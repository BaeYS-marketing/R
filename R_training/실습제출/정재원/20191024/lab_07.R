#문제1
exam5<-function(num,mark="#"){
  if(num>0){print(rep(mark,num))}
  else{
    return()
    }
}
exam5(10,"G")
exam5(10)
exam5(-10)
#문제2
exam6<-function(...){
  data<-list(...)
  for(item in data){
    if(!is.numeric(item)){
      print("NA는 처리불가입니다.")
    }else if(item>84){
        print(paste(item,"점은 상등급입니다."))
      }else if(item>69){
        print(paste(item,"점은 중등급입니다."))
      }else
        print(paste(item,"점은 하등급입니다."))
    }
}
exam6(10,20,30,"f","g",70,"h",90)
#문제3
countEvenOdd = function(...) {
  eo = c(...)
  if (!is.numeric(eo)) {
    return()
  }
  even = 0
  odd = 0
  for (i in eo) {
    if (i %% 2 == 0) {
      even = even + 1
    } else {
      odd = odd + 1
    }
  }
  lst = list(even = even, odd = odd)
  return(lst)
}
countEvenOdd(2,3,4,5,6,7,8)
countEvenOdd(1,2,3,4,5,"h")
countEvenOdd(1,2,3,4,5,6)
countEvenOdd(0,1,2,3,4,5,6,0)
#문제4
vmSum = function(...) {
  x<-c(...)
  if ((!is.vector(x)) | (is.list(x))) {
    print('벡터만 전달하숑!')
    return()
  } else {
    if (!is.numeric(x)) {
      print('숫자 벡터를 전달하숑!')
      return(0)
    } else {
      return(sum(x))
    }
  }
}
vmSum(1,2,3,4,5)
#문제5
vmSum2 = function(...) {
  x<-c(...)
  if ((!is.vector(x)) | (is.list(x))) {
    stop("벡터만 전달하숑!")
  } else {
    if (!is.numeric(x)) {
      warning('숫자 벡터를 전달하숑!')
      return(0)
    } else {
      return(sum(x))
    }
  }
}
vmSum2(v1)
vmSum2("1","2","3")
vmSum2(1,2,3,4,5)
