# install.packages("ggplot2")\
library(dplyr)
library(ggplot2)
library(reshape)
str(ggplot2::mpg)
mpg <- as.data.frame(ggplot2::mpg)
View(mpg)
#1-1 mpg 의 행의 개수와 열의 개수를 출력한다.

# 1-2 mpg의 데이터를 앞에서 10개 출력한다.
mpg%>%
  head(10)
# 1-3 mpg의 데이터를 뒤에서 10개 출력한다.
mpg%>%
  tail(10)
# 1-4. mpg의 데이터를 GUI 환경으로 출력한다.
View(mpg)
# 1-5 mpg를 열 단위로 요약한다.
summary.data.frame(mpg)
# 1-6 mpg의 구조를 확인한다.
str(mpg)
#2-1
mpg=rename(mpg,c(sty='city',hwy='highway'))
#2-2
mpg%>%
  head(10)

#3-1
midwest <- as.data.frame(ggplot2::midwest)
str(midwest)
#3-2
midwest=rename(midwest,c(poptotal='total',popasian='asian'))
View(midwest)

#3-3. total, asian 변수를 이용해 '전체 인구 대비 아시아 인구 백분율' 파생변수를 만들어 보세요
midwest=midwest%>%
   mutate(per=asian/total*100)



#3-4. 아시아 인구 백분율 전체 평균을 구하고, 평균을 초과하면 "large", 그 외에는 "small"을 부여하는 파생변수를 만들어 보세요.

a<-mean(midwest$per)
midwest%>%
   mutate(test = ifelse( per>=a, "large", "small")) 





#4-1
mpg <- as.data.frame(ggplot2::mpg)
mpg%>%
  filter(displ>=5)%>%
  summarise(mean1=mean(hwy))

mpg%>%
  filter(displ<4)%>%
  summarise(mean1=mean(hwy))


#4-2
mpg <- as.data.frame(ggplot2::mpg)
mpg%>%
  filter(manufacturer=='audi')%>%
  summarise(mean3==mean(cty))

mpg%>%
  filter(manufacturer=='toyota')%>%
  summarise(mean4=mean(cty))


#4-3
mpg <- as.data.frame(ggplot2::mpg)
mpg%>%
  filter(manufacturer=='chevrolet' |class=='honda'|class=='ford')%>%
  summarise(mean5=mean(hwy))



#5-1
mpg <- as.data.frame(ggplot2::mpg)
mpg%>%
  select(class,cty)


#5-2 
mpg%>%
  select(class,cty)%>%
  filter(class=='suv' |class=='compact')%>%
  group_by(class)%>%
  summarise(mean_cty=mean(cty))

 
 #6-1
mpg%>%
  filter(manufacturer=='audi')%>%
  arrange(hwy)%>%
  tail(5)
 
 
 
 
 
 