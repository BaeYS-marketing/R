mpg <- as.data.frame(ggplot2::mpg)
midwest <- as.data.frame(ggplot2::midwest)
log <- read.table("product_click.log")

# 문제 1
ggplot(mpg, aes(cty, hwy)) + geom_point(color = "blue") + ggsave("result1.png")

# 문제 2
ggplot(mpg, aes(class, fill = drv)) + geom_bar() + ggsave("result2.png")

# 문제 3
options(scipen = 99)
ggplot(midwest, aes(poptotal, popasian)) + geom_point() + xlim(0, 500000) + ylim(0, 10000) + ggsave("result3.png")

# 문제 4
mpg2 <- mpg %>% filter(class == "compact" | class == "subcompact" |class == "suv")
ggplot(mpg2, aes(class, cty)) + geom_boxplot() + ggsave("result4.png")

# 문제 5
log2 <- log %>% group_by(V2) %>% summarise(click_total = n())
ggplot(log2, aes(V2, click_total)) + geom_bar(stat="identity", aes(fill = V2)) + ggsave("result5.png")

# 문제 6
time <- strptime(log$V1, "%Y%m%d%H%M")
day <- format(time, "%A")
log3 <- cbind(log, day)
log3 <- log3 %>% group_by(day) %>% summarise(c_c = n())
ggplot(log3, aes(day, c_c)) + geom_bar(stat = "identity", aes(fill=day)) + labs(x = "요일", y = "클릭수") + ylim(0, 200) + theme_light() + ggsave("result6.png")
