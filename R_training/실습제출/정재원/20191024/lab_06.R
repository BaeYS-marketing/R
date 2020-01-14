#문제1
exam1 <-function(){
  Alphabet<-LETTERS[1:26]
  alphabet<-letters[1:26]
  AL<-(paste(Alphabet,alphabet,sep=""))
  return(AL)
}
exam1()
#문제2
exam2 <-function(number){
  sum<-0
  sum<-((number+1)*number)/2
  return(sum)
}
exam2(10)
#문제3
exam3 <-function(v1,v2){
  absol<-v1-v2
  if(absol<0)absol<--absol
  return(absol)
}
exam3(10,20)
exam3(20,5)
exam3(5,30)
exam3(6,3)
exam3(100,100)
#문제4
exam4<-function(n1,mark=char,n2){
  switch (EXPR=mark,
          "+"=result<-n1+n2,
          "-"=result<-n1-n2,
          "*"=result<-n1*n2,
          "%/%"=result<-n1%/%n2,
          "%%"=result<-n1%%n2,
          result<-"규격의 연산자만 전달하세요.")
  return(result)
  }
exam4(3,"+",4)
exam4(8,"-",3)
exam4(3,"*",8)
exam4(100,"%/%",10)
exam4(81,"%%",7)
exam4(10,"ㅋ",7)