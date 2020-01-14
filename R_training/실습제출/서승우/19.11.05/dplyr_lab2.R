#1
str(ggplot2::mpg)
mpg<-as.data.frame(mpg)

  #1-1
dim(mpg)
  #1-2
head(mpg, n=10)
  #1-3
tail(mpg, n=10)
  #1-4
View(mpg)
  #1-5
summary(mpg)
  #1-6
str(mpg)

#2
  #2-1
mpg_new<-rename(mpg, 'city'='cty', 'highway'='hwy')
  #2-2
head(mpg_new)

#3
  #3-1
q3<-data.frame(ggplot2::midwest)
str(q3)
  #3-2
q3<-rename(q3, 'total'='poptotal', 'asian'='popasian')
  #3-3
q3<-q3 %>% mutate(per=asian/total*100)
  #3-4
q3 %>% mutate(
  mean_per=mean(q3$per),
  result=ifelse(per>mean_per,'large','small'))

#4
  #4-1
mpg_1 <- mpg %>% 
  select(displ, hwy) %>% 
  filter(displ<='4') %>% 
  select(hwy) %>% 
  summarise(mean_mpg1=mean(hwy))
mpg_2 <- mpg %>% 
  select(displ, hwy) %>% 
  filter(displ>='5') %>% 
  select(hwy) %>% 
  summarise(mean_mpg2=mean(hwy))

  #4-2
mpg_audi <- mpg %>% 
  filter(manufacturer=='audi') %>% 
  select(cty) %>% 
  summarise(mean_cty_audi=mean(cty))
mpg_toyota <- mpg %>% 
  filter(manufacturer=='toyota') %>% 
  select(cty) %>% 
  summarise(mean_cty_audi=mean(cty))

  #4-3
mpg %>% filter(manufacturer=='chevrolet') %>% 
  select(hwy) %>% 
  summarise(mean_hwy=mean(hwy))
mpg %>% filter(manufacturer=='ford') %>% 
  select(hwy) %>% 
  summarise(mean_hwy=mean(hwy))
mpg %>% filter(manufacturer=='honda') %>% 
  select(hwy) %>% 
  summarise(mean_hwy=mean(hwy))
  
#5
  #5-1
mpg_new1<-mpg %>% select(class, cty)
  #5-2
mpg_new1 %>% filter(class=='suv') %>% 
  summarise(mean_suv=mean(cty))
mpg_new1 %>% filter(class=='compact') %>% 
  summarise(mean_compact=mean(cty))

#6
mpg %>% filter(manufacturer=='audi') %>% 
  select(model, hwy) %>% 
  arrange(desc(hwy)) %>% 
  head(5)