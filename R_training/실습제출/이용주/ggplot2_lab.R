

# 이용주

#############################################################
#                       ggplot exercise                     #    
#############################################################


library(ggplot2)
library(dply)

#문제1
mpg <- as.data.frame(ggplot2::mpg)
ggplot(mpg, aes(x=cty, y=hwy)) + geom_point(size=2, colour="blue")


#문제2
ggplot(mpg, aes(x=class)) + geom_bar(aes(fill=drv))


#문제3
midwest <- as.data.frame(ggplot2::midwest)
ggplot(midwest, aes(x=poptotal, y=popasian,  options(scipen = 99))) + geom_point(size=1) + coord_cartesian(ylim=c(0, 10000), xlim=c(0, 500000))

#문제4
ggplot(mpg, aes(x=class, y=cty)) + geom_boxplot() + coord_cartesian(ylim=c(10, 35)) + scale_x_discrete(limits=c("compact","subcompact","suv"))


#문제5
product_click <- read.table("./data/product_click.log")
ggplot(product_click, aes(x=V2)) + geom_bar(aes(fill=V2))

#문제6
day <- as.Date(substr(product_click$V1,1,8),"%Y%m%d")
day <- weekdays(day)
weeks <- as.data.frame(day)
ggplot(weeks, aes(x=day)) + geom_bar(aes(fill=day))+ labs(x="요일", y="클릭수") + theme_bw()
