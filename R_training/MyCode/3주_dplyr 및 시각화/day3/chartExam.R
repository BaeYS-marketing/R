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





#table
timeInfo <- as.numeric(timeInfo)
timeInfo<-table(timeInfo)

timeInfo2 <- as.vector(timeInfo)
timeInfo3 <- as.matrix(timeInfo)


pie(timeImfo2, labels=paste(0:18,'~',1:19))





#dplyr
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








###########다른 분.

click <- product
names(click) <- c("time", "product")

click = read.table("product_click.log",
                   col.names = c("time", "product"))
head(click)
str(click)
click$time = as.character(click$time)
click$time = strptime(click$time, "%Y%m%d%H%M")

# 문제1
xname = levels(click$product)
png(filename="clicklog1.png", height=400, width=700, bg="white")
barplot(table(click$product),
        main = "세로바 그래프 실습",
        xlab = "상품ID",
        ylab = "클릭수",
        col = terrain.colors(10),
        names.arg = xname)
dev.off()

# 문제2
click_time = format(click$time, "%H")
times = as.numeric(unlist(dimnames(table(click_time))))
png(filename="clicklog2.png", height=400, width=700, bg="white")
pie(table(click_time),
    main="파이그래프 실습",
    labels=paste(times, "~", times+1),
    col=rgb(sample(c(0,1),19,replace = T),
            sample(c(0,1),19,replace = T),
            sample(c(0,1),19,replace = T)))
dev.off()








###########다른 분
log <- read.table('data/product_click.log', stringsAsFactors = F)

log<-product

# 문제 1
str(log)

png(filename = 'clicklog1.png', width = 700)

barplot( height = table(log$V2),
         main = '세로바 그래프 실습',
         col=terrain.colors(10),
         xlab='상품ID', ylab='클릭수')

dev.off()


# 문제 2
str(log)

log$V1 <- as.character(log$V1)
log <- log %>%
        mutate( hour = as.POSIXlt(log$V1, format='%Y%m%d%H%M')$hour )

bin_df <- 
        as.data.frame(table(log$hour), stringsAsFactors = F ) %>% 
        mutate( hour_bin = paste0(Var1,'~',as.integer(Var1)+1) )
str(bin_df)


png(filename = 'clicklog2.png', width = 700)

pie(bin_df$Freq,
    labels = bin_df$hour_bin,
    col = rainbow(18),
    main = '파이그래프 실습')

dev.off()



