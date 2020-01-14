library(ggplot2)
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
View(mpg)
#1-5
summary(mpg)
#1-6
str(mpg)

#2
mpg_new1 <- rename(mpg, city=cty, highway=hwy)
head(mpg_new1)

#3-1
midwest <- as.data.frame(ggplot2::midwest)
str(midwest)
#3-2
midwest <- rename(midwest, total=poptotal, asian=popasian)
#3-3
midwest <- midwest %>% mutate(pct=asian/total*100)
midwest <- midwest %>% mutate(pct=round(asian/total*100, 2))
#3-4
midwest <- midwest %>% mutate(result=ifelse(pct>mean(pct), "large", "small"))

#4-1
head(mpg)
mpg <- mpg %>% mutate(displno=ifelse(displ<=4, "4이하",ifelse(displ>=5, "5이상", "")))
head(mpg, 20)
mpg %>% group_by(displno) %>% summarise(mean_hwy=mean(hwy)) %>% filter(displno!="")
#4-2
mpg %>% filter(manufacturer=="audi" | manufacturer=="toyota") %>% group_by(manufacturer) %>% summarise(mean_cty=mean(cty))
#4-3
mpg %>% filter(manufacturer=="chevrolet" | manufacturer=="ford" | manufacturer=="honda") %>% summarise(mean_hwy=mean(hwy))

#5-1
mpg_new2 <- mpg %>% select(class, cty)
head(mpg_new2)
#5-2
mpg_new2 %>% filter(class=="suv" | class=="compact") %>% group_by(class) %>% summarise(mean_cty=mean(cty))

#6-1
mpg %>% filter(manufacturer=="audi") %>% arrange(desc(hwy)) %>% head(5)