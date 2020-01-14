library(dplyr)

#1
product_click <- read.table("c:/Rstudy/data/product_click.log")
head(product_click)
col.names(product_click) = c("날짜", "횟수")
ex1 <- product_click %>% group_by(횟수) %>% summarise(n=n())
xname <- ex1$횟수
barplot(ex1$n, main="세로바 그래프 실습", xlab="상품ID", ylab="클릭수", 
        names.arg=xname, col=terrain.colors(10))

#2
time <- as.numeric(substr(product,9,10))
t_product <- table(paste0(time,"~",time+1))
t_product <- t_product[c(1,2,12,13,14,15,16,17,3,4,5,6,7,8,9,10,11)]

png(filename="clicklog2.png", height=400, width=700, bg="white") # 출력을 png파일로 설정
pie(t_product, col = rainbow(17), radius = 1, main= "파이그래프 실습")
dev.off()




-----------------------------------------------다시해보기
time <- substr(product_click$날짜, 9, 10)
time <- as.numeric(time)
str(time)
ex2 <- table(time)
ex2
table

table(paste0(time, "~", time+1))


click_time <- product_click %>% group_by(시간) %>% summarise(n=n())
click_time
click_time$시간대 <- click_time %>% ifelse(시간==0 | 시간==1, "0~1", )
ex2 <- click_time %>% 



ex2 <- table
pie(click_time$n, click_time$n+1, main="파이그래프 실습", col=rainbow(12))



png(filename="clicklog2.png", height=400, width=700, bg="white") # 출력을 png파일로 설정
pie(t_product, col = rainbow(17), radius = 1, main= "파이그래프 실습")
dev.off()
