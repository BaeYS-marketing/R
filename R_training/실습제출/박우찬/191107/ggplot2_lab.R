library(ggplot2)
str(mpg)
str(midwest)

# Q.1
ggplot(data = mpg, aes(x = cty , y= hwy)) + 
  geom_point(shape=21, size=2, fill="blue")
  ggsave('result1.png')

# Q.2 
ggplot(data = mpg, aes(x = class, fill=drv)) + 
  geom_bar()
ggsave('result2.png')
       
# Q.3
options(scipen = 99)
ggplot(data = midwest, aes(x = total, y = asian )) + 
  geom_point() + xlim(0, 500000) + ylim(0,10000)
ggsave('result3.png')

# Q.4
library(dplyr)

filter_mpg =mpg %>% 
  filter(class == 'compact' |class ==  'subcompact'|class == 'suv')

ggplot(data = filter_mpg, aes(x = class, y =cty)) + geom_boxplot()
ggsave('result4.png')

# Q.5
click_log = read.table('C:/Rstudy/product_click.log')
ggplot(data = click_log, aes(x = V2)) + geom_bar(aes(fill=V2))
ggsave('result5.png')

# Q.6

click_log = click_log %>%
  mutate('day' = weekdays(strptime(click_log$V1,"%Y%m%d%H%M")) )

ggplot(data = click_log, aes(x = day)) + 
  geom_bar(aes(fill=day)) +labs( x = '요일', y = '출력수') +
  theme_linedraw()

ggsave('result6.png')






