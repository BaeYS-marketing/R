#문제1
grade <- sample(1:6, 1)
if (grade==1 | grade==2 | grade==3) {
  cat(grade, "학년은 저학년입니다.\n")
} else {
  cat(grade, "학년은 고학년입니다.\n")
}


#문제2
choice <- sample(1:5, 1)
if (choice==1) {
  cat("결과값: ", 300+50)
} else if(choice==2) {
  cat("결과값: ", 300-50)
} else if(choice==3) {
  cat("결과값: ", 300*50)
} else if(choice==4) {
  cat("결과값: ", 300/50)
} else {
  cat("결과값: ", 300%/%50)
}


#문제3
count <- sample(3:10, 1)
deco <- sample(1:3, 1)
count
deco
if(deco==1) {
  for (ex in 1:count) {
    cat("*")
  }
} else if(deco==2) {
  for (ex in 1:count) {
    cat("$")
  }
} else if(deco==3) {
  for (ex in 1:count) {
    cat("#")
  }
}


#문제4
score <- sample(0:100, 1)
score2 <- as.character(score%/%10)
level <- switch(score2, 
                "10"=,"9"="A", 
                "8"="B", 
                "7"="C",
                "6"="D", 
                "F")
cat(score, "점은 ",level,"등급입니다.\n")


#문제5
alpha <- paste(LETTERS[], sep="", letters[])
alpha


#c.f.)
for(i in 1:26) {
  for(j in 1:26) {
    if (i==j) {
      cat(LETTERS[i], sep="", letters[j], " ")
    }
  }
}
