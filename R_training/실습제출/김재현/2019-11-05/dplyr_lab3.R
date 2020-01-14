# 7-1
mpg <- as.data.frame(ggplot2::mpg)
mpg <- mpg %>% mutate(effy = cty + hwy)

# 7-2
mpg <- mpg %>% mutate(avg_effy = mpg$effy/2)

# 7-3
mpg %>% arrange(desc(avg_effy)) %>% head(3)

# 7-4
mpg <- as.data.frame(ggplot2::mpg)
mpg %>% arrange(desc((mpg$cty + mpg$hwy)/2)) %>% head(3)



# 8-1
mpg <- as.data.frame(ggplot2::mpg)
mpg %>% group_by(class) %>% summarise(class_avg_cty = mean(cty))

# 8-2
mpg2 <- mpg %>% group_by(class) %>% summarise(class_avg_cty = mean(cty))
mpg2 %>% arrange(desc(class_avg_cty))

# 8-3
mpg_manu <- mpg %>% group_by(manufacturer) %>% summarise(class_avg_cty = mean(cty))
mpg_manu %>% arrange(desc(class_avg_cty)) %>% head(3)

# 8-4
manu <- mpg %>% 
  group_by(manufacturer) %>%
  filter(class == "compact") %>%
  summarise(num = length(class))
manu %>% arrange(desc(num))



# 9
fuel <- data.frame(fl = c("c","d","e","p","r"),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)
fuel

# 9-1
mpg <- left_join(mpg, fuel, by = "fl")

# 9-2
mpg %>% select(model, fl, price_fl) %>% head(5)



# 10
midwest <- as.data.frame(ggplot2::midwest)

# 10-1
midwest <- midwest %>% mutate(pop_u18_ratio = (poptotal - popadults)/poptotal*100)

# 10-2
midwest %>% select(county, pop_u18_ratio) %>% arrange(desc(pop_u18_ratio)) %>% head(5)

# 10-3
midwest <- midwest %>%
  mutate(LMS = ifelse(pop_u18_ratio < 30, "small", 
                      ifelse(pop_u18_ratio < 40 & pop_u18_ratio >= 30, "middle", 
                             "large")
                      )
         )
midwest %>% group_by(LMS) %>% summarise(size = length(LMS))

# 10-4
midwest <- midwest %>% mutate(asian_ratio = popasian/poptotal*100)
midwest %>% arrange(asian_ratio) %>% select(state, county, asian_ratio) %>% head(10)



# 11
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65, 124, 131, 153, 212), "hwy"] <- NA

# 11-1
table(is.na(mpg$drv))
table(is.na(mpg$hwy))

# 11-2
mpg %>%
  filter(is.na(hwy) != 1) %>%
  group_by(drv) %>%
  summarise(avg_hwy = mean(hwy)) %>%
  arrange(desc(avg_hwy))



# 12
mpg <- mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10, 14, 58, 93), "drv"] <- "k"
mpg[c(29, 43, 129, 203), "cty"] <- c(3, 4, 39, 42)

# 12-1
table(mpg$drv)
mpg$drv <- ifelse(!mpg$drv %in% c(4, "f", "r"), NA, mpg$drv)

# 12-2
boxplot(mpg$cty)
boxplot(mpg$cty)$stats
mpg$cty <- ifelse(mpg$cty <= 9 | mpg$cty >= 26, NA, mpg$cty)
boxplot(mpg$cty)

# 12-3
mpg %>%
  filter(is.na(drv) != 1 & is.na(cty) != 1) %>%
  group_by(drv) %>%
  summarise(avg_cty = mean(cty))
