#7
mpg = as.data.frame(ggplot2::mpg)
#7-1
mpg=mpg %>% mutate(cty_hwy = cty+hwy)
#7-2
mpg=mpg %>% mutate(mean_fuel = cty_hwy/2)
#7-3
mpg %>% arrange(mean_fuel) %>% head(3)
#7-4
as.data.frame(ggplot2::mpg) %>% 
  mutate(cty_hwy = cty+hwy) %>% 
  mutate(mean_fuel = cty_hwy/2) %>% 
  arrange(mean_fuel) %>% head(3)
ew(mpg)
#8
#8-1
as.data.frame(ggplot2::mpg) %>% 
  group_by(class) %>% summarise(mean(cty))
#8-2
as.data.frame(ggplot2::mpg) %>% 
  group_by(class) %>% summarise(mean_cty=mean(cty)) %>% 
  arrange(desc(mean_cty))
#8-3
as.data.frame(ggplot2::mpg) %>% 
  group_by(manufacturer) %>% summarise(mean_hwy=mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>% head(3)
#8-4
as.data.frame(ggplot2::mpg) %>% 
  group_by(manufacturer) %>% filter(class=='compact') %>% 
  summarise(class_compact=n()) %>% arrange(desc(class_compact))
#9
fuel=data.frame(fl = c("c","d","e","p","r"),
                price_fl =c(2.35,2.38,2.11,2.76,2.22),
                stringsAsFactors = F)
fuel
#9-1
mpg_fl = left_join(as.data.frame(ggplot2::mpg),fuel,by="fl")
#9-2
head(mpg_fl,5)
#10
ggplot2::midwest
#10-1
as.data.frame(ggplot2::midwest) %>% 
  mutate(young_per_totals=(poptotal-popadults)/poptotal)
#10-2
as.data.frame(ggplot2::midwest) %>% 
  mutate(young_per_totals=(poptotal-popadults)/poptotal) %>%
  arrange(desc(young_per_totals)) %>% select(county,young_per_totals) %>% 
  head(5)
#10-3
as.data.frame(ggplot2::midwest) %>% 
  mutate(young_per_totals=(poptotal-popadults)/poptotal) %>%
  mutate(young_grade=if_else(young_per_totals>=0.4,
                             "large",if_else(young_per_totals>=0.3,
                                             "middle","small"))) %>% 
 group_by(young_grade) %>% summarise(n=n())
#10-4
as.data.frame(ggplot2::midwest) %>% 
  mutate(asian_per_totals=popasian/poptotal*100) %>%
  select(state,county,asian_per_totals) %>% 
  arrange(asian_per_totals) %>% head(10)
#11
mpg=as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212), "hwy"]=NA
#11-1
table(is.na(mpg$drv))
table(is.na(mpg$hwy))
#11-2
mpg %>% filter(!is.na(hwy)) %>% group_by(drv) %>% summarise(mean_hwy=mean(hwy))
#12
mpg=as.data.frame(ggplot2::mpg)
mpg[c(10,14,58,93), "drv"]="k"
mpg[c(29,43,129,203), "cty"]=c(3,4,39,42)
#12-1
table(mpg$drv)
mpg=mpg %>% filter(drv %in% c(4,"f","r"))
table(mpg$drv)
#12-2
box=boxplot(mpg$cty)
boxplot(mpg$cty)$stat
mpg$cty = ifelse(mpg$cty>26|mpg$cty<9,NA,mpg$cty)
boxplot(mpg$cty)
#12-3
mpg %>% filter(!is.na(drv) & !is.na(cty)) %>%
  group_by(drv) %>%
  summarise(cty_mean = mean(cty))