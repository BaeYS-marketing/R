# Q.7
# 7-1
mpg_n = mpg %>% 
  mutate(total_y = cty + hwy)

# 7-2
mpg_n = mpg_n %>% 
  mutate(mean_y = total_y/2)

# 7-3
mpg_n %>% 
  arrange(desc(mean_y)) %>% 
  head(3)
# 7-4
mpg %>% 
  mutate(total_y = cty + hwy) %>% 
  mutate(mean_y = total_y/2) %>% 
  arrange(desc(mean_y)) %>% 
  head(3)

# Q.8
# 8-1
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty = mean(cty))

# 8-2
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty))

# 8-3
mpg %>% 
  group_by(manufacturer) %>%
  summarise(mean_hwy = mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>% 
  head(3)

# 8-4
mpg %>% 
  group_by(manufacturer) %>%
  filter(class== 'compact') %>% 
  summarise(num = n()) %>% 
  arrange(num)

# Q.9
fuel = data.frame(fl = c('c','d','e','p','r'),
                  price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
                  stringsAsFactors = F)
fuel
# 9-1
mpg = left_join(mpg,fuel,by = 'fl')

# 9-2
mpg %>% 
  select(model,fl,price_fl)

# Q.10
str(midwest)
# 10-1
midwest_add =midwest %>% 
  mutate(under_patio = (total-popadults)/total*100)

# 10-2
midwest_add %>% 
  select(county,under_patio) %>% 
  arrange(desc(under_patio)) %>% 
  head(5)
# 10-3
midwest_add= midwest_add %>% 
  mutate(grade_add = ifelse(under_patio>=40, 'large',
                    ifelse(under_patio>=30,'middle', 'small')))
# 10-4
midwest_add %>% 
  mutate(asian_patio = asian/total*100) %>% 
  select(state,county,asian_patio) %>% 
  arrange(asian_patio) %>% 
  head(10)

# Q.11
library(tidyverse)
mpg = as.data.frame(mpg)
mpg[c(65,124,131,153,212),'hwy'] = NA
table(is.na(mpg))
# 11-1
table(is.na(mpg$drv))
table(is.na(mpg$hwy))

# 11-2
mpg %>% 
  filter(!is.na(hwy)) %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy)) %>% 
  arrange(desc(mean_hwy))

# Q.12
rm(mpg)
mpg = as.data.frame(mpg)
mpg[c(10,14,58,93),'drv'] = 'k'
mpg[c(29,43,129,203),'cty'] = c(3,4,39,42)
# 12-1

mpg$drv <- ifelse(mpg$drv %in% c("4", "f", "r"), mpg$drv, NA)
table(mpg$drv)

# 12-2
boxplot(mpg$cty)
boxplot(mpg$cty)$stat
mpg$cty = ifelse(mpg$cty > 26 | mpg$cty < 9 , NA, mpg$cty)
boxplot(mpg$cty)

# 12-3
mpg %>% 
  filter(!is.na(cty) & !is.na(drv)) %>% 
  group_by(drv) %>% 
  summarise(mean_cty = mean(cty)) 


































