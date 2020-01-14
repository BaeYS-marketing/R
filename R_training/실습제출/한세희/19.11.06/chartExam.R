# 문제 1

library(dplyr)
clicklog <- read.table("data/product_click.log")
head(clicklog)
click <- clicklog %>% group_by(V2) %>% summarise(clicknum = n())
click <- as.data.frame(click)
str(click)
par(mar=c(7,7,7,7), mfrow=c(1,1))
barplot(click$clicknum, main="세로바 그래프 실습", xlab="상품ID", ylab="클릭수", col=terrain.colors(10), names.arg=click$V2)


png(filename="clicklog1.png", height=400, width=700, bg="white")
dev.off()



# 문제 2
head(clicklog)
clicktime <- clicklog$V1
clicktime1 <- strptime(clicktime, "%Y%m%d%H%M")
clicktime2 <- format(clicktime1, "%H")
clicktime3 <- as.numeric(clicktime2)
clicktime4 <- clicktime3 %>% table()
clicktime5 <-as.data.frame(clicktime4)
colnames(clicktime5) <- c("time", "freq")
b<- as.numeric(clicktime5$time) + 2

par(mar=c(3,3,3,3), mfrow=c(1,1))
pie(clicktime5$freq, labels=paste(clicktime5$time,"-", b),main="파이그래프 실습", col=rainbow(17))


png(filename="clicklog2.png", height=400, width=700, bg="white")
dev.off()
