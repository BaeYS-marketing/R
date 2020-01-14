# Q.1
# 1-1
mpg = mpg %>% as.data.frame
# 1-2
head(mpg,10)
# 1-3
tail(mpg,10)
# 1-4
View(mpg)
# 1-5
summary(mpg)
# 1-6
str(mpg)

# Q.2
# 2-1
mpg2 = mpg %>% 
  rename(city = cty, highway = hwy)

# Q.3
# 3-1
midwest %>% data.frame(midwest)
str(midwest)

# 3-2
midwest = midwest %>% 
  rename(total = poptotal, asian = popasian)
head(midwest)

# 3-3
midwest = midwest %>% 
  mutate(ratio = (asian/total)*100)
View(midwest)

# 3-4
midwest = midwest %>% 
  mutate(test = ifelse(ratio>mean(ratio),'large','small'))

# Q.4
# 4-1
mpg %>% 
  mutate(divide = ifelse(displ >=5, 'up', (ifelse(displ <=4, 'down',NA )))) %>% 
  group_by(divide) %>% 
  summarise(mean_hwy = mean(hwy))

# 4-2
mpg %>% 
  filter(manufacturer == 'audi' | manufacturer == 'toyota') %>% 
  group_by(manufacturer) %>% 
  summarise(mean_cty = mean(cty))


# 4-3
mpg %>% 
  filter(manufacturer == 'chevrolet' | manufacturer == 'ford' |
           manufacturer == 'honda') %>% 
  group_by(manufacturer) %>% 
  summarise(mean_hwy = mean(hwy))

# Q.5
new_mpg = mpg %>% 
          select(class, cty)
new_mpg %>% 
  filter(class == 'suv' | class == 'compact') %>% 
  group_by(class) %>% 
  summarise(mean_cty = mean(cty))

# Q.6
# 6-1
mpg_audi = mpg %>% 
          filter(manufacturer == 'audi') %>% 
          arrange(desc(hwy))
  
# 6-2
head(mpg_audi,5)









