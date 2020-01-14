
library(dplyr)

#문제1
h <- read.table("product_click.log", header=F)
str(h)

table(h$V2)
ss <- table(h$V2)
ss

ss[1]

png(filename = "clicklog1.png", height=400, width=700,bg="white")
  
barplot(ss, main="세로바 그래프 실습", beside=T, ylab="클릭수", col=rainbow(10))
axis(1, at=1:10, lab=c("p001", "p002","p003","p004","p005","p006","p007","p008","p009","p010"))

title(xlab="상품ID", col.lab=rgb(1,0,0))
title(ylab="클릭수", col.lab=rgb(0,0,1))

legend(1, ymax, names(h)[c(3,4,5)], cex=0.8, col=pcols, pch=c(21,16,23), lty=c(1,2,3))

dev.off()



#문제2

(h <- read.table("product_click.log", header=TRUE));
pie(성적$국어, labels=paste(성적$성명, "-", 성적$국어), col=rainbow(10))
pie(성적$국어, clockwise=T, labels=paste(성적$성명, "-", 성적$국어), col=rainbow(10))
pie(성적$국어, density=10, clockwise=T, labels=paste(성적$성명, "-", 성적$국어), col=rainbow(10))
pie(성적$국어, labels=paste(성적$성명, "-", 성적$국어), col=rainbow(10), main="국어성적", edges=10)
pie(성적$국어, labels=paste(성적$성명,"\n","(",성적$국어,")"), col=rainbow(10))
pie(rep(1, 24), col = rainbow(24), radius = 1)


