#Q1
ggplot(mpg, aes(x=cty, y=hwy)) + geom_point(color='blue')
ggsave("result1.png")
#Q2
ggplot(mpg, aes(x=class))+ geom_bar(aes(fill=drv))
ggsave("result2.png")
#Q3
midwest<-as.data.frame(ggplot2::midwest)
options(scipen = 99)
ggplot(midwest, aes(x=poptotal, y=popasian)) + geom_point() +xlim(0,500000)+ ylim(0,10000)
ggsave("result3.png")
#Q4
mpg_new1<-mpg %>% filter(class %in% c('compact', 'subcompact', 'suv')) %>%
  select(class, cty)
ggplot(mpg_new1, aes(x=class, y=cty))+geom_boxplot()
ggsave("result4.png")
#Q5
pro_click <- read.table("product_click.log", header=F)
ggplot(pro_click, aes(x=V2, fill=V2))+geom_bar()
ggsave("result5.png")
#Q6
pro_click$V1<-as.character(pro_click$V1)
pro_click$V1<-as.Date(pro_click$V1, '%Y%m%d%H%M')
pro_click$V1<-format(pro_click$V1,'%A')
ggplot(pro_click, aes(x=V1,fill=V1))+ labs(x='요일', y='클릭수')+geom_bar() + 
  coord_cartesian(ylim=c(0, 200))+ theme_light()
ggsave("result6.png")