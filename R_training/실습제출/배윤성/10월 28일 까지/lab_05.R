

#문제1
grade <- sample(1:6,1)
grade <- paste(grade,'학년' ,sep='')
grade

result<- switch(EXPR = grade ,"1학년"=,"2학년"=,'3학년'='저학년입니다.', 
       '고학년입니다.')

cat( grade,'은 ', result ,sep='')



#문제2
choice <- sample(1:5,1)

result<-if(choice ==1){ 300+50  
}else if(choice ==2){ 300-50
}else if(choice ==4) { 300/50
}else if(choice ==3) { 300*50
}else {300%%50}

cat('결과값',':',result)


#문제3
count <- sample(3:10,1)
deco <- sample(1:3,1)

if(deco==1){
        rep('*',count)
}else if(deco ==2){
        rep('$',count)
}else {
        rep('#',count)}


#a*4 > error




#문제4
score <- sample(1:100,1)
score2<-as.character(score %/% 10)
score2

result <- switch(EXPR = score2 , '0'=,'9'= 'A 등급',
                 '8'= 'B 등급',
                 '7'= 'C 등급',
                 '6'='D 등급',
                 'F 등급')
result

cat( score,'점은 ',result,'입니다.' ,sep='')



#문제5
Alpha<-paste(LETTERS[1:26],letters[1:26], sep='')
Alpha

