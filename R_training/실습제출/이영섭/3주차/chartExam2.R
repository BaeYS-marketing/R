#문제 1
library(ggplot2)
plot(mpg$cty,mpg$hwy, pch=3,xlab = "도시연비", ylab = "고속도로연비")

#문제 2
barplot(table(mpg$drv),col = c("red","green","blue") )

#문제 3
par(mar=c(6,6,6,6), mfrow=c(1,1))
boxplot(hwy~manufacturer,data=mpg, xlab="",ylab="고속도로연비", 
        main="*제조사별 고속도로 연비*", ylim=c(5,40),
        col= heat.colors(15), col.main=rgb(1,0.2,1),las=2, yaxs="i")
