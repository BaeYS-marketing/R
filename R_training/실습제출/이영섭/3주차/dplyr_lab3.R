library(dplyr)
library(ggplot2)

#7-1
mpg_d <- mpg %>% mutate(sum_y = hwy + cty)
View(mpg_d)

#7-2
mpg_d <- mpg_d %>% mutate(aver_y = sum_y/2)

#7-3
mpg_d %>% arrange(desc(aver_y)) %>% head(3)

#7-4
mpg %>% mutate(sum_y = hwy + cty, aver_y = sum_y/2) %>% 
        arrange(desc(aver_y)) %>%  head(3)

#8-1
mpg %>% group_by(class) %>% summarise(mean(cty))

#8-2
mpg %>% group_by(class) %>% summarise(mean(cty)) %>% arrange(desc(`mean(cty)`)) 

#8-3
mpg %>% group_by(manufacturer) %>% summarise(mean(hwy)) %>% arrange(desc(`mean(hwy)`)) %>% head(3)

#8-4
mpg %>% group_by(manufacturer) %>% filter(class== "compact") %>% summarise(n())

#9-1
fuel <- data.frame(fl = c("c","d","e","p","r"),
                   price_fl = c(2.35,2.38,2.11,2.76,2.22),
                   stringsAsFactors = F)
fuel

mpg <- left_join(mpg, fuel, by="fl")

#9-2
mpg %>% select(model,fl,price_fl) %>% head(5)

#10-1
x <-(midwest$poptotal-midwest$popadults)/midwest$poptotal
midwest <- midwest %>% mutate(kid_total = x) 

#10-2
midwest%>% group_by(county) %>% select(kid_total) %>% arrange(desc(kid_total)) %>%  head(5)
  
#10-3
midwest %>% mutate(kid_rank = case_when(kid_total >=0.4 ~"large",
                                        kid_total >=0.3 ~"middle",
                                        kid_total <0.3~"small")
                   ) %>% group_by(kid_rank) %>% summarise(n())

#10-4
midwest %>% mutate(asian_rate = popasian/poptotal) %>% select(state, county,asian_rate) %>% arrange(asian_rate) %>% head(10)


#11-1
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212),"hwy"] <-NA
table(is.na(c(mpg$drv)))
table(is.na(c(mpg$hwy)))

#11-2
mpg %>% filter(!is.na(hwy)) %>% group_by(drv) %>% summarise(mean(hwy))

#12-1
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10,14,58,93),"drv"] <- "k"
mpg[c(29,43,129,203),"cty"] <- c(3,4,39,42)

table(mpg$drv)
mpg$drv[mpg$drv %in% 'k'] <- NA
table(mpg$drv)

#12-2
#아웃라이어 추출
boxplot(mpg$cty)$out
#아웃라이어라면 결측치로 처리
mpg$cty[mpg$cty %in% c(boxplot(mpg$cty)$out)] <- NA
#확인
boxplot(mpg$cty)

#12-3
mpg %>% na.omit(mpg) %>% group_by(drv) %>% summarise(mean(cty))
