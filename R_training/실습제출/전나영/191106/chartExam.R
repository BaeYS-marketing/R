# 문제 1
product_click <- read.table("data/product_click.log")
p <- product_click$V2
countp <- table(p)
png(filename="clicklog1.png", height=400, width=700, bg="white")
barplot(countp, main = "세로바 그래프 실습", xlab = "상품ID", ylab = "클릭수", col = terrain.colors(10))
dev.off()


# 문제 2
time <- product_click$V1
t <- format(strptime(time, "%Y%m%d%H%M"), "%H")
count_t <- table(t)
levels_t <- as.numeric(as.data.frame(count_t, stringsAsFactors = FALSE)$t)
png(filename="clicklog2.png", height=400, width=700, bg="white")
pie(count_t, main = "파이그래프 실습", col = rainbow(19), labels = paste(levels_t, "~", levels_t+1))
dev.off()
