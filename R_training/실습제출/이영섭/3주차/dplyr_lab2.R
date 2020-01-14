#문제 1
library(ggplot2)
str(ggplot2::mpg)
mpg <- as.data.frame(ggplot2::mpg)

nrow(mpg)
ncol(mpg)
head(mpg,10)
tail(mpg,10)
View(mpg)
summary(mpg)
str(mpg)

#문제 2
#2-1
mpg <- rename(mpg,city=cty,highway=hwy)

#2-2
head(mpg)

#문제 3
#3-1
new_midwest <-data.frame(midwest)
str(new_midwest)

#3-2
new_midwest <- rename(new_midwest,total=poptotal,asian=popasian)
head(new_midwest)

#3-3
new_midwest <- new_midwest %>% mutate("asian/total"= asian/total)

#3-4
x <- mean(new_midwest$`asian/total`)
new_midwest <- new_midwest %>% mutate(ifelse(`asian/total` >x,"large", "small"))

#문제 4
#4-1
displ_4 <- filter(mpg,displ<=4)
displ_5 <- filter(mpg,displ>=5)
mean(displ_4$highway) 
mean(displ_5$highway)
# 4 이하가 더 높음

#4-2
mpg %>% filter(manufacturer=="audi" | manufacturer=="toyota") %>%  group_by(manufacturer) %>% summarise(mean(city))
# 도요타가 더 높음

#4-3
mpg %>% filter(manufacturer=="chevrolet" |manufacturer=="ford" |manufacturer=="honda") %>% summarise(mean(highway))

#문제 5
#5-1
data <- mpg %>% select(class,city)
head(data)

#5-2
data %>% filter(class=="suv" | class=="compact") %>% group_by(class) %>% summarise(mean(city))
# compact가 더 좋음

#문제 6
#6-1
mpg %>% filter(manufacturer=="audi") %>% arrange(desc(highway)) %>%  head(5)
