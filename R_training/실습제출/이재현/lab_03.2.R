#문제1
grade <- sample(1:6, 1)
if(grade <=3){
  cat(grade, "학년은 저학년입니다", "\n")
}else{
  cat(grade,"학년은 고학년입니다","\n")
}

#문제2
choice <- sample(1:5, 1)
if(choice==1){
  cat(300+50,"\n")
}else if(choice==2){
  cat(300-50,"\n")
}else if(choice==3){
  cat(300*50,"\n")
}else if(choice==4){
  cat(300/50, "\n")
}else if(choice==5){
  cat(300%%50, "\n")
}

#문제3
count <- sample(3:10, 1)
deco <- sample(1:3, 1)

if(deco==1){
  for(n in 1:count){
    cat("*")}
}else if(deco==2){
  for(n in 1:count){
    cat("$")
  }
}else if(deco==3){
  for(n in 1:count){
    cat("#")
  }
}



#문제 4
score <- sample(0:100, 1)
score_a <- score%/%10
score_a <- as.character(score_a)
result <- switch(EXPR=score_a,
                 "10"=,"9"="A등급",
                 "8"="B등급",
                 "7"="C등급",
                 "6"="D등급",
                 "F등급")
cat(score,"점은",result,"입니다",sep="")
                 
                 
              

#문제 5
alpha <- c(LETTERS,letters)
paste(LETTERS,letters,sep="")