#문제1
L1 = list(name="scott",sal=3000)
result=L1$sal*2

#문제2
L2=list("scott",c(100,200,300))

#문제3
L3=list(c(3,5,7),c("A","B","C"))
L3[[2]][[1]]="Alpha"

#문제4
L4=list(alpha=0:4, beta=sqrt(1:5),gamma=log(1:5))
L4[[1]]=L4[[1]]+10
L4

#문제5
L5=list(math=list(95,90), writing=list(90,85), reading=list(85,80))
L5=unlist(L5)
mean(L5)

#문제6
time=32150
A=time%/%3600
B=time%%3600 %/%60
C=32150%%60
시간=paste(A,"시간",sep="")
분=paste(B, "분",sep="")
초=paste(C, "초",sep="")
paste(시간,분,초)
