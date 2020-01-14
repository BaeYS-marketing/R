#문제1
exam1<-function(){
  xxx<-paste(LETTERS, letters, sep="")
  return(xxx)
}
exam1()

#문제2
exam2<-function(x){
  for(i in 1:x){
    sum=sum+i
  }
  return(sum)
}

#문제3
exam3<- function(x,y){
  if(x>=y){
    z=x-y
  }else if(x<=y){
    z=y-x
  }
  return(z)
}

#문제4
exam4<-function(x,y,z){
  if(y=="+"){
    o=x+z
  }else if(y=="-"){
    o=x-z
  }else if(y=="*"){
    o=x*z
  }else if(y=="/"){
    o=x/z
  }else if(y=="%/%"){
    if(x==0){
      o="오류1"
    }else if(z==0){
      o="오류2"
    }else{o=x%/%z}
  }else if(y=="%%"){
    if(x==0){
      o="오류1"
    }else if(z==0){
      o="오류2"
    }else{
      o=x%%z}
  }else{
  o="규격의 연산자만 전달하세요"
}
  return(o)
}