mpg <- as.data.frame(ggplot2::mpg)
#1
plot(mpg %>% select(cty,hwy),pch=3,xlab="도시연비", ylab="고속도로연비")

#2
barplot(table(mpg$drv),col=c("red","green","blue"))

#3
boxplot(hwy~manufacturer,data=mpg,las=2,col=heat.colors(5),main="*제조사별 고속도로 연비*",col.main="hotpink")
