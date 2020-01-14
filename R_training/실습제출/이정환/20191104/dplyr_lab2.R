# 1-1
mpg = as.data.frame(ggplot2::mpg)
mpg %>% dim()
# 1-2
mpg %>% head(10)
# 1-3
mpg %>% tail(10)
# 1-4
mpg %>% View()
# 1-5
mpg %>% summary()
# 1-6
mpg %>% str()

# 2-1
mpg = mpg %>% rename(city = cty, highway = hwy)
# 2-2
mpg %>% head()

# 3-1
midwest = as.data.frame(ggplot2::midwest)
midwest %>% str()
# 3-2
midwest = midwest %>% rename(total = poptotal, asian = popasian)
# 3-3
midwest = midwest %>% mutate(asian_ratio = asian / total)
# 3-4
ma = mean(midwest$asian_ratio)
midwest = midwest %>% mutate(asian_mean = ifelse(asian_ratio > ma, "large", "small"))

# 4-1
mpg = as.data.frame(ggplot2::mpg)
mpg %>% filter(displ <= 4) %>% summarise(mean(hwy))
mpg %>% filter(displ >= 5) %>% summarise(mean(hwy))
 # 배기량 4이하가 더 높다
# 4-2
mpg %>% filter(manufacturer == "audi") %>% summarise(mean(cty))
mpg %>% filter(manufacturer == "toyota") %>% summarise(mean(cty))
 # 도요타가 더 높다
# 4-3
mpg %>% filter((manufacturer == "chevrolet") | (manufacturer == "ford") | (manufacturer == "honda")) %>%
  summarise(mean(hwy))

# 5-1
new_mpg = mpg %>% select(class, cty)
new_mpg %>% head()
# 5-2
new_mpg %>% filter(class == "suv") %>% summarise(mean(cty))
new_mpg %>% filter(class == "compact") %>% summarise(mean(cty))
 # compact가 더 높다

# 6-1
mpg %>% filter(manufacturer == "audi") %>% arrange(desc(hwy)) %>% head(5)
