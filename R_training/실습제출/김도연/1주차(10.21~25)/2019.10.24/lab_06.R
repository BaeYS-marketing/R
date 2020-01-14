#Q1
exam1 = function(){
  LETTERS
  letters
  return(paste(LETTERS,letters,sep=""))
}
exam1()

#Q2
exam2 = function(p1){
  p2 = sum(1:p1)
  return(p2)
}
exam2(10)

#Q3
exam3 = function(q1,q2){
  if(q1>q2)
    return(q1-q2)
  else if(q2>q1)
    return(q2-q1)
  else
    return(0)
}
exam3(10,20)
exam3(20,5)
exam3(5,30)
exam3(6,3)

#Q4
exam4 = function(n1,n2,n3){
    
    n2_2 = c("+","-","*","%/%","%%") #연산자를 문자열로 하는 것이기 때문에  is.
    if(n2=="+")
      return(n1+n3)
    else if(n2=="-")
      return(n1-n3)
    else if(n2=="*")
      return(n1*n3)
    else if(n2=="%/%"){
      if(n1==0)
        return("오류1")
      else if(n3==0)
        return("오류2")
    else
      return(n1%/%n3)
    }
    else if(n2=="%%"){
      if(n1==0)
        return("오류1")
      else if(n3==0)
        return("오류2")
      else
      return(n1%%n3)
    }
    else(n2!=n2_2)
      return("규격의 연산자만 전달하세요.")
    
}
exam4(5,"-",2)
exam4(0,"+",2)
exam4(5,"*",2)
exam4(10,"%/%",3)
exam4(10,"%%",3)
exam4(10,"/",3)
exam4(10,"%%",0)
exam4(0,"%%",0)
exam4(10,"%/%",0)
exam4(0,"%/%",3)
