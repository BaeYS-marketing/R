#문제1
ggplot(ggplot2::mpg, aes(x=cty, y=hwy)) + 
  geom_point(size=2, color="blue")
#문제2
ggplot(ggplot2::mpg, aes(x=class)) + 
  geom_bar(aes(fill=drv), alpha=1)
#문제3
options(scipen = 99)
ggplot(data = ggplot2::midwest, aes(x = poptotal, y = popasian)) + 
  geom_point() +xlim(0, 500000) +ylim(0, 10000)
#문제4
ggplot(data = mpg, aes(x = class, y = cty)) +
  geom_boxplot() + xlim("compact","subcompact","suv")
#문제5
click_sum <- read.table("product_click.log", header=F)
click_c=as.data.frame(table(click_sum$V2))
ggplot(data=click_c, aes(x=Var1, y=Freq)) + 
  geom_bar(aes(fill=Var1), stat="identity") +
  labs(x="v2", y="count", fill="v2") 
#문제6
click_sum$V1=strptime(click_sum$V1, "%Y%m%d%H%M")
click_w=format(click_sum$V1,"%A")
click_w_sum=as.data.frame(table(click_w))
ggplot(data=click_w_sum, aes(x=click_w, y=Freq)) + 
  geom_bar(aes(fill=click_w), stat="identity") + 
  labs(x="요일", y="클릭수", fill="day") + 
  theme_linedraw()