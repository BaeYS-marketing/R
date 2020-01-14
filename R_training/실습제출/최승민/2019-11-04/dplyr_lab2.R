install.packages("dplyr")
library(dplyr)
install.packages("ggplot2")
str(ggplot2::mpg)
head(ggplot2::mpg)
mpg <- as.data.frame(ggplot2::mpg)

?mpg  

#1-1 
dim(mpg)
mpg %>%  nrow()
mpg %>%  ncol()
  
#1-2
mpg %>%  head(10)

#1-3
mpg %>%  tail(10)

#1-4 
View(mpg)

#1-5
summary(mpg)

#1-6
str(mpg)

#2-1
mpg <- rename(mpg, city = cty, highway = hwy)

#2-2
mpg %>%  head

#3-1
midwest <- as.data.frame(ggplot2::midwest)
?midwest
str(midwest)
#3-2
midwest <- rename(midwest, total = poptotal, asian = popasian)
#3-3
midwest <- midwest %>% 
  mutate( per = (asian / total) * 100  )
#3-4
midwest %>% 
  mutate(per_mean = mean(per),
         size = ifelse(per > per_mean , "large", "small"))

#4-1
mpg %>%  
  mutate(std = ifelse(displ >=5, 'up', (ifelse(displ <=4, 'down',NA )))) %>% 
  group_by(std) %>% 
  summarise(mean_hwy = mean(highway))

displ_4 <- filter(mpg, displ <= 4)

?mpg
#4-2
mpg %>%  
  filter(manufacturer == "audi" | manufacturer == "toyota" ) %>%   
  group_by(manufacturer) %>% 
  summarise(mean_cty = mean(city))

#4-3
mpg %>%  
  filter(manufacturer == "ford" | manufacturer == "honda" | manufacturer == "chevrolet" ) %>%   
  mutate(hwy_mean = mean(highway))

#5-1
mpg <- mpg %>% 
  select(class, city) %>% 
  head


#5-2
mpg %>% 
  filter(class == "suv" | class == "compact") %>% 
  group_by(class) %>% 
  summarise(mean_city = mean(city))

#6-1 
mpg %>% 
  filter(manufacturer == "audi") %>% 
  select(model, highway) %>% 
  arrange(desc(highway)) %>% 
  head(5)

  