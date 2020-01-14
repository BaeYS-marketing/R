library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)


# 문제 1
plot(mpg$cty,mpg$hwy, ylim = c(11, 45), pch = (3), xlab = "도시연비", ylab = "고속도로연비")

# 문제 2
barplot(table(mpg$drv), col = c(rgb(1,0,0),rgb(0,1,0),rgb(0,0,1)))

# 문제 3
boxplot(hwy~manufacturer,data=mpg, 
        ylim = c(5, 40), 
        col = heat.colors(15),
        xlab = "",
        main = "*제조사별 고속도로 연비*", 
        col.main = "pink", 
        ylab = "고속도로연비", 
        las = 2)
