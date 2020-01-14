setwd('data')
product<-read.table('product_click.log')


library(dplyr)


#문제1
click<-product %>% 
        group_by(V2) %>% 
        summarise(click = n())

click <- as.matrix(click)  

click2 <- click[,2]
click2<-as.numeric(click2)


##방법1. 백터에 아예 이름지정해 놓고 barplot 그리기 
names(click2) <- click[,1]
#click2 <- as.numeric(click2) : 지정한 names 모두 사라진다. 
'위에서 먼저 타입 바꾸고 나서 네이밍 설정했다!!'


#방법2. 아규먼트로 지정 : names.arg=click[,1])
barplot(click2, main = "세로바 그래프 실습", 
        ylab='클릭 수',xlab = '상품ID', names.arg=click[,1],col =terrain.colors(length(click2)))




png(filename="clicklog1.png", height=400, width=700, bg="white")

barplot(click2, main = "세로바 그래프 실습", 
        ylab='클릭 수',xlab = '상품ID',col =terrain.colors(length(click2)))



dev.off()




#문제2

# install.packages('stingr')
library(stringr)

product[1,1]

time<-NULL
timeInfo<-NULL
for (i in 1:length(product[,1])){
        time<-str_sub(product[i,1],start = 9,end = 10)
        timeInfo <- c(timeInfo, time)  
        }


timeInfo <- as.numeric(timeInfo)
timeInfo <- as.data.frame(timeInfo)

timeInfo<-cbind(product[,1],timeInfo)
names(timeInfo) <-c('V0','V1')




timeCount<-timeInfo %>% 
        group_by(V1) %>% 
        summarise(count=n())

png(filename="clicklog2.png", height=400, width=700, bg="white")

pie(timeCount$count, labels=paste(timeCount$V1,'~',timeCount$V1+1))

dev.off()
