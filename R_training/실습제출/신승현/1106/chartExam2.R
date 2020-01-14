install.packages("ggplot2")
str(ggplot2::mpg)
mpg <- as.data.frame(ggplot2::mpg)
install.packages("dplyr")
library(dplyr)

#문제1

mpg %>% select(mpg$cty, mpg$hwy) %>%
  par(mar=mpg$cty, mfrow=mpg$hwy

      

#문제2
mpg %>% select(mpg$drv)
barplot(mpg$drv)


# 막대그래프 그리기


coldens <- seq(from=10, to=100, by=10)   # 막대그래프의 색밀도 설정을 위한 벡터
xname <- 성적$학번  