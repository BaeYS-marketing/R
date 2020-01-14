rm(list=ls())

mpg = as.data.frame(mpg)

# Q1
plot(mpg$cty, mpg$hwy, pch = 3, xlab = "도시연비", ylab = "고속도로연비")

# Q2
mpg_drv = mpg %>% group_by(drv) %>% count
barplot(mpg_drv$n, names.arg=mpg_drv$drv, col = rainbow(3))

# Q3
boxplot(hwy~manufacturer,data=mpg,
        ylab="고속도로연비",las=2,
        ylim=c(5,40),
        xlab=NA,
        main="*제조사별 고속도로 연비*",
        col.main = "palevioletred1",
        col = heat.colors(length(unique(mpg$manufacturer))))
