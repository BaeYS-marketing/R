install.packages("ggplot2")
library(ggplot2)
library(dplyr)

#1
mpg <- as.data.frame(ggplot2::mpg)
ggplot(data = mpg, aes(x = cty, y = hwy)) + geom_point(size=2, color="blue")

#2
table(mpg$class)
ggplot(data = mpg, aes(x = class, fill=drv)) + geom_bar()

#3
options(scipen = 99)
ggplot(data = midwest, aes(x = poptotal, y = popasian))+xlim(0,500000)+ ylim(0,10000) + geom_point()

#4
ggplot(data=mpg, aes(x = class, y = cty)) + geom_boxplot()+ xlim("compact","subcompact","suv")

#5
click <- read.table("c:/Rstudy/product_click.log")
dtc = as.data.frame(table(click$V2))
dtc = rename(dtc, V2=Var1, count=Freq)
ggplot(data=dtc, aes(x = V2, y=count))+  geom_bar(aes(fill=V2), stat="identity")

#6
st = strptime(click$V1, "%Y%m%d%H%M")
fm = format(st, "%A")
aaa = as.data.frame(table(fm))
View(aaa)
ggplot(data=aaa, aes(x = fm, y=Freq))+  geom_bar(aes(fill=fm), stat="identity")+ylim(0,200)+ theme_linedraw()+labs(x="요일", y="클릭수", fill="day")

