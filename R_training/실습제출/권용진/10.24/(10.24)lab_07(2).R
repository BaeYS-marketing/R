#q1
exam5 <- function(a, text="hi"){ 
    if (a<0) {break;}
    else {
      cat(rep(text,a),sep="")
      }
  return()
}
exam5(10,'ji')

#q2
exam6 = function(Q){
  if (!is.numeric(Q)) {print("NA는 처리불가")}
  else if (Q>=85 && Q<=100) grade="상"
  else if (Q>=70 && Q<85) grade="중"
  else if (Q<70) grade="하"
  return()
  print(paste(Q,'점은',grade,"등급입니다."))
  }
exam6("xx")

#q3
countEvenOdd <- function(n_list){
  if(is.vector(n_list) & is.numeric(n_list[1])){
    even <-0
    odd <-0
    for(i in 1:length(n_list)){
      if((n_list[i]%%2)==0){
        even <- even + 1
      }else{
        odd <- odd + 1
      }
    }
    result<-c(even,odd)
    names(result)<-c("even","odd")
    return(result)
  }else return(NULL)
}
countEvenOdd(c(149,150,151,0))
#q4
vmSum <- function(x="a"){
    result<-0
    if(!is.vector(x)| class(x) == 'list'){
      print("벡터만 전달하숑!")
      return(result)
    }else if(!is.numeric(x)){
      print("숫자 벡터를 전달하숑!")
      return(result)
    }else{
      for(i in 1:length(x)){
        result <- result+x[i]
      }
      return(result)
    }
}
vmSum(c(1,3,5)); vmSum(c(1,555)); vmSum(c(1,3,5,"a"))


#q5
vmSum2 <- function(x="a"){
  try({
    result<-0
    if(!is.vector(x)| class(x) == 'list'){
      stop("벡터만 전달하숑!")
      return(result)
    }else if(is.vector(x)&!is.numeric(x)){
      warning("숫자 벡터를 전달하숑!")
      return(result)
    }else{
      for(i in 1:length(x)){
        result <- result+x[i]
      }
      return(result)
    }
  })
}
vmSum2(c(1,3,5)); vmSum2(c(1,555)); vmSum2(c(1,3,5,"a"))
vmSum2(list(1,3))



