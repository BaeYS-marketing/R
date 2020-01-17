install.packages("reshape2")
library(reshape2)
data(french_fries)
head(french_fries)
# time : 몇 주차 실험인가
# treatment : 사용한 식용유의 종류
# subject : 실험 대상자
# rep : 이 측정이 몇 번째 반복인가
# potato : 감자 맛
# buttery : 버터 맛
# grassy : 풀맛
# rancid : 신맛
# painty : 안 좋은 냄새

# 문제 : buttery 열의 평균, grassy 열의 평균, rancid 의 평균, painty 의 평균을 구하시오.
df<-as.numeric(french_fries)
b<-unlist(french_fries$grassy)
b<-as.numeric(b)
mean(b,na.rm = T)

mean(french_fries$grassy)
a<-as.numeric(french_fries$grassy)
is.numeric(a)
mean(a,na.rm= T)


apply(2,french_fries,mean,na.rm=T)






m <- melt(french_fries, id.vars=1:4)  #1:4까지 열은 바꾸지 않는다. 
head(m)
View(m)

#이렇게 바꾼이유
library(dplyr)
m %>% group_by(variable) %>% summarize(평균=mean(value, na.rm=T))
m2 <- melt(french_fries, id.vars=1:4, na.rm=T)
dim(m2)
dim(m)
m2 %>% group_by(variable) %>% summarize(평균=mean(value))



#멜트된 애들 다시 원래대로 묶기
r <- dcast(m, time+treatment+subject+rep ~ ...)
head(r)


#한번 멜트됐다가 원상복귀하면 행인덱스가 순서가 안맞는다. 초기화화
rownames(r) <- NULL
rownames(french_fries) <-NULL

identical(r, french_fries)

?identical


# 책에 있는 예제들

str(airquality)
dim(airquality)
View(airquality)
names(airquality)

names(airquality) <- tolower(names(airquality))
head(airquality)
names(airquality)

melt_test <- melt(airquality)
dim(melt_test)
melt_test2 <- melt(airquality, id.vars=c("month", "wind"), measure.vars="ozone")
head(melt_test2)
dim(melt_test2)

melt_test3 <- melt(airquality, id.vars=c("month", "wind"))
head(melt_test3)
dim(melt_test3)

aq_melt <- melt(airquality, id.vars=c("month", "day"), na.rm=T)
dim(aq_melt)
aq_dcast <- dcast(aq_melt, month+day ~ variable)
View(airquality); 
View(aq_melt); 
View(aq_dcast); 
dcast(aq_melt, month~variable, mean)