#문제1
click_sum <- read.table("product_click.log", header=F)
click_count=table(click_sum$V2)
png(filename="clicklog1.png", height=500, width=900, bg="white")
barplot(click_count, main="세로바 그래프 실습",
        xlab="상품ID", ylab="클릭수",
        col=terrain.colors(10))
dev.off()
#문제2
click_sum$V1=strptime(click_sum$V1, "%Y%m%d%H%M")
click_h=format(click_sum$V1,"%H")
click_r=table(click_h)
click_table=cbind(c(paste0(as.numeric(row.names(click_r)),
                           "~",as.numeric(row.names(click_r))+1)),
                  click_r)
png(filename="clicklog2.png", height=800, width=800, bg="white")
pie(as.numeric(click_table[,2]),labels=click_table[,1],main="파이그래프 실습",col = rainbow(17), radius = 1)
dev.off()