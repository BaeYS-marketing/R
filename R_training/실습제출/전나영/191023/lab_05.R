# 문제1
grade <- sample(1:6, 1)

if(grade <= 3){
  cat(grade, "학년은 저학년입니다.\n")
}else{
  cat(grade, "학년은 고학년입니다.\n")
}

# 문제2
choice <- sample(1:5, 1)
if(choice==1){
  cat("결과값 :", 300+50)
}else if(choice==2){
  cat("결과값 :", 300-50)
}else if(choice==3){
  cat("결과값 :", 300*50)
}else if(choice==4){
  cat("결과값 :", 300/50)
}else{
  cat("결과값 :", 300%%50)
}

# 문제3
count <- sample(3:10, 1)
deco <- sample(1:3, 1)
if(deco==1){
  rep("*", count)
}else if(deco==2){
  rep("$", count)
}else{
  rep("#", count)
}

#문제4
score <- sample(0:100, 1)
score2 <- score%/%10
score2 <- as.character(score2)
level <- switch(EXPR = score2,
      "10"=, "9"="A 등급",
      "8"="B 등급",
      "7"="C 등급",
      "6"="D 등급",
      "F")
cat(score, "점은 ", level, "입니다\n", sep="")

#문제5
big <- LETTERS[1:26]
small <- letters[1:26]
alpha <- paste(big, small, sep = "")