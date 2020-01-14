#문제 1
grade <- sample(1:6,1)
cat(as.character(grade),"학년은 ", switch(grade,'1'=,'2'=,'3'="저",'4'=,'5'=,'6'="고"),"학년입니다.\n", sep="")

#문제 2
choice <- sample(1:5,1)
cat("결과값 :", switch (choice,300+50,300-50,300*50,300/50,300%%50),sep="")

#문제 3
count <- sample(3:10,1)
deco <- sample(1:3,1)
for (i in count){
  cat(switch (deco, rep("*",i),rep("$",i),rep("#",i)),sep="")
} 

#문제 4
# score <- sample(0:100,1)
# if (score >= 90){
#   level <- "A 등급"
#   } else if (score >= 80){
#     level <- "B 등급"
#   } else if (score >= 70){
#     level <- "C 등급"
#   } else if (score >= 60){
#     level <- "D 등급"
#   } else {
#     level <- "F 등급"}
# 
# cat(score,"점은 ", level,"입니다.",sep="")

score <- sample(0:100,1)

level <- switch(as.character(score%/%10),"0"=,"1"=,"2"=,"3"=,"4"=,"5"="F등급","6"="D등급",
       "7"="C 등급","8"="B 등급","9"="A 등급")
cat(score,"점은 ", level,"입니다.",sep="")


#문제 5
for (i in 1:length(letters)){
  alpha[i] <- paste0(LETTERS[i],letters[i])
}
print(alpha)

