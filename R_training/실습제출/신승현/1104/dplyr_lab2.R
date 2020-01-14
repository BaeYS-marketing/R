#문제1
install.packages("ggplot2")
str(ggplot2::mpg)
mpg <- as.data.frame(ggplot2::mpg)


#1-1
nrow(mpg)
ncol(mpg)
#1-2
head(mpg, 10)
#1-3
tail(mpg, 10)
#1-4
view(mpg)
#1-5
summary(mpg)
#1-6
str(mpg)

#문제 2
mpg <- rename(mpg, city=cty, highway=hwy)
mpg

#3-1
midwest <- as.data.frame(ggplot2::midwest)
midwest
str(midwest)
summary(midwest)

#3-2
midwest <- rename(midwest, total=poptotal, asian=popasian)
midwest

#3-3
mpg %>% mutate()

#3-4
midwest = midwest %>% mutate(LS = ifelse(asian_ratio > mean(asian_ratio), "large", "small"))
midwest$LS


#문제4
#4-1
mpg %>% filter(displ<=4 & displ>=5) %>% arrange(desc(mean(highway))) %>% head(1)
#4-2



#문제5
#5-1
a <- mpg %>%
    select(class, city)
#5-2

#문제6
mpg %>% filter(manufacturer == "audi") %>% arrange(desc(highway)) %>% head(5)


