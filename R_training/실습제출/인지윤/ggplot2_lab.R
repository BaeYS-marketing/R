#1
ggplot(mpg, aes(x=cty, y=hwy)) + geom_point(col="blue")
ggsave("c:/Rstudy/실습/result1.png") 

#2
ggplot(mpg, aes(x=class, y=count)) + geom_bar(aes(fill=drv), stat="identity")
ggsave("c:/Rstudy/실습/result2.png") 


#3
library(dplyr)
midwest2 <- midwest %>% filter(poptotal<=500000 & popasian<=10000)
ggplot(midwest2, aes(x=poptotal, y=popasian)) + geom_point(stat="identity")
ggsave("c:/Rstudy/실습/result3.png") 


#4
mpg2 <- mpg %>% filter(class=="compact" | class=="subcompact" | class=="suv")
ggplot(mpg2, aes(x=class, y=cty)) + geom_boxplot()
ggsave("c:/Rstudy/실습/result4.png") 


#5
product_click <- read.table("c:/Rstudy/data/product_click.log")
colnames(product_click) = c("v1", "v2")
ggplot(product_click, aes(x=v2, y=count)) + geom_bar(aes(fill=v2), stat="identity")
ggsave("c:/Rstudy/실습/result5.png") 

ggplot(product_click, aes(x=v2)) +geom_bar(aes(fill=v2))



#6
product_click$v3 <- substr(product_click$v1, 1, 8)
product_click$v3 <- as.Date(product_click$v3, "%Y%m%d")
product_click$day <- product_click$v3 %>% format("%A")
head(product_click)
ggplot(product_click, aes(x=day, y=count)) + 
  geom_bar(stat="identity", aes(fill=day)) + labs(x="요일") + theme_linedraw()
ggsave("c:/Rstudy/실습/result6.png") 
