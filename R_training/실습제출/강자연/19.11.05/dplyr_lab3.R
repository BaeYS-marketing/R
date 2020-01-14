library(dplyr)
library(ggplot2)
library(reshape)


#7-1
mpg <- as.data.frame(ggplot2::mpg)
mpgc<-mpg
mpgc%>%
  mutate(sum=hwy+cty)

#7-2

mpgc%>%
  mutate(meanhc=sum/2)

#7-3
mpgc%>%
  arrange(meanhc)%>%
  tail(3)
#7-4
mpg=mpg <- as.data.frame(ggplot2::mpg)
mpg%>%
  mutate(sum=hwy+cty)%>%
  mutate(meanhc=sum/2)%>%
  arrange(meanhc)%>%
  tail(3)


#8-1,2
mpg=mpg%>%
  group_by(class)%>%
  summarise(mean_cty = mean(cty))%>%
  arrange(desc(mean_cty))
  
#8-3
mpg=mpg%>%
  group_by(manufacturer)%>%
  summarise(mean_hwy = mean(hwy))%>%
  arrange(desc(mean_hwy))
  head(3)

#8-4
mpg= mpg%>%
    group_by(manufacturer)%>%
    filter(model=="compact")%>%
    summarise(n=n())%>%
    arrange(desc(n))


View(mpg)




#9-1
a=data.frame(fl=c('c','d','e','p','r'),
                 fl_price=c(2.35,2.38,2.11,2.76,2.22),stringsAsFactors = F)
fuel=a


#9-2

mpg_new <- left_join(mpg, fuel, by = "fl") 
mpg_new%>%
  select(model,fl,fl_price)%>%
  head()


#10-1,2
midwest <- as.data.frame(ggplot2::midwest)
View(midwest)
midwest%>%
  mutate(per=100-(popadults/poptotal*100))%>%
  arrange(per)%>%
  tail(5)


#10-3
midwest=midwest%>%
  mutate(test = ifelse( per>=40, "large", 
                        ifelse( per>=30, "middle", "small")))%>%
  group_by(test)%>%
  summarise(n=n())

#10-4
midwest=midwest%>%
  mutate(per2=asian/total*100)%>%
  select(state,country,per2)


#11-1
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65,24,131,153,212),'hwy']<-NA
mpg$hwy
table(is.na(mpg$drv))    # sex 결측치 빈도 출력
table(is.na(mpg$hwy))
#11-2
mpg%>%
  filter(!is.na(hwy))
  group_by(drv)%>%
  summarise(mean_hwy = mean(hwy))%>%
  arrange(desc(mean_hwy))%>% head(3)



#12-1
  mpg <- as.data.frame(ggplot2::mpg)
  mpg[c(10,14,58,93),'drv']<-"k"
  mpg[c(29,43,129,203),'cty']<-c(3,4,129,203)
  table(mpg$drv)
  mpg$drv <- ifelse( mpg$drv == "k", NA,  mpg$drv)
  table(mpg$drv)
#12-2
  table(mpg$cty)
  boxplot(mpg$cty)$stats
  mpg$cty <- ifelse( mpg$cty<=5|mpg$cty>=28, NA,  mpg$cty)
  boxplot(mpg$cty)$stats
  
#12-3
  mpg %>%
    filter(!is.na(drv) & !is.na(cty)) %>%
    group_by(drv) %>%
    summarise(mean_cty = mean(cty))
 







