library(dplyr)
install.packages("ggplot2")
str(ggplot2::mpg)
head(ggplot2::mpg)
mpg <- as.data.frame(ggplot2::mpg)
?mpg

#7-1
mpg %>% 
  mutate(total = hwy + cty) %>% 
  select(total) %>% 
  head()


#7-2
mpg <- mpg %>% 
  mutate(mean = (hwy+cty)/2) %>% 
  head()

#7-3
mpg %>% 
  arrange(desc(mean)) %>% 
  head(3)

#7-4
mpg <- mpg %>%  
  mutate(total = hwy + cty, mean = (hwy+cty)/2) %>% 
  arrange(desc(mean)) %>% 
  head(3)

mpg <- as.data.frame(ggplot2::mpg)

#8-1
mpg %>% 
  group_by(class) %>% 
  summarise(mean = mean(cty))

#8-2
mpg %>% 
  group_by(class) %>% 
  mutate(mean_cty = mean(cty)) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty))

#8-3
mpg %>%
  group_by(class) %>% 
  mutate(mean_hwy = mean(hwy)) %>% 
  summarise(mean_hwy = mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>% 
  head(3)

#8-4
mpg %>% 
  filter(class == "compact") %>% 
  group_by(manufacturer) %>% 
  summarise(n = n()) %>% 
  arrange(desc(n))

mpg <- as.data.frame(ggplot2::mpg)
 
#9-1
fuel <- data.frame(fl = c("c", "d", "e", "p", "r"),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)

mpg <- left_join(mpg, fuel, by = "fl")

#9-2
mpg %>% 
  select(model, fl, price_fl) %>% 
  head(3)

midwest <- as.data.frame(ggplot2::midwest)
?midwest
midwest %>% 
  head(4)

#10-1
midwest <- midwest %>% 
  mutate(adol_pop = ((poptotal - popadults)/poptotal)*100 )

#10-2
midwest %>% 
  arrange(desc(adol_pop)) %>% 
  select(county, adol_pop) %>% 
  head(5)

#10-3
midwest %>% 
  mutate(std = ifelse(adol_pop >= 40, 'large', (ifelse( adol_pop >= 30 & adol_pop <40, 'middle','small' )))) %>% 
  group_by(std) %>% 
  summarise(n = n())

#10-4
midwest %>% 
  mutate(asia_pop = (popasian/poptotal)*100) %>% 
  arrange(asia_pop) %>% 
  select(state, county, asia_pop) %>% 
  head(10) 

mpg <- as.data.frame(ggplot2::mpg)

#11-1
mpg[c(65, 124, 131, 153, 212), "hwy"] <- NA

mpg %>% 
  filter(is.na(drv)) %>% 
  summarise(n = n())
mpg %>% 
  filter(is.na(hwy)) %>% 
  summarise(n = n())

#11-2
mpg %>% 
  filter(!is.na(hwy)) %>% 
  group_by(drv) %>% 
  summarise(mean = mean(hwy))

mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10, 14, 58, 93), "drv"] <- "k"
mpg[c(29, 43, 129, 203), "cty"] <- c(3, 4, 39, 42)

#12-1
table(mpg$drv)
table(mpg$cty)
boxplot(mpg$cty)$stats

mpg$drv <- ifelse(mpg$drv == "k", NA, mpg$drv)
mpg$cty <- ifelse(mpg$cty <9 | mpg$cty >26, NA, mpg$cty)

#12-2
boxplot(mpg$cty)$stats
mpg$cty <- ifelse(mpg$cty <9 | mpg$cty >26, NA, mpg$cty)

mpg <- mpg %>% 
  filter(!is.na(cty)) 
mpg <- mpg %>% 
  filter(!is.na(drv))

boxplot(mpg$cty)

#12-3
mpg %>%
  group_by(drv) %>%
  summarise(mean_cty = mean(cty, na.rm = T))

