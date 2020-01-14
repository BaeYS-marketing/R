library(dplyr)
library(ggplot2)
str(ggplot2::mpg)
mpg <- as.data.frame(ggplot2::mpg)


#문제1
ggplot(mpg, aes(x = cty, y=hwy)) +
  geom_point(shape=21, size=6, colour="blue")

ggsave("result1.png")

#문제2

mpg_class = mpg 
mpg_class$drv = as.factor(mpg$drv)
ggplot(mpg, aes(x = class)) + 
         geom_bar(aes(fill=drv))
ggsave("result2.png")

#문제3

mpg %>% midwest = midwest %>%
  mutate(popadults / poptotal * 100)
midwest$proadults

options(scipen = 99)

ggplot(midwest, aes(x=poptotal, y=popasian)) + 
  geom_point() +
  coord_cartesian(xlim=c(0,500000), ylim=c(0, 10000))

ggsave("result3.png")       
       
       
#문제4
mpg_cty = mpg %>% filter(mpg$class %in% c('compact', 'subcompact','suv'))
ggplot(mpg_cty, aes(x= class, y = cty, group = class)) + geom_boxplot()

ggsave("result4.png")

#문제5
h <- read.table("product_click.log")

ggplot(data=h, aes(x=V2)) +
  geom_bar(aes(fill=V2))

ggsave("result5.png")

#문제6







