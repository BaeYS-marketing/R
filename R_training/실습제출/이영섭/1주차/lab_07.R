#문제 1
exam5 <- function(num1,x="#"){
  if (num1>=0) {rep(x,num1)}
  else {NULL}
}
exam5(3,"abc")

#문제 2
exam6 <- function(score){
  for (i in 1:length(score)) {
    if (is.na(score[i]) |is.character(score[i])) {print("NA는 처리불가 ")}
    else if (score[i] >=85) {print(paste(score[i],"점은 상등급입니다.",sep=""))}
    else if (score[i]>=70){print(paste(score[i],"점은 중등급입니다.",sep=""))}
    else {print(paste(score[i],"점은 하등급입니다.",sep=""))}
  }
}
exam6(c(12,0,100,70))

#문제 3
countEvenOdd <- function(num){
  if (!is.numeric(num)|!is.vector(num)) {return(NULL)}
  
  odd <-NULL
  even <-NULL
  for (num in 1:length(num)){
    if (num %% 2){ odd <- append(odd,1)}
    else {even <- append(even,1)}  
  }
  return(list(even=length(even),odd=length(odd)))
}
  
countEvenOdd(c(2,3,4,5,23,214,24,24,24,11))
countEvenOdd(c(2,"3",4,5))

num %% 2

#문제 4
vmSum <- function(vec){
  if (!is.vector(vec)) {print("벡터만 전달")
    return(0)
  }
  if (!is.numeric(vec)) {print("숫자 벡터를 전달")
    return(0)
  }
  else return(sum(vec))
}

vmSum(data.frame())



#문제 5
vmSum2 <- function(vec){
  if (!is.vector(vec)) {stop("벡터만 전달") 
    return(0)
  }
  if (!is.numeric(vec)) {warning("숫자 벡터를 전달")
    return(0)
    }
  else return(sum(vec))
}

vmSum(c(1,23,"3"))


