# pre
log <- read.table("product_click.log", stringsAsFactors = F)


# 문제 1
colnames(log) <- c("time", "prod")
sum_click <- log %>% group_by(prod) %>% summarise(sum_click = n())
xname <- sum_click$prod

png(filename="clicklog1.png", height=400, width=700, bg="white")
barplot(sum_click$sum_click, main = "세로바 그래프 실습", xlab = "상품ID", ylab = "클릭수", col = terrain.colors(10), names.arg = xname)
dev.off()


# 문제 2
vec_time <- log$time
vec_HM <- NULL
t <- NULL
for(i in 1:746){
  t <- substr(vec_time[i],9,10)
  vec_HM <- c(vec_HM,t)
}
HM_data <- data.frame(vec_HM)
graph_me <- HM_data %>% group_by(vec_HM) %>% summarise(count = n())
index <- c(1:6,9:19)

png(filename="clicklog2.png", height=400, width=700, bg="white")
pie(graph_me$count, labels=paste(graph_me$vec_HM, "~", index), col=rainbow(10), main="파이그래프 실습")
dev.off()

