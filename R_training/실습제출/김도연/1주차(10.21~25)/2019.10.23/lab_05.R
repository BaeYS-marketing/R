#문제1-1
grade = sample(1:6,1)

#문제1-2
if(grade>3){
  cat(grade,"학년은 고학년입니다.","\n")
}  else{
    cat(grade,"학년은 저학년입니다.\n")
}

#문제2-1
choice = sample(1:5,1)
#문제2-2,4
if(choice==1){
  cat("결과값 :",300+50,"\n")
}else if(choice==2){
  cat("결과값 :",300-50,"\n")
}else if(choice==3){
  cat("결과값 :",300*50,"\n")
}else if(choice==4){
  cat("결과값 :",300/50,"\n")
}else{
  cat("결과값 :",300%%50,"\n")
}

#문제3-1
count = sample(3:10,1)
#문제3-2
deco = sample(1:3,1)
#문제3-3
if(deco==1){
  rep("*",count)
}else if(deco==2){
  rep("$",count)
}else{
  rep("#",count)
}

#문제4
score = sample(0:100,1)
score2 = score%/%10
score2 = as.character(score2)
level = switch(EXPR = score2,"10"=, "9" = "A", 
               "8" ="B",
               "7" ="C",
               "6" ="D",
               "F")
cat(score,"점은",level,"등급입니다.")

#문제4 ---연습
#score = sample(0:100,1)
#score2 = score%/%10
#score2 = as.character(score2)
#level = switch(EXPR = score2,"score2=9" = "A", 
               #"score2=8" ="B",
               #"score2=7" ="C",
               #"score2=6"="D",
               #"F")  ## "8"이랑 "score2=8"이랑 다르다!!
#cat(score,"점은",level,"등급입니다.")

#문제5
LETTERS
letters
alpha = paste(LETTERS,letters,sep = "")
alpha
