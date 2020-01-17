library(ggplot2)
#1
mpg
ggplot(mpg,aes(x=cty,y=hwy))+geom_point(col= 'blue')

ggsave('result1.png')


# ggplot(mpg,aes(x=cty,y=hwy,col= 'blue'))+geom_point()






#2
View(mpg)
ggplot(mpg, aes(x=class,fill=drv))+geom_bar()

ggsave('result2.png')




#3
midwest<-data.frame(midwest)

ggplot(midwest,aes(x=poptotal,y=popasian,options(scipen = 99)))+geom_point()+
        coord_cartesian(xlim=c(0,500000),ylim=c(0,10000))

ggsave('result3.png')


'정수로 표현하기 : options(scipen = 99) 실행 후 그래프 생성
지수로 표현하기 : options(scipen = 0) 실행 후 그래프 생성
R 스튜디오 재실행시 옵션 원상 복구됨'




#4
#ggplot(mpg,aes(x=class[class==c('compact','subcompact','suv')],y=cty))+geom_boxplot()
#ggplot(mpg,aes(x=class[mpg$class=='compact'],y=cty))+geom_boxplot()


#방법1  인덱싱    ~ 아직도 인덱싱 이해가 부족하네
'1. 벡더가 아닌 데이터프레임에서 인덱싱
 2. ggplot이해  data에 사용할 데이터를 지정하고, 
    그 선정된 데이터에서_ aes할당은 컬럼 하나를 선택하는 것.'

ggplot(mpg[mpg$class==c('compact','subcompact','suv'),],aes(x=class,y=cty))+geom_boxplot()


#방법2   dplyr 패키지 이용
library(dplyr)
data(mpg)
mpg2<-mpg %>% filter(class==c('compact','subcompact','suv')) 
str(mpg2)

ggplot(mpg2,aes(x=class,y=cty)) + 
        geom_boxplot() + 
        coord_cartesian(ylim=c(10,35))

ggsave('result4.png')


#5.
product<-read.table('data/product_click.log',
                    col.names = c('ord','kind'))
str(product)


# table(product$kind) : 할 필요가 없는게 geom_bar::ggplot에서 자동으로 통계

# ggplot(product,aes(x=kind)) + geom_bar(colour=kind)


ggplot(product,aes(x=kind)) + geom_bar(aes(fill=factor(product$kind)))


ggsave('result5.png')



#6
product
time <- format(product$ord)
t<-as.numeric(time)
# t<-as.Date(t,origin='1970/01/01')
t<-as.Date(t,format='%d%b%y')
weekdays(t)
table(t)       






time <- strptime(product$ord, format = '%Y%m%d%H%M')
days<-format(time, "%A")

table(days)


ggplot(product, aes(x=days))+geom_bar()
ggplot(product, aes(x=days, fill=days))+geom_bar()


ggsave('result6.png')
