library(ggplot2)
#1
mpg
ggplot(mpg,aes(x=cty,y=hwy))+geom_point(col= 'blue')


ggsave('result1.png')



#2
ggplot(mpg, aes(x=class,fill=drv))+geom_bar()

ggsave('result2.png')



#3
midwest<-data.frame(midwest)

ggplot(midwest,aes(x=poptotal,y=popasian,options(scipen = 99)))+geom_point()+
        coord_cartesian(xlim=c(0,500000),ylim=c(0,10000))



ggsave('result3.png')


#4

library(dplyr)
data(mpg)
mpg2<-mpg %>% filter(class==c('compact','subcompact','suv')) 
str(mpg2)
ggplot(mpg2,aes(x=class,y=cty)) + 
        geom_boxplot() + 
        coord_cartesian(ylim=c(10,35))

mean(mpg2$cty[mpg2$class == 'compact'])

ggsave('result4.png')




#5.
product<-read.table('data/product_click.log',
                    col.names = c('ord','kind'))
str(product)

table(product$kind)

ggplot(product,aes(x=kind)) + geom_bar(aes(fill=factor(product$kind)))


ggsave('result5.png')




#6
product

time <- strptime(product$ord, format = '%Y%m%d%H%M')
days<-format(time, "%A")

table(days)



ggplot(product, aes(x=days, fill=days))+geom_bar()

ggsave('result6.png')
