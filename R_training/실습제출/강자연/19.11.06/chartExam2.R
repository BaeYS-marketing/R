library(dplyr)

mpg <- as.data.frame(ggplot2::mpg)

#문제1
plot(mpg$cty, mpg$hwy, pch=3 ,xlab="도시연비", ylab="고속도로연비",  xlim=c(10, 35), ylim=c(15, 45)) 


#문제2


drv_num=mpg %>%
  group_by(drv) %>%
  summarise(n=n())
xname=c(drv_num$drv)
barplot(drv_num$n, border="black", col=rainbow(3),names.arg=xname)

#문제3
boxplot(hwy~manufacturer,data=mpg,las = 2, ylab="고속도로연비",col=heat.colors(15),ylim=c(5, 40))
title(main="*제조사별 고속도로 연비*", col.main=rgb(0.9,0.1,0.2), font.main=7) 
