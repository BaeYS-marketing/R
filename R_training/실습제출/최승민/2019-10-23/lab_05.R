#문제1

grade <- sample(1:6, 1)
if(grade == 1 | grade == 2 |grade == 3) {
  cat(grade, "학년은 저학년입니다.")
}else {
  cat(grade, "학년은 고학년입니다.")
}
  
#문제2

choice <- sample(1:5,1)
if(choice == 1){
  cat("결과값:", 300+50,"\n")
} else if (choice == 2) {
  cat("결과값:",300-50,"\n")
} else if (choice == 3 ){
  cat("결과값:",300*50,"\n")
} else if (choice == 4 ){
  cat("결과값:",300/50,"\n")
} else {
  cat("결과값:",300%%50,"\n")
}

#문제3

count <- sample(3:10,1)
deco <- sample(1:3,1)

count
deco

if(deco ==1){
  for(deco in deco:count) cat("*")
} else if(deco ==2) {
  for(deco in deco:count ) cat("$")
} else {
  for(deco in deco:count ) cat("#")
} 

#문제4

scr <- sample(0:100,1)
score <- scr/10
score <- as.integer(score)
score <- as.character(score)
level <- switch(EXPR = score, 
                "9"="A", "8"="B", "7"="C", "6"="D", "F")
cat(scr,"점은", level,"등급입니다")

#문제5
for(i in 1:26){
  alpha[i] <- paste(LETTERS[i], letters[i],sep="")
  }
alpha