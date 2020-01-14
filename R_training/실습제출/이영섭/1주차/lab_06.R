#문제 1
exam1 <- function(){
  x<- paste0('\"',LETTERS[1:length(LETTERS)],letters[1:length(letters),"\" "])
  return(x)
}
exam1()

#문제 2
exam2 <- function(num){
  x <- sum(1:num)
  return(x)
}
exam2(10)

#문제 3
exam3 <- function(num1,num2){
  if (num1 > num2){
    print(num2)
  } else if (num1 < num2){
    print(num1)
  } else {print(0)}
}
exam3(10,20)

#문제 4
exam4 <- function(num1,oper,num2){
  if (oper=="+"){x <- (num1 + num2)}
  else if (oper=="-"){x <- (num1 - num2)}
  else if (oper=="*"){x <- (num1 * num2)}
  else if (oper=="%/%"){
    if (num1!=0&num2!=0){x <- (num1 %/% num2)}
    else if (num1==0) {x<- c("오류1")}
    else if (num2==0) {x<- c("오류2")}
    else {x<- c("오류1 & 오류")}}
  
  else if (oper=="%%"){
    if (num1!=0&num2!=0){x <- (num1 %% num2)}
    else if (num1==0) {x<- c("오류1")}
    else if (num2==0) {x<- c("오류2")}
    else {x<- c("오류1 & 오류2")}}
  else {x<- c("규격의 연산자만 전달하세요")}

  return(x)

    }
exam4(100,"*",4)
exam4(1,"-",100)
exam4(2,"asd",34)
exam4(100,"%/%",0)

#문제 4-2

exam4_2 <- function(x,y,z){
  if ((y=="%/%")|(y=="%%")){
    if (x==0){return("오류1")}
    if (z==0){return("오류2")}
  }
  
  switch (y, "+" = return(x + z),
             "-" = return(x - z),
             "*" = return(x * z),
             "%/%"= return(x %/% z),
             "%%" = return(x %% z),
                    return("규격의 연산자만 전달하세요")
  )
}
exam4(100,"*",4)
exam4(1,"-",100)
exam4(2,"asd",34)
exam4(100,"%/%",0)
exam4(0,"%/%",10)








#문제 5
exam5 <- function(num1,x="#"){
  if (x>=0) {rep(x,num1)}
}
exam5(5,"abc")
