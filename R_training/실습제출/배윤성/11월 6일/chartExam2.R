getwd()
library(ggplot2)


#문제 1
mpg$cty
mpg$hwy
plot(x=mpg$cty,y=mpg$hwy,xlab='도시 연비',ylab='고속도로 연비',pch=3)




#문제2
str(mpg)



drvCount<-as.matrix(table(mpg$drv))
names(table(mpg$drv))


barplot(drvCount,beside = T, space = 1, 
        col=c('red','green','blue'),names.arg=names(table(mpg$drv)))



#문제3

par(xpd=T)
boxplot(hwy~manufacturer,data=mpg,
        las = 2, col = heat.colors(18), ylab = '고속도로 연비',
        ylim = c(5,40))
title(main="*제조사별 고속도로 연비", col.main='#ff99ff', font.main=7)




