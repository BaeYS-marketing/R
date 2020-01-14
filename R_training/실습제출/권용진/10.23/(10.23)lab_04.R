#Q1
L1=list(
  name="scott", 
  sal=3000
  )
restult1=L1[[2]]*2

#Q2
L2=list(
  "scott", 
  c(100,200,300)
  )

#Q3
L3=list(
  c(3,5,7), 
  c("A","B","C")
  )
L3[[2]][1]="Alpha"

#Q4
L4=list(
  alpha=0:4 ,
  beta=sqrt(1:5) ,
  gamma=log(1:5)
)

L4$alpha+10; L4[1] 

#Q5
L5=list(
  math=list(95,90),
  writing=list(90,85),
  reading=list(85,80)
  )

mean(unlist(L5[1]));
mean(unlist(L5[2]));
mean(unlist(L5[3]))

#Q6
time=32150
hr=time%/%3600
min=(time%%3600)%/%60
sec=(time%%3600)%%60
c1=c(hr, min, sec)
c2=c(시간, 분, 초)
paste(c1,c2)
