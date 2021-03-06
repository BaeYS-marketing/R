

#이용주


#################################################
#                graph exercise                 # 
#################################################

library(dplyr)
product_click <- read.table("./data/product_click.log")
product_clicK <- as.data.frame(product_click)
names(product_click) <- c("time", "name")

#문제1
product_summ <- product_click %>% group_by(name) %>% count()
png(filename="./data/clicklog1.png", height=400, width=700, bg="white")
barplot(product_summ$n, names.arg = product_summ$name, main="세로바 그래프 실습", col=terrain.colors(10), xlab="상품ID", ylab="클릭수")
dev.off()


#문제2
as.character(product_click$time)
result <- product_click %>% mutate(time=(substr(product_click$time,9,10))) %>%
  group_by(time) %>% count()
pie(result$n, labels=paste(result$time," ~ ",as.numeric(result$time)+1), main="파이그래프 실습", col=rainbow(19))
result


pie(성적$국어, labels=paste(성적$성명, "-", 성적$국어), col=rainbow(10))
pie(성적$국어, clockwise=T, labels=paste(성적$성명, "-", 성적$국어), col=rainbow(10))
pie(성적$국어, density=10, clockwise=T, labels=paste(성적$성명, "-", 성적$국어), col=rainbow(10))
pie(성적$국어, labels=paste(성적$성명, "-", 성적$국어), col=rainbow(10), main="국어성적", edges=10)
pie(성적$국어, labels=paste(성적$성명,"\n","(",성적$국어,")"), col=rainbow(10))
pie(rep(1, 24), col = rainbow(24), radius = 1)
