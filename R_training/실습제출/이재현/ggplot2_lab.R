#문제 1
mpg <- as.data.frame(ggplot2::mpg)
ggplot(data = mpg, aes(x = cty, y = hwy), ) + geom_point(colour="blue")

#문제 2
mpg
ggplot(data = mpg, aes(x = class)) + geom_bar(aes(fill=drv))

#문제 3
midwest <- as.data.frame(ggplot2::midwest)
options(scipen = 99) 
ggplot(data = midwest, aes(x = poptotal, y = popasian)) + geom_point(colour="black")+xlim(0, 500000) +  ylim(0, 10000)

#문제 4
mpg
mpg <- mpg %>% filter(class%in% c("compact","subcompact","suv"))%>%select(class,cty)
ggplot(data = mpg, aes(x = class, y = cty)) + geom_boxplot()

#문제 5
click <- read.table("product_click.log", header=F)
y <- table(click$V2)
ggplot(click, aes(x = V2,fill=V2)) + geom_bar()

#문제 6
click <- read.table("product_click.log", header=F)
names(click)[1] <- c("day")
click$day <- as.character(click$day)
click$day <- as.Date(click$day, "%Y%m%d%H%M")
click$day <- format(click$day, "%A")

ggplot(click, aes(x = day,fill=day)) + geom_bar() + theme_light() +  ylim(0, 200) + labs(x="요일", y="클릭수")