mpg <- as.data.frame(ggplot2::mpg)
#1
ggplot(data = mpg, aes(x = cty, y = hwy)) + geom_point(colour="blue")
#2
ggplot(mpg, aes(x=class)) + geom_bar(aes(fill=factor(drv)), alpha=1.0)
#3
midwest <- as.data.frame(ggplot2::midwest)   
options(scipen = 99) 
ggplot(data = midwest, aes(x = poptotal, y = popasian)) +   geom_point() +  xlim(0, 500000) +  ylim(0, 10000)
#4
library(dplyr)
a<-mpg %>% filter(class=="compact"|class=="subcompact"|class=="suv")
ggplot(data = a, aes(x = class, y = cty)) + geom_boxplot()
#5
click<-read.table('C:/Rstudy/문서/11월6일/product_click.log')
ggplot(click, aes(x=V2)) + geom_bar(aes(fill=V2))

#6
as.character(click$V1)
b<-strptime(click$V1,"%Y%m%d%H%M")
c<-as.data.frame(format(b,"%A"))
ggplot(c, aes(x=c[,1])) + geom_bar(aes(fill=c[,1]))+labs(x="요일")+theme_linedraw()
