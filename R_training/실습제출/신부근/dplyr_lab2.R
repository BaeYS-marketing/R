install.packages("ggplot2")
str(ggplot2::mpg)
mpg <- as.data.frame(ggplot2::mpg)
library(dplyr)
#1-1
dim(mpg)
#1-2
head(mpg,10)
#1-3
tail(mpg,10)
#1-4
View(mpg)
#1-5
summary(mpg)
#1-6
str(mpg)

#2-1
mpg<-rename(mpg,city=cty,highway=hwy)
#2-2
head(mpg)

#3-1
midwest <- as.data.frame(ggplot2::midwest)
str(midwest)
midwest
#3-2
midwest<-rename(midwest,total=poptotal,asian=popasian)
#3-3
midwest %>% mutate(percent=(asian/total)*100) %>% head
#3-4
midwest %>% mutate(percent=(asian/total)*100) %>% summarise(mean_percent=mean(percent))
midwest %>% mutate(percent=(asian/total)*100,mean_percent=mean(percent),
  test = ifelse(percent > mean_percent, "large", "small"))

#4-1
mpg %>% filter(displ<=4) %>% summarise(mean_hwy=mean(highway))
mpg %>% filter(displ>=5) %>% summarise(mean_hwy=mean(highway))
#4-2
mpg %>% filter(manufacturer=="audi") %>% summarise(mean_cty=mean(city))
mpg %>% filter(manufacturer=="toyota") %>% summarise(mean_cty=mean(city))
#4-3
mpg %>% 
  group_by(manufacturer) %>% summarise(mean_hwy=mean(highway))

#5-1
mpg1<-mpg %>% select(class,city)
mpg1 %>% head

#5-2
mpg1 %>% group_by(class) %>% summarise(mean_cty=mean(city))

#6-1
mpg %>% filter(manufacturer=="honda") %>% arrange(desc(highway))
