#문제1
grade <- sample(1:6,1)
if(grade==3|grade==2|grade==1){
     cat(grade,"학년은 저학년입니다.","\n")
   } else{
     cat(grade,"학년은 고학년입니다.","\n")}
  
#문제2
choice <- sample(1:5,1)
if(choice==1){
  cat("결과값 :",300+50)
}else if(choice == 2){
  cat("결과값 :",300-50)
}else if(choice == 3){
  cat("결과값 :",300*50)
}else if(choice == 4){
  cat("결과값 :",300/50)
}else {cat("결과값 :",300%%50)
    }

#문제3
count <- sample(3:10,1)
deco <- sample(1:3,1)
if(deco == 1){
  print(rep("*",count))
}else if(deco == 2){
  print(rep("$",count))
} else {print(rep("#",count))}

# 문제4
score <- sample(0:100,1)
score_share <- score%/%10
score_share <- as.character(score_share)
level <- switch(EXPR=score_share,
              "10" =, "9" = "A등급", "8" = "B등급",
               "7" = "C등급", "6" = "D등급",
               "F등급")
cat(score,"점은" ,level, "입니다.","\n", sep="" )




# 문제5
paste0(LETTERS,letters)
paste(LETTERS,letters, sep="")

