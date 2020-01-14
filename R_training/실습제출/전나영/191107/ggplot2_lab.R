# 문제1
install.packages("ggplot2")
install.packages("dplyr")
library(ggplot2)
library(dplyr)

ggplot(mpg, aes(x = cty, y = hwy)) + geom_point(color="blue")
ggsave("result1.png")


# 문제2
ggplot(mpg, aes(x=class)) + geom_bar(aes(fill=drv), alpha=1.0)
ggsave("result2.png")


# 문제3
options(scipen = 99)
ggplot(midwest, aes(x = poptotal, y = popasian)) + geom_point() + xlim(0, 500000) + ylim(0, 10000)
ggsave("result3.png")


# 문제4
class_css <- mpg %>%
  filter(class == "compact" | class == "subcompact" | class == "suv") %>%
  select(class, cty)
ggplot(class_css, aes(x = class, y = cty)) + geom_boxplot()
ggsave("result4.png")


# 문제5
product_click <- read.table("data/product_click.log")
V2 <- product_click$V2
ggplot(product_click, aes(x = V2)) + geom_bar(aes(fill = V2))
ggsave("result5.png")


# 문제6
V1 <- as.character(product_click$V1)
V1 <- as.Date(V1, '%Y%m%d')
day <- weekdays(V1)
table(day)
countDay <- data.frame(table(day))
ggplot(countDay, aes(x = day, y = countDay$Freq)) + geom_bar(stat="identity", aes(fill = day)) +
  ylim(0, 200) + labs(x="요일", y="클릭수") + theme_bw()
ggsave("result6.png")
