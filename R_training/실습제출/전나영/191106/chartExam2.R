# 문제1
install.packages("ggplot2")
install.packages("dplyr")
library(ggplot2)
library(dplyr)

mpg2 <- mpg %>% select(cty, hwy)
plot(mpg2, xlab = "도시연비", ylab = "고속도로연비", pch = 3)

# 문제2
mpg3 <- table(mpg$drv)
barplot(mpg3, col = rainbow(3))

# 문제3
boxplot(hwy~manufacturer, xlab = "", ylab = "고속도로연비", data = mpg, ylim=c(5, 40), las = 2, col = heat.colors(15))
title(main="*제조사별 고속도로 연비*", col.main="magenta")
