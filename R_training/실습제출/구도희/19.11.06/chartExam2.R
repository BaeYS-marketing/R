# 문제 1
str(ggplot2::mpg)
libraty(dplyr)
mpg <- as.data.frame(ggplot2::mpg)
plot(mpg$hwy~mpg$cty, xlab="도시연비", ylab="고속도로연비", pch=3)

plot(mpg$cty, mpg$hwy, xlab="도시연비", ylab="고속도로연비", pch=3)

# 문제 2
fr4 <- table(mpg$drv)
ty <- c(4,"f","r")
barplot(fr4 ,beside=T, names.arg=ty,
        ylim=c(0, 100), col=c("red","green","blue"))

# 문제 3
boxplot(hwy~manufacturer,data=mpg, las=2,
        xlab="", ylab="고속도로연비",
        ylim=c(5, 40), col=heat.colors(15))
title(main="*제조사별 고속도로 연비*", col.main="deep pink")

