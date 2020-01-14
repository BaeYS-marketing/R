(countex <- read.table("product_click.log"));

#문제1
x = countex$V2
p = table(x)
png(filename="clicklog1.png", height=400, width=700, bg="white")
clicklog1 = barplot(p, main="세로바 그래프 실습", ylab="클릭수", xlab="상품ID", col=terrain.colors(10))
dev.off()


install.packages("dplyr")
library(dplyr)
#문제2

countex
y = countex$V1
a = format(strptime(y, "%Y%m%d%H%M"), "%H")
b= table(a)
str(b)
pie(b, labels=paste(b[[1]][1,], "~", (b+1)),col = rainbow(19))
b[[1]][1,]
pie(성적$국어, labels=paste(성적$성명, "-", 성적$국어), col=rainbow(10))

pie(a, labels = paste(a, "~", b, col = rainbow(19)))
