# 문제1
mpg = as.data.frame(ggplot2::mpg)
plot(mpg$cty, mpg$hwy,
     xlab = "도시연비",
     ylab = "고속도로연비",
     pch = 3)

# 문제2
drv_n = mpg %>%
  group_by(drv) %>%
  summarise(n = n())
barplot(drv_n$n,
        names.arg = drv_n$drv,
        col = c("red", "green", "blue"))

# 문제3
boxplot(hwy ~ manufacturer, data = mpg,
        las = 2,
        main = "*제조사별 고속도로 연비*",
        col.main = "deeppink",
        xlab = NULL,
        ylab = "고속도로연비",
        ylim = c(5, 40),
        col = heat.colors(15))
