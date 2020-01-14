library(ggplot2)
library(dplyr)
setwd('C:/Rstudy/3주차-다양한 함수 패키지와 시각화/11월 7일')

#문제1
mpg <- as.data.frame(ggplot2::mpg)
ggplot(mpg, aes(x=cty, y=hwy)) + geom_point(size=1, color="blue")
ggsave("result1.png")

#문제2
ggplot(mpg, aes(x=factor(class))) + geom_bar(aes(fill=factor(drv)), alpha=1.0)
ggsave("result2.png")

#문제3
mid <- as.data.frame(ggplot2::midwest)
mid_new=mid%>%
  filter(poptotal<=500000&popasian<=10000)
ggplot(mid_new, aes(x=poptotal, y=popasian)) + geom_point(size=1, color="black")+ ylim(0, 10000)
options(scipen = 99)
ggsave("result3.png")

#문제4
mpg <- as.data.frame(ggplot2::mpg)
mpg_new=mpg%>%
  filter(class=='compact'|class=='subcompact'|class=='suv')
ggplot(data = mpg_new, aes(x = class, y = cty)) + geom_boxplot()
ggsave("result4.png")

#문제5
product<-read.table('C:/Rstudy/data/product_click.log')
click<-product %>% 
  group_by(V2) %>% 
  summarise(click = n())

ggplot(data = click, aes(x =V2, y=click )) + geom_bar(aes(fill=factor(V2)),stat="identity", alpha=1.0)
ggsave("result5.png")

#문제6
product<-read.table('C:/Rstudy/data/product_click.log')
a=strptime(product$V1, format = "%Y%m%d%H%M")
day=format(a, "%A")
day=as.matrix(day)
clicks=as.matrix(product$V2)

product_new=data.frame(요일=day,클릭수=clicks,stringsAsFactors = F)

day_count=product_new%>%
  group_by(요일) %>% 
  summarise(클릭수 = n())
ggplot(data = day_count, aes(x =요일, y=클릭수 )) +
  geom_bar(aes(fill=factor(요일)),stat="identity", alpha=1.0)+
   ylim(0, 200)+ 
  theme_light()
ggsave("result6.png")

  
















