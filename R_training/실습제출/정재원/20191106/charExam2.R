#문제1
mpg = as.data.frame(ggplot2::mpg)
par(mar=c(5,5,5,5), mfrow=c(1,1))
plot(mpg$cty,mpg$hwy, pch="+", xlab="도시연비", ylab="고속도로연비")
#문제2
barplot(table(mpg$drv), col=c("red","green","blue"))
#문제3
boxplot(mpg$hwy~mpg$manufacturer, 
        main="*제조사별 고속도로 연비*",
        xlab="", ylab="고속도로연비",
        ylim=c(5,40), 
        las=2, col=heat.colors(16))
axis(2, at=seq(5,40,5), lab=seq(5,40,5), las =1)
title(main="*제조사별 고속도로 연비*",col.main="#FF00B4FF")