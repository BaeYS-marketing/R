install.packages("ggplot2")
str(ggplot2::mpg)
mpg <- as.data.frame(ggplot2::mpg)
install.packages("dplyr")
library(dplyr)

# 1-1
nrow(mpg); ncol(mpg)

# 1-2
head(mpg,10)

# 1-3
tail(mpg,10)

# 1-4
View(mpg)

#1-5
summary(mpg)

# 1-6
str(mpg)

# 2
mpg <- rename(mpg, city=cty)
mpg <- rename(mpg, highway=hwy)
mpg %>% head

# 3-1
str(ggplot2::midwest)
midwest <- as.data.frame(ggplot2::midwest)
midwest

# 3-2
midwest <- rename(midwest, total=poptotal)
midwest <- rename(midwest, asian=popasian)
midwest

# 3-3
midwest <-midwest %>% mutate(percent=asian/total*100)

# 3-4 
midwest <- midwest %>% mutate(percent_size
                   =ifelse(mean(midwest$percent) < midwest$percent, 
                           "large", "small"))
# 4-1 
mpg
mpg %>% filter(displ<=4 | displ>=5) %>% 
  group_by(model) %>% 
  summarise(mean_hwy=mean(hwy)) %>% 
  arrange(desc(mean_hwy))

# 4-2 
mpg %>% filter(manufacturer %in% c("audi","toyota"))%>%
  group_by(manufacturer) %>%
  summarise(m_cty=mean(cty)) %>%
  arrange(desc(m_cty)) %>%
  head(1)

# 4-3
mpg %>% filter(manufacturer %in% c("chevrolet","ford","honda"))%>%
  summarise(m_hwy=mean(hwy))

# 5-1
mpg_new <- mpg %>% select(class,cty)
mpg_new

# 5-2
mpg_new %>% filter(class %in% c("suv","compact")) %>%
  group_by(class) %>% 
  arrange(desc(cty))

# 6-1 
mpg %>% filter(manufacturer=="audi") %>%
  arrange(desc(hwy)) %>%
  head(5)





