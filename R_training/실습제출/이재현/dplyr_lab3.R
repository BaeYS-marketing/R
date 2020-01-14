#문제 7-1
str(ggplot2::mpg)
mpg_copy <- as.data.frame(ggplot2::mpg)
mpg_copy1 <- mpg_copy %>% mutate("합산연비변수"=cty+hwy)

#문제 7-2
mpg_copy2 <- mpg_copy1 %>% mutate("평균연비변수"=합산연비변수/2)

#문제 7-3
arrange(mpg_copy2, desc(평균연비변수))%>%head(3)

#문제 7-4
mpg %>% mutate("합산연비변수"=cty+hwy, "평균연비변수"=합산연비변수/2) %>%
  arrange(desc(평균연비변수))%>%
  head(3)

#문제 8-1
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty = mean(cty))

#문제 8-2
mpg_3 <- mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty = mean(cty))

arrange(mpg_3,desc(mean_cty))

#문제 8-3
mpg_4 <- mpg %>% 
  group_by(class) %>% 
  summarise(mean_hwy = mean(hwy))

arrange(mpg_4,desc(mean_hwy))%>%head(3)

#문제 8-4
mpg_4 %>% filter(class=="compact") %>%
  group_by(manufacturer) %>%
  summarise(num=n()) %>%
  arrange(desc(num))

#문제 9-1
fuel <- data.frame(fl= c("c","d","e","p","r"),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)

mpg_5 <- left_join(mpg, fuel, by =c("fl"="fl"))

#문제 9-2
arrange(mpg_5,model)%>%head(5)
arrange(mpg_5,fl)%>%head(5)
arrange(mpg_5,price_fl)%>%head(5)

#문제 10-1

midwest <- as.data.frame(ggplot2::midwest)

midking <- midwest %>% mutate("popchild"=(poptotal-popadults)/poptotal*100)


#문제 10-2
midking %>% select(county, popchild) %>% arrange(desc(popchild))%>%head(5)

#문제 10-3
midking <- midking %>% mutate(grade=ifelse(popchild>=40,'large',
                                           ifelse(popchild>=30, 'middle','small')))



#문제 10-4
midasia <- midking %>%mutate(popperasian=popasian/poptotal*100)
midasia %>% select(state, county, popperasian) %>% tail(10)


#문제 11-1
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65, 124, 131, 153, 212), "hwy"] <- NA

table(is.na(mpg$drv))
table(is.na(mpg$hwy))


#문제 11-2
mpg %>% select(drv,hwy) %>%
  group_by(drv) %>%
  filter(hwy!="NA") %>%
  summarise(mean_hway=mean(hwy))


#문제 12-1
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10,14,58,93),"drv"] <- "k"
mpg[c(29,43,159,213),"cty"] <- c(3, 4, 39, 42)

table(mpg$drv)
mpg$drv<-ifelse(mpg$drv %in% c("k"), NA, mpg$drv)

#문제 12-2
boxplot(mpg$cty)$stats
mpg$cty <- ifelse(mpg$cty>26|mpg$cty<9, NA, mpg$cty)
boxplot(mpg$cty)

#문제 12-3
mpg %>% select(drv,cty) %>%
  group_by(drv) %>%
  filter(!is.na(drv)&!is.na(cty)) %>%
  summarise(mean_cty=mean(cty))





