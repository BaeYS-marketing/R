library(ggplot2)
library(dplyr)
mpg <- as.data.frame(ggplot2::mpg)

#7-1
mpg <- mpg %>% mutate(hwy_cty = hwy + cty)
#7-2
mpg <- mpg %>% mutate(mean_hwy_cty = hwy_cty / 2)
#7-3
mpg %>% arrange(desc(mean_hwy_cty)) %>% head(3)
#7-4
mpg %>% mutate(hwy_cty = hwy + cty) %>% mutate(mean_hwy_cty = hwy_cty / 2) %>%
  arrange(desc(mean_hwy_cty)) %>% head(3)

#8-1
mpg %>% group_by(class) %>% summarise(mean_cty = mean(cty))
#8-2
mpg %>% group_by(class) %>% summarise(mean_cty = mean(cty)) %>% arrange(desc(mean_cty))
#8-3
mpg %>% group_by(manufacturer) %>% summarise(mean_hwy = mean(hwy)) %>% arrange(desc(mean_hwy)) %>% head(3)
#8-4
mpg %>% filter(class=="compact") %>% group_by(manufacturer) %>% summarise(n=n()) %>% arrange(desc(n))

#9
fuel <- data.frame(fl=c("c","d","e","p","r"), price_fl=c(2.35, 2.38, 2.11, 2.76, 2.22), stringsAsFactors = F)
fuel
#9-1
mpg <- full_join(mpg, fuel, by="fl")
#9-2
mpg %>% select(model, fl, price_fl) %>% head(5)


#10
midwest <- as.data.frame(ggplot2::midwest)
#10-1   (전체미성년자수=전체인구-전체성인인구)
midwest <- midwest %>% mutate(pct_inf = (poptotal-popadults)/poptotal*100)
#10-2
midwest %>% arrange(desc(pct_inf)) %>% select(county, pct_inf) %>% head(5)
#10-3
midwest <- midwest %>% mutate(grade = ifelse(pct_inf>=40, "large", ifelse(pct_inf<30, "small", "middle")))
table(midwest$grade)
#10-4
midwest %>% mutate(pct_asian = popasian/popadults*100) %>% arrange(pct_asian) %>% select(state, county, pct_asian) %>% head(10)

#11
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65, 124, 131, 153, 212), "hwy"] <- NA
#11-1
table(is.na(mpg$drv))
table(is.na(mpg$hwy))
#11-2
mpg %>% filter(!is.na(hwy)) %>% group_by(drv) %>% summarise(mean_hwy=mean(hwy))

#12
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10, 14, 58, 93), "drv"] <- "k"
mpg[c(29, 43, 129, 203), "cty"] <- c(3, 4, 39, 42)
#12-1
table(mpg$drv)
mpg$drv <- ifelse(mpg$drv %in% "k", NA, mpg$drv)
table(mpg$drv)
#12-2
boxplot(mpg$cty)
boxplot(mpg$cty)$stats
mpg$cty <- ifelse(mpg$cty < 9 | mpg$cty > 26, NA, mpg$cty)
boxplot(mpg$cty)
#12-3
mpg %>% filter(!is.na(drv)) %>% group_by(drv) %>% summarise(mean_cty = mean(cty))
