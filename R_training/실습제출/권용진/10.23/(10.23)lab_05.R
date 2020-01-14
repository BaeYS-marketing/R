#Q1
grade=sample(1:6, 1)
grade = paste(grade, "학년", sep="") 
result = switch(EXPR = grade,
                "1학년"=,"2학년"=,"3학년"="저학년",
                "고학년")
cat(grade,"은",result,"입니다\n",sep="")

#Q2
choice=sample(1:5,1)
result = switch(EXPR = choice,
                "1"=300+50,
                "2"=300-50,
                "3"=300*50,
                "4"=300/50,
                "5"=300%%50)
cat("결과값",":",result)

#Q3
count=sample(3:10,1)
deco=sample(1:3,1)
if(deco==1){
 rep("*",count)
}else if(deco==2){
 rep("$",count)
}else{
  rep("#",count)
}

#Q4
score <- sample(0:100,1)
score2<-as.character(score %/% 10)
score2
level <- switch(EXPR = score2 , '10'=,'9'= 'A등급',
                 '8'= 'B등급',
                 '7'= 'C등급',
                 '6'= 'D등급',
                 'F등급')
result
cat( score,'점은 ',level,'입니다.',sep='')

#Q5
alpha=paste(LETTERS[1:26],letters[1:26],sep="")

