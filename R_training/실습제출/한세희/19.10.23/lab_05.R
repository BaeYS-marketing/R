# 문제1
grade <- sample(1:6, 1)
grade
if(grade<=3){
  cat(grade,"학년은 저학년입니다.","\n")
}else{
  cat(grade,"학년은 고학년입니다.","\n")
}

# 문제2 
choice <- sample(1:5, 1)
a <- 300
b <- 50

if(choice==1){
  cat(a+b,"\n")
}else if (choice==2){
  cat(a-b,"\n")
}else if (choice==3){
  cat(a*b,"\n")
}else if (choice==4){
  cat(a%/%b,"\n")
}else{
  cat(a%%b,"\n")
}


  
# 문제3
count <- sample(3:10, 1)
deco <- sample(1:3, 1)
if(deco==1)
  cat(rep("*",count))



for(n in 1:5)
  if(choice==1){
    cat(a+b,"\n")
  }else if (choice==2){
    cat(a-b,"\n")
  }else if (choice==3){
    cat(a*b,"\n")
  }else if (choice==4){
    cat(a%/%b,"\n")
  }else{
    cat(a%%b,"\n")
  
if문을 먼저 쓰고 그 안에서 for문 쓰거나
deco변수가 무엇이냐에 따라 for문을 세번써도 된다.
if문 쓰고 rep함수를 썼다.

  

# 문제4
score <- sample(0:100, 1)
score1 <- score%/%10
score1 <- as.character(score1)
result <- switch(EXPR=score1,
                 "10"=,"9"="A등급",
                 "8"="B등급",
                 "7"="C등급",
                 "6"="D등급",
                 "F등급")
cat(score,"점은",result,"입니다.","\n",sep="")
                

# 문제5
a <- LETTERS[1:26]
b <- letters[1:26]

paste(a,b,sep="")



