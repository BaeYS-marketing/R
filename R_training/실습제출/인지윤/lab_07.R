#1
exam5 <- function(num, let2) {
  if (!is.numeric(let2)) {
    if (num>0) {
      for(x in 1:num) {
        cat(let2)
      }
    } else if (num<0) 
      cat("")
  }
  else
    cat("#")
}
exam5(10,"+")
exam5(10, 1)
exam5(-10,"a")
exam(10)

#다른사람이 한 1 
exam5 <- function(num, cha="#") {
  if(num >= 0) {
    rep(cha, num)
  }
}
exam5(5)



#2
exam6 <- function(score) {
  if (!is.na(score)) {
    if (score >= 85) 
      grade="상"
    else if (score >= 70)
      grade="중"
    else
      grade="하"
    print(paste(score, "점은", grade, "등급입니다.")) 
  } else 
    print("NA는 처리불가")
}
exam6(71)
exam6(NA)


#3
countEvenOdd <- function(ex3) {
  if (is.vector(ex3) & is.numeric(ex3)) {
    as.list(ex3)
    even=0
    odd=0
    for (i in 1:length(ex3)) {
      if (ex3[i] %% 2 == 0) {
        even=even+1
      } else {
        odd=odd+1
      }
    }
    result=paste("짝수갯수:", even, "홀수갯수:", odd)
    return(result)
  } else {
    return()
  }
} 
countEvenOdd(c(1,3,4))
countEvenOdd(c("a","b"))

#4
vmSum <- function(ex4) {
  if (is.vector(ex4)) {
    if(is.numeric(ex4)) {
      result = sum(ex4)
    } else {
      print("숫자 벡터를 전달하숑!")
      result = 0
    }
  } else {
    print("벡터만 전달하숑!")
    result = NULL
  }
  return(result)
}
vmSum(c(1,2,3))
vmSum(c("a","B"))
vmSum(data.frame())




#5
vmSum2 <- function(ex5) {
  if (is.vector(ex5)) {
    if(is.numeric(ex5)) {
      result=sum(ex5)
    } else {
      warning("숫자 벡터를 전달하숑!")
      result=0
    }
  } else {
    stop("벡터만 전달하숑!")
  }
  return(result)
}
vmSum2(c(1,3))
vmSum2(c("a"))
vmSum2(data.frame())
