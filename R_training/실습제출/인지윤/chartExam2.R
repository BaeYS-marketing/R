library(ggplot2)
library(dplyr)

#1
mpg_ex <- mpg %>% select(cty, hwy)
head(mpg_ex)
plot(mpg_ex, xlab="도시연비", ylab='고속도로연비', pch=3)

#2
mpg_ex2 <- mpg %>% group_by(drv) %>% summarise(n=n())
head(mpg_ex2)
xname <- mpg_ex2$drv
barplot(mpg_ex2$n, names.arg=xname, col=rainbow(3))

#3
boxplot(hwy~manufacturer, data=mpg, las=2, 
        main="*제조사별 고속도로 연비*", xlab="", ylab="고속도로연비",
        col=heat.colors(15), col.main="#FF028D")