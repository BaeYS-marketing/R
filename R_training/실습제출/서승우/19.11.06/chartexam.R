(data3 <- read.table("product_click.log", header=F))

png(filename="clicklog1.png", height=400, width=700, bg="white") 
q1<-data3 %>% group_by(V2) %>% 
  summarise(click_num=n())
barplot(q1$click_num, main="세로바 그래프 실습", xlab="상품ID", ylab='클릭수', names.arg=q1$V2, col=terrain.colors(15))
dev.off()

png(filename="clicklog2.png", height=400, width=700, bg="white") 
data3$V1 <-strptime(data3$V1, '%Y%m%d%H%M')
data3$V1 <-format(data3$V1, '%H')
q2<-data3 %>% 
  group_by(V1) %>% 
  summarise(click_num=n())
abc<-as.numeric(q2$V1)
pie(q2$click_num, labels=paste(abc, "-", abc+1), col=rainbow(18),main="파이그래프 실습")
dev.off()
