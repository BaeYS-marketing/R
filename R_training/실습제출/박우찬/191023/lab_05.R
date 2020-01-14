# Q.1
grade = sample(1:6,1)
ifelse(grade == 1 |grade == 2|grade == 3,
       paste(grade,'학년은 저학년입니다'),
       paste(grade,'학년은 고학년입니다'))

# Q.2
choice = sample(1:5,1)

if(choice == 1){
  cat('300 + 50 =',300 + 50)
}else if(choice == 2){
  cat('300 - 50 =',300-50)
}else if(choice == 3){
  cat('300 * 50 =',300*50)
}else if(choice == 4){
  cat('300 / 50 =',300/50)
}else if(choice == 5){
  cat('300 %% 50 =',300%%50)
}

# Q.3
count = sample(3:10,1)
deco = sample(1:3,1)
if(deco == 1){
  cat(rep('x',count,sep=""))
}else if(deco ==2){
  cat(rep('$',count,sep=""))
}else if(deco ==3){
  cat(rep('#',count,sep=""))
}

count = sample(3:10,1)
deco = sample(1:3,1)
if(deco == 1){
  for(i in 1:count)
    cat('x')
}else if(deco ==2){
  for(i in 1:count)
    cat('$')
}else if(deco ==3){
  for(i in 1:count)
    cat('#')
}


# Q.4
score = sample(0:100,1)
score_new = score%/%10
score_new = as.character(score_new)
level = switch(score_new,'10' =, '9' = "A",
               '8' = "B", '7' = "C", '6' = "D",
               "F")
cat(score,'점은 ',level,'등급입니다.',sep="")

# Q.5

alpha = for(i in 1:26)
  cat('"',LETTERS[i],letters[i],'"',sep ='')

for(i in 1:26){
  alpha[i] =  paste(LETTERS[i],letters[i],sep = '')

}
alpha

  paste(LETTERS[1:26],letters[1:26],sep = '')





