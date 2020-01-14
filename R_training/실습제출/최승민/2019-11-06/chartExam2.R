library(dplyr)
mpg <- as.data.frame(ggplot2::mpg)

#1
plot(mpg$cty, mpg$hwy, xlab = "도시연비", ylab = "고속도로연비", pch = 3)
dev.off 

#2
num<- table(mpg$drv)
barplot(num, col =c("red", "green", "blue"))
dev.off

#3
boxplot(hwy~manufacturer, data=mpg,   las = 2,
        ylim=c(5,40), ylab = "고속도로연비",
        col = heat.colors(15), density=colden,
        main = "제조사별 고속도로 연비")        
dev.off

