setwd('C:/Rstudy/data')
product<-read.table('product_click.log')
View(product)

library(dplyr)


#문제1
click<-product %>% 
        group_by(V2) %>% 
        summarise(click = n())

click <- as.matrix(click)

click2 <- click[,2]
names(click2) <- click[,1]

click2<-as.numeric(click2)


png(filename="clicklog1.png", height=400, width=700, bg="white") 
barplot(click2, main = "세로바 그래프 실습",
        ylab='클릭 수',xlab = '상품ID',col =terrain.colors(length(click2)), names.arg=click[,1])

dev.off()
getwd()


#문제2
# 
# install.packages('stingr')
library(stringr)
library(dplyr)

time<-NULL
timeInfo<-NULL
for (i in 1:length(product[,1])){
        time<-str_sub(product[i,1],start = 9,end = 10)
        timeInfo <- c(timeInfo, time)  
}

timeInfo <- as.numeric(timeInfo)
timeInfo <- as.matrix(timeInfo)
timeInfo=table(timeInfo)
timeInfo=as.matrix(timeInfo)


png(filename="clicklog2.png", height=400, width=700, bg="white") 
pie(timeInfo,label=paste(c(0:5,8:18),"~",c(1:6,9:19)),col=rainbow(18))
title(main="파이그래프실습", col.main="black", font.main=4)
dev.off()
getwd()
