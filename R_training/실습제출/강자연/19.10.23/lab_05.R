#문제1
grade <- sample(1:6,1)
if(grade<4){
  cat(grade,"은 저학년입니다.")
}else{
  cat(grade,"은 고학년입니다.")
}



#문제2
choice <- sample(1:5,1)
if(choice==1){
  cat(300+50)
} else if(choice==2){
  cat(300-50)
} else if(choice==3){
  cat(300*50)
} else if(choice==4){
  cat(300/50)
} else {
  cat(300%%50)
} 

cat("결과값", ":", choice ,"\n")

#문제3
count <-sample(3:10,1)
deco <- sample(1:3,1)

if(deco==1){
  cat(rep("*",count),"\n")
}else if(deco==2){
  cat(rep("$",count),"\n")
}else{
  cat(rep("#",count),"\n")
} 


#문제4
score <-sample(1:100,1)
score2 <- as.character(score%/%10) #스위치 함수는 문자로 변환해서 쓰자!!

result <- switch(EXPR=score2,
                 "1"=,
                 "2"=, 
                 "3"=, 
                 "4"=, 
                 "5"="F",
                 "6"="D",
                 "7"="C",
                 "8"="B",
                 "9"="A" ,
                 "10"="A")
cat(score,"점은", result, "입니다.","\n", sep=" ")

#문제5
paste(LETTERS[1:26], letters[1:26], sep="")









