mpg<-as.data.frame(ggplot2::mpg)

#문제1
plot(mpg$hwy~mpg$cty, pch=3, xlab='도시연비', ylab='고속도로연비')

#문제2
barplot(table(mpg$drv), col=rainbow(3))

#문제3
boxplot(hwy~manufacturer, 
        data=mpg, las=2, 
        xlab='',ylab='고속도로연비', 
        col=heat.colors(15),
        ylim=c(5,40))
title(main='*제조사별 고속도로 연비*',col.main='deep pink',
      )