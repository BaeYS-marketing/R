#문제1
mpg <- as.data.frame(ggplot2::mpg)
mpg
plot(mpg$cty, mpg$hwy, xlab = "도시연비", ylab = "고속도로연비", pch = 3)

#문제2

a =table(mpg$drv)
barplot(a)
chtcols = c("red","green","blue")
barplot(a, col=chtcols)

#문제3
hwy = mpg$hwy
manufacturer = mpg$manufacturer
chtcols2 = 
boxplot(hwy~manufacturer, main = "제조사별 고속도로 연비", col.main = "pink",xlab = "",
        ylab = "고속도로연비", las = 2, col=heat.colors(15))

