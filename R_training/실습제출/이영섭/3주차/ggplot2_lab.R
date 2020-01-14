#문제 1
ggplot(mpg, aes(x=cty, y=hwy)) + geom_point(colour="blue")
ggsave("result1.png")

#문제 2
ggplot(mpg, aes(x=class)) + geom_bar(aes(fill=drv))
ggsave("result2.png")

#문제 3
options(scipen = 99) 
ggplot(midwest, aes(x=poptotal, y=popasian)) + geom_point()+xlim(0,500000)+ylim(0,10000)
ggsave("result3.png")

#문제 4
library(dplyr)
mpg_m <- mpg %>% filter(class=='compact' | class=='subcompact' | class=='suv')
ggplot(mpg_m, aes(x =class, y = cty)) + geom_boxplot()
ggsave("result4.png")

#문제 5
library(stringr)
data <- readLines("data/product_click.log")
str_length(data[1])
data <- substr(data,14,17)
data <- data.frame(data)
colnames(data) <- c('V2')
ggplot(data,aes(x=V2)) + geom_bar(aes(fill=V2))
ggsave("result5.png")

#문제 6
data <- readLines("data/product_click.log")
p_year <- substr(data,1,4)
p_month <- substr(data,5,6)
p_day <- substr(data,7,8)
p_date <- paste0(p_year,'-',p_month,'-',p_day)
p_weekdays <- weekdays(as.Date(p_date))
ggplot(data.frame(p_weekdays),aes(x=p_weekdays)) + geom_bar(aes(fill=p_weekdays)) +
  labs(x="요일", y="출력수", fill='day') + theme_bw()
ggsave("result6.png")

