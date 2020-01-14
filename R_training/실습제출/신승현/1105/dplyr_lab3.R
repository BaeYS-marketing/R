#install.packages("ggplot2")
#str(ggplot2::mpg)
#mpg <- as.data.frame(ggplot2::mpg)
install.packages("dplyr")
library(dplyr)


#7-1
mpg_sum = sum(mpg$cty, mpg$hwy)

#7-2
mpg$new<-((mpg$cty + mpg$hwy)/2)

#7-3
mpg %>%
  arrange(desc(mpg$new)) %>% head(3)

#7-4
mpg %>% 
#8-1
mpg %>% group_by(class) %>%
  summarise(mean_cty = mean(cty))
#8-2
mpg %>% group_by(class) %>%
  summarise(mean_cty = mean(cty)) %>%
  arrange(desc(mean_cty))
#8-3
mpg %>% group_by(manufacturer) %>% 
  summarise(mean_hwy = mean(hwy)) %>%
  arrange(desc(mean_hwy)) %>% head(3)

#8-4
mpg %>% group_by(manufacturer) %>%
  filter(class==('compact')) %>%
  summarise(n = n()) %>%  
  arrange(desc(n))


#9-1
fuel <- data.frame(f1=c("c","d","e","p","r"),
                   price_f1 = c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)
fuel
mpg = left_join(mpg, fuel, by="fl")
mpg


#9-2
mpg %>% 



#10-1
mpg %>% midwest = midwest %>%
  mutate(popadults / poptotal * 100)
midwest$proadults

#10-2
mpg %>% group_by(class) %>%
  mutate(popadults / poptotal * 100)
midwest$class

#10-3

#11-1

mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65, 124, 131, 153, 212), "hwy"] <- NA
mpg
table(is.na(mpg$drv))
table(is.na(mpg$hwy))

#11-2
mpg %>% summarise(mean_hwy = mean(hwy, na.rm = T)) 
mpg %>% filter(!is.na(mpg$hwy)) %>%
  summarise(mean_hwy=mean(hwy)) %>%
  arrange(desc(mean_hwy)) %>% head(1)


#12-1
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10, 14, 58, 93), "drv"] <- k
mpg[c(29, 43, 129, 203), "cty"] <- c(3, 4, 39, 42)
mpg
table(mpg$drv)
table(mpg$cty)

#12-2
table(mpg$cty)
outlier$cty <- ifelse(outlier$cty == 3, NA, outlier$cty)

#12-3
mpg %>% filter(!is.na(cty) & !is.na(drv)) %>%
  group_by(drv) %>%
  summarise(mean_cty = mean(cty))
