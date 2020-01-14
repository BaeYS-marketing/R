#1.
str(ggplot2::mpg)
mpg = as.data.frame(ggplot2::mpg)
#1-1
nrow(mpg); ncol(mpg)
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
#2
#2-1
mpg = rename(mpg, city = cty)
#2-2
mpg = rename(mpg, highway = hwy)
#3
#3-1
midwest=data.frame(ggplot2::midwest)
#3-2
midwest=rename(midwest, total=poptotal);midwest=rename(midwest, asian=popasian);
#3-3
midwest = midwest %>% mutate(asianPer = asian/total*100)
#3-4
mean_asianPer=midwest %>% select(asianPer)
midwest = midwest %>% 
  mutate(large_small = ifelse(asianPer>mean(mean_asianPer[2,]),"large","small") )
#4
mpg = as.data.frame(ggplot2::mpg)
#4-1
down=mpg %>% filter(displ<=4)
up=mpg %>% filter(displ>=5)
mean(down$hwy)
mean(up$hwy)
#4-2
manu_cty1=mpg %>% filter(manufacturer=='audi')
manu_cty2=mpg %>% filter(manufacturer=='toyota')
mean(manu_cty1$cty)
mean(manu_cty2$cty)
#4-3
mpg %>% filter(manufacturer=='chevrolet'|manufacturer=='ford'|manufacturer=='honda') %>% summarise(mean(hwy))
#5
#5-1
class_cty=mpg %>% select(class,cty)
head(class_cty)
#5-2
class_cty %>% filter(class == 'suv' | class == 'compact') %>% group_by(class) %>% summarise(mean(cty))
#6
#6-1
mpg %>% filter(manufacturer=='audi') %>% group_by(model) %>% summarise(mean(hwy))
#6-2
mpg %>% filter(manufacturer=='audi') %>% arrange(desc(hwy)) %>% head(5)