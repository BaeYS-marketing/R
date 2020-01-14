#문제1
grade<-sample(1:6,1)
if(grade<=3){
  cat(grade,"학년은 ","저학년입니다.","\n")
}else{cat(grade,"학년은 ","고학년입니다.","\n")}

#문제2
choice<-sample(1:5,1)
if(choice==1){
  cat("결과값 : ", 300+50, "\n")
}else if(choice==2){
  cat("결과값 : ",300-50, "\n")
}else if(choice==3){
  cat("결과값 : ",300*50, "\n")
}else if(choice==4){
  cat("결과값 : ",300/50,"\n")
}else{cat("결과값 : ",300%%50, "\n")}

#문제3
count<-sample(3:10,1)
deco<-sample(1:3,1)
if(deco==1){
  for(n in 1:count){
    cat("*")
  }
}else if(deco==2){
  for(n in 1:count){
    cat("$")
  }
}else if(deco==3){
  for(n in 1:count){
    cat("#")
  }
}


#문제4
score<-sample(0:100,1)
score_a<-score%/%10
score_a<-as.character(score_a)
grade <- switch(EXPR=score_a, 
       "9"=,"10"="A 등급",
       "8"="B 등급",
       "7"="C 등급",
       "6"="D 등급",
       "F 등급")
cat(score,"점은 ", grade,"입니다.")


#문제5
paste(LETTERS,letters, sep="")
