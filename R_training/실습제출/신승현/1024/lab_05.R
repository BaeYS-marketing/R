#문제1
grade <- sample(1:6, 1)
if(grade>3){
  cat(grade, "학년은 고학년입니다.")
}else{
  cat(grade, "학년은 저학년입니다.","\n")
}


#문제2
choice <- sample(1:5, 1)
if (choice ==1){
    cat("결과값:", 300+50)
}else if (choice==2){
    cat("결과값:", 300-50)
}else if (choice==3){
    cat("결과값:",300*50)
}else if (choice==4){
    cat("결과값:",300/50)
}else if (choice==5){
    cat("결과값:",300%%50)
}
  
  
#문제3
count <- sample(3:10,1)
deco<- sample(1:3,1)
deco  
if(deco==1){
  rep("*",count)
}else if(deco==2){
  rep("$",count)
}else if(deco==3){
  rep("#", count)
}

  
count <- sample(3:10,1)
deco<- sample(1:3,1)
deco 
if(deco==1){
  for(i in 1:count)
    cat("*")
}else if(deco==2){
  for(i in 1:count)
    cat("$")           # i :반복횟수, 실제로는 없음
}else if(deco==3){
  for(i in 1:count)
    cat("#")
}
  



#문제4
score <- sample(0:100, 1)
if (score >=90){
  level<-"A등급"
}else if (score >=80&89>=score){
 level<-"B등급" 
}else if (79>=score&score >=70){
  level<-"C등급"
}else if (69>=score&score >=60){
  level<-"D등급"
}else{
  level<-"F등급"
}
cat(score, "점은 ", level,"입니다.\n", sep="")


score=sample(0:100,1)
score_new=score%/%10
score_new=as.character(score_new)
level=switch(score_new, '10'=, '9'="A",
             '8'="B", '7'="C", '6'="D",
             "F")
cat(score, '점은',level,'등급입니다.',sep="")


#문제5
  
 
  paste(LETTERS,letters, sep="")
  