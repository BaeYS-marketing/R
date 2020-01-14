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
