#문제1
grade<-sample(1:6,1)
if(grade>3){cat(grade,"학년은 고학년입니다","\n")
}else{cat(grade,":학년은 저학년입니다","\n")}


#문제2
choice<-sample(1:5,1)
choice1<-if (choice==1){cat(300+50)
} else if (choice==2){cat(300-50)
} else if (choice==3){cat(300*50)
} else if (choice==4){cat(300/50) 
} else {cat(300%%50)}


#문제3
count<-sample(3:10,1)
deco<-sample(1:3,1)
if (deco==1){ for(x in 1:count) cat("*")
} else if (deco==2){ for(x in 1:count) cat("$")
} else {for(x in 1:count) cat("#")}


#문제4
for(score in 0:100)
x1<-as.character(score%/%10)
level<-switch (EXPR=x1,'10'=,'9'="A",'8'="B",'7'="C",'6'="D","F")
level


#문제5
A<-LETTERS[]
a<-letters[]
alpha<-paste0(A,a)
alpha
