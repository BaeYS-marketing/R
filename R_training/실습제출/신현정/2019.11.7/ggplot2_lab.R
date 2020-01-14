#문제1

library(ggplot2)
library(dplyr)
serach()
data(mpg)
str(mpg)

ggplot(mpg , aes(x=cty , y=hwy)) +geom_point(color ="blue")
ggsave("result1.png")


#문제 2
ggplot(data=mpg, aes(x=class)) + geom_bar(aes(fill=drv))
ggsave("result2.png")

#문제 3
options(scipen = 99)
ggplot(data=midwest, aes(x=poptotal , y=popasian )) + geom_point() +xlim(0,500000) +ylim(0 ,10000)
ggsave("result3.png")


#문제 4 
mpg <- as.data.frame(mpg)
str(mpg)
 data <- mpg %>%
  filter(class == "compact"| class == "subcompact" | class == "suv") 
 ggplot(data=data, aes(x=class , y=cty)) + geom_boxplot()
 ggsave("result4.png") 
  
#문제 5
click<- read.table("product_click.log")
ggplot(data=click, aes(x=V2)) + geom_bar(aes(fill=V2))
ggsave("result5.png")


#문제 6 
click<- read.table("product_click.log")
click$V1 <- strptime(click$V1, "%Y%m%d%H%M")
day<- format(click$V1, "%A")

ggplot(data=click , aes(x=day)) + geom_bar(aes(fill=day)) +labs(x="요일", y="클릭수") + ylim(0,200)+ theme_light()
ggsave("result6.png")