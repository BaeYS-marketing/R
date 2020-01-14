# pre
library(dplyr)
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)

# 1-1
nrow(mpg)
ncol(mpg)

# 1-2
mpg %>% head(10)

# 1-3
mpg %>% tail(10)

# 1-4
View(mpg)

# 1-5
summary(mpg)

# 1-6
str(mpg)



# 2-1
mpg <- mpg %>% rename(city = cty, highway = hwy)

# 2-2
head(mpg)




# 3-1
midwest <- as.data.frame(ggplot2::midwest)
str(midwest)

# 3-2
midwest <- midwest %>% rename(total = poptotal, asian = popasian)

# 3-3
midwest <- midwest %>% mutate(asian_ratio = asian/total*100)

# 3-4
mean <- mean(midwest$asian_ratio)
midwest <- midwest %>% mutate(LS_ratio = ifelse(asian_ratio > mean,"large","small"))





# 4-1
mpg %>% filter(displ>=5 | displ<=4) %>% group_by(model) %>% summarise(avg_hwy = mean(hwy))
mpg %>% mutate(foorfi = ifelse(displ>=5, "5", ifelse(displ<=4, "4", "X"))) %>% filter(foorfi != "X") %>% group_by(foorfi) %>% summarise(avg_hwy = mean(hwy))


# 4-2
mpg %>% filter(manufacturer=="audi"|manufacturer=="toyota") %>%
  group_by(manufacturer) %>%
  summarise(avg_cty = mean(hwy))

# 4-3
mpg %>% filter(manufacturer %in% c("chevrolet","ford","honda")) %>%
  group_by(manufacturer) %>%
  summarise(avg_cty = mean(hwy))




# 5-1
mpg2 <- mpg %>% select(class, cty)
mpg2

# 5-2
mpg2 %>% filter(class %in% c("suv", "compact")) %>% group_by(class) %>% summarise(avg_cty = mean(cty))




# 6-1
mpg %>% filter(manufacturer == "audi") %>% arrange(desc(hwy)) %>% head(5)
