terrain.colors(10)

#문제 1
click <- read.table("product_click.log", header=F)
y <- table(click$V2)
png(filename="clicklog.png", height=400, width=700, bg="white")

barplot(table(click$V2), main="세로바그래프실습", xlab="상품ID", ylab="클릭수",  xlim=c(0, 12), ylim=c(0, 100), col=terrain.colors(10)) 

dev.off()


#문제 2
png(filename="clicklog2.png", height=400, width=700, bg="white")
click$V1 <- strptime(click$V1, "%Y%m%d%H%M")
click$V1 <- format(click$V1, "%H")
click2 <- click%>%
  group_by(V1) %>%
  summarise(click_num=n())
abc<- as.numeric(click2$V1)
pie(click2$click_num, labels=paste(abc, "-", abc+1), col=rainbow(18), main="파이그래프 실습")
dev.off()