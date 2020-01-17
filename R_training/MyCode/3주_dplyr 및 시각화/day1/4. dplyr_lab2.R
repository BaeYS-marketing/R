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
library(dplyr)
mpg <- rename(mpg,city = cty)
mpg <- rename(mpg,highway = hwy)


#2-2
head(mpg)



#3-1
library(ggplot2)
midwest <- as.data.frame(midwest)
class(midwest)


#3-2
midwest <- rename(midwest,total=poptotal,asian =popasian)
head(midwest)


#3-3
midwest <- midwest %>% mutate(newAsianPop = (asian/total)*100)



#3-4
mean(midwest$newAsianPop)
midwest %>% mutate(Average = ifelse(newAsianPop>mean(midwest$newAsianPop),'large','small'))



#4-1
data(mpg)
mpg <- as.data.frame(mpg)
str(mpg)
#mpg %>% group_by(displ<4 & displ>=5 ) %>% summarise(mean(hwy))

mpg %>% group_by(displ<4 ) %>% summarise(mean(hwy))




#4-2
mpg %>%  filter(manufacturer == c('audi','toyota')) %>% 
        group_by(manufacturer) %>% 
        summarise(mean(cty))


#4-3
mpg %>% filter(manufacturer==c('chevrolet','ford','honda')) %>% 
        group_by(manufacturer) %>% 
        summarise(mean(hwy))




#5-1
mpg2 <- mpg %>% select(class,cty)
mpg2


#5-2
mpg2 %>% filter(class == c('compact','suv')) %>% 
        group_by(class) %>% 
        summarize(mean(cty))



#6-1
mpg
mpg %>% filter(manufacturer == 'audi') %>% 
        group_by(model) %>% 
        head(5)
