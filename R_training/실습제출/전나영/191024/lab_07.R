# 문제1
exam5 <- function(num, a = "#"){
  if(num > 0){
    for (n in 1:num) {
    cat(a)
    }
  }
  return()
}

exam5(5,)

# 문제2
exam6 <- function(score){
  for(item in score){
    if(is.na(item)){
      print("NA는 처리불가")
    } else if(item >= 85){
      print(paste(item, "점은 상등급입니다."))
    } else if(item >= 70){
      print(paste(item, "점은 중등급입니다."))
    } else {
      print(paste(item, "점은 하등급입니다."))
    }
  }
  return()
}

exam6(c(50, NA, 90))

# 문제3
countEvenOdd <- function(num){
  if(!is.numeric(num)){
    return()
  } else{
    even = 0
    odd = 0
    for(item in num){
      if(item %% 2 == 0){
        even = even +1
      } else {
        odd = odd +1
      }
    }
    lst = list(even = even, odd = odd)
    return(lst)
  }
}

countEvenOdd(c("a", "b", "c"))
countEvenOdd(c(10, 20, 31))


# 문제4
vmSum <- function(vec){
  if(!is.vector(vec)){
    print("벡터만 전달하숑!")
    return(NULL)
    } else if(!is.numeric(vec)){
    print("숫자 벡터를 전달하숑!")
    return(0)
    } else {
      return(sum(vec))
    }
}

vmSum(data.frame())
vmSum(c("a", 1, 2))
vmSum(c(1, 2, 3))


# 문제 5
vmSum2 <- function(vec){
  if(!is.vector(vec)){
    stop("벡터만 전달하숑!")
  } else if(!is.numeric(vec)){ 
    warning("숫자 벡터를 전달하숑!")
    return(0)
  } else {
    return(sum(vec))
  }
}

vmSum2(data.frame())
vmSum2(c("a", 1, 2))
vmSum2(c(1, 2, 3))
