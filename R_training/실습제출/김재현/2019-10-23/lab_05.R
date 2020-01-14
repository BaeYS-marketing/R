#문제1
grade <- sample(1:6,1)
if(grade <= 3){
  cat(grade,"학년은 저학년입니다.",sep = "","\n")
}else{
  cat(grade,"학년은 고학년입니다.",sep = "","\n")
}

#문제2
choice <- sample(1:5,1)
result <- if(choice == 1){
  300+50
}else if(choice == 2){
  300-50
}else if(choice == 3){
  300*50
}else if(choice == 4){
  300/50
}else if(choice == 5){
  300%%50
}
cat("결과값 :",result,"\n")

#문제3
count <- sample(3:10,1)
deco <- sample(1:3,1)
if(deco == 1){
  for(t in 1:count){
    cat("*")
  }}else if (deco == 2){
    for(t in 1:count){
      cat("$")
    }}else{
      for(t in 1:count){
        cat("#")
      }}

#문제4
score <- sample(0:100,1)
ma_score <- score%/%10
ma_score <- as.character(ma_score)
grade <- switch(EXPR = ma_score,
                "10"=,"9"="A 등급",
                "8"="B 등급",
                "7"="C 등급",
                "6"="D 등급",
                "F 등급")
cat(score,"점은"," ",grade,"입니다.",sep="")



#문제5
paste0(LETTERS,letters)
