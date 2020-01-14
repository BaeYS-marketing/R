library(dplyr)

#실습1
(prodd <- read.table("product_click.log"))
prodd %>% 
  head

prodd <- prodd %>% 
  group_by(V2) %>% 
  summarise(click = n()) %>% 
  mutate(click_num = click)

prodd$click_num

xname <- prodd$V2                                   # X 축 값 설정위한  벡터
barplot(prodd$click_num, main="세로바그래프실습", xlab="상품ID", ylab="클릭수", col=terrain.colors(10), names.arg=xname)
png(filename="세로바그래프실습.png", height=400, width=700, bg="white")

#2
prodd$V1 <- strptime(prodd$V1, "%Y%m%d%H%M")
prodd$V1 <- format(prodd$V1, "%H")

prodd <- prodd %>% 
  group_by(V1) %>% 
  summarise(n = n()) %>% 
  mutate(time = n)

prodd$V1 <- as.numeric(prodd$V1)

for(i in 1:length(prodd$V1)){
  prodd$V3[i] <- prodd$V1[i] +1 
}

pie(prodd$n, labels=paste(prodd$V1, "~", prodd$V3  ) , col=rainbow(length(prodd$V1)), main="파이그래프실습")
png(filename="파이그래프실습.png", height=400, width=700, bg="white")
