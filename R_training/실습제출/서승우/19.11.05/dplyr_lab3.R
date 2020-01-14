#7
  #7-1
mpg_1<-mpg %>% mutate(sum_y=hwy+cty)
  #7-2
mpg_1<-mpg_1 %>% mutate(avg_y=sum_y/2)
  #7-3
mpg_1 %>% arrange(desc(avg_y)) %>% 
  head(3)
  #7-4
mpg %>% mutate(sum_y=hwy+cty, avg_y=sum_y/2) %>% 
  arrange(desc(avg_y)) %>% 
  head(3)

#8
  #8-1
mpg %>% group_by(class) %>% 
  summarise(mean_cty=mean(cty))
  #8-2
mpg %>% group_by(class) %>% 
  summarise(mean_cty=mean(cty)) %>% 
  arrange(desc(mean_cty))
  #8-3
mpg %>% select(manufacturer, hwy) %>% 
  group_by(manufacturer) %>% 
  summarise(mean_hwy=mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>% 
  head(3)
  #8-4
mpg %>% filter(class=='compact') %>% 
  group_by(manufacturer) %>% 
  summarise(num=n()) %>% 
  arrange(desc(num))

#9
fuel1<-data.frame(fl=c('c','d','e','p','r'),
                  price_fl=c(2.35,2.38,2.11,2.76,2.22),
                  stringsAsFactors=F)
fuel1
  #9-1
mpg<-left_join(mpg,fuel1,by='fl')
  #9-2
mpg %>% select(model,fl,price_fl) %>% 
  head(5)

#10
midwest<-as.data.frame(ggplot2::midwest)
  #10-1
midwest<-midwest %>% 
  mutate(per_nonad=(poptotal-popadults)/poptotal*100)
  #10-2
midwest %>% select(county,per_nonad) %>% 
  arrange(desc(per_nonad)) %>% 
  head(5)
  #10-3
midwest<-midwest %>% mutate(grade=ifelse(per_nonad>=40,'large',
                                         ifelse(per_nonad>=30, 'middle','small')))
midwest %>% group_by(grade) %>% 
  summarise(grade_num=n())
  #10-4
midwest<-midwest %>% mutate(per_asian=popasian/poptotal*100)
midwest %>% select(state,county, per_asian) %>% 
  tail(10)

#11
mpg<-as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212), 'hwy']<-NA
  #11-1
table(is.na(mpg$drv))
table(is.na(mpg$hwy))
  #11-2
mpg %>% select(drv,hwy) %>% 
  group_by(drv) %>% 
  filter(hwy!='NA') %>% 
  summarise(mean_hwy=mean(hwy))

#12
mpg<-as.data.frame(ggplot2::mpg)
mpg[c(10,14,58,93), 'drv']<-'k'
mpg[c(29,43,129,203), 'cty']<-c(3,4,39,42)
  #12-1
table(mpg$drv)
mpg$drv<-ifelse(mpg$drv %in% c('k'), NA, mpg$drv)
  #12-2
boxplot(mpg$cty)$stats
mpg$cty<-ifelse(mpg$cty>26 | mpg$cty<9, NA, mpg$cty)
boxplot(mpg$cty)
  #12-3
mpg %>% select(drv,cty) %>%
  group_by(drv) %>% 
  filter(!is.na(drv) & !is.na(cty)) %>% 
  summarise(mean_cty=mean(cty))