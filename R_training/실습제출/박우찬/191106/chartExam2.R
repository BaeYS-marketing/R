rm(mpg)
str(mpg)

# Q.1
plot(mpg$cty, mpg$hwy, xlab = '도시연비', 
     ylab = '고속도로연비',pch = 3)

# Q.2
color = c("red","green","blue")
barplot(table(mpg$drv),col = color)

# Q.3
color2 = heat.colors(15)
boxplot(hwy~manufacturer,data=mpg, 
        main = '*제조사별 고속도로 연비*', col.main = 'hotpink',
        las = 2, ylim = c(5,40), col = color2, ylab ='고속도로연비' )

