#문제1
grade <- sample(1:6,1)
if(grade<4){
  cat(grade,"학년은 저학년입니다.\n")
}else{
    cat(grade,"학년은 고학년입니다.\n")
  }
#문제2
choice <- sample(1:5,1)
switch (EXPR=choice,
        cat("결과값:",300+50,"\n"),
        cat("결과값:",300-50,"\n"),
        cat("결과값:",300*50,"\n"),
        cat("결과값:",300/50,"\n"),
        cat("결과값:",300%%50,"\n")
)
#문제3
count <-sample(3:10,1)
deco <-sample(1:3,1)
switch (EXPR=deco,
        cat(rep("*",count),"\n"),
        cat(rep("$",count),"\n"),
        cat(rep("#",count),"\n")
)
#문제4
score<-sample(0:100,1)
score1 <- score%/%10+1
switch (EXPR=score1,
        cat(score,"점은 D 등급 입니다.\n"),
        cat(score,"점은 D 등급 입니다.\n"),
        cat(score,"점은 D 등급 입니다.\n"),
        cat(score,"점은 D 등급 입니다.\n"),
        cat(score,"점은 D 등급 입니다.\n"),
        cat(score,"점은 D 등급 입니다.\n"),
        cat(score,"점은 D 등급 입니다.\n"),
        cat(score,"점은 C 등급 입니다.\n"),
        cat(score,"점은 B 등급 입니다.\n"),
        cat(score,"점은 A 등급 입니다.\n"),
        cat(score,"점은 A 등급 입니다.\n"),
        )
#문제5
Alpha<-LETTERS[1:26]
alpha<-letters[1:26]
print(paste(Alpha,alpha,sep=""))

