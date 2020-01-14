# 7-1
mpg = as.data.frame(ggplot2::mpg)
mpg = mpg %>%
  mutate(sum_ch = cty + hwy)
# 7-2
mpg = mpg %>%
  mutate(mean_ch = sum_ch / 2)
# 7-3
mpg %>%
  arrange(desc(mean_ch)) %>%
  head(3)
# 7-4
mpg = as.data.frame(ggplot2::mpg)
mpg %>%
  mutate(sum_ch = cty + hwy, mean_ch = sum_ch / 2) %>%
  arrange(desc(mean_ch)) %>%
  head(3)

# 8-1
mpg = as.data.frame(ggplot2::mpg)
mpg %>% 
  group_by(class) %>%
  summarise(mean(cty))
# 8-2
mpg %>% 
  group_by(class) %>%
  summarise(mean_cty = mean(cty)) %>%
  arrange(desc(mean_cty))
# 8-3
mpg %>%
  group_by(manufacturer) %>%
  summarise(mean_hwy = mean(hwy)) %>%
  arrange(desc(mean_hwy)) %>%
  head(3)
# 8-4
mpg %>%
  filter(class == "compact") %>%
  group_by(manufacturer) %>%
  summarise(com_n = n()) %>%
  arrange(desc(com_n))

# 9-1
fuel = data.frame(fl = c('c', 'd', 'e', 'p', 'r'),
                  price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
                  stringsAsFactors = F)
fuel
mpg = left_join(mpg, fuel, by = "fl")
# 9-2
mpg %>%
  select(model, fl, price_fl) %>%
  head(5)

# 10-1
midwest = as.data.frame(ggplot2::midwest)
midwest = midwest %>%
  mutate(kid_ratio = ((poptotal - popadults) / poptotal) * 100)
# 10-2
midwest %>%
  arrange(desc(kid_ratio)) %>%
  select(kid_ratio) %>%
  head(5)
# 10-3
midwest %>%
  mutate(kid_ratio_grade = ifelse(kid_ratio >= 40, "large",
                                  ifelse(kid_ratio < 30, "small", "middle"))) %>%
  group_by(kid_ratio_grade) %>%
  summarise(n())
# 10-4
midwest %>%
  mutate(asian_ratio = (popasian / poptotal) * 100) %>%
  select(state, county, asian_ratio) %>%
  arrange(asian_ratio) %>%
  head(10)

# 11-1
mpg = as.data.frame(ggplot2::mpg)
mpg[c(65, 124, 131, 153, 212), "hwy"] = NA
mpg %>%
  select(drv, hwy) %>%
  is.na() %>%
  colSums()
# 11-2
mpg %>%
  filter(!is.na(hwy)) %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy)) %>%
  arrange(desc(mean_hwy))

# 12-1
mpg = as.data.frame(ggplot2::mpg)
mpg[c(10, 14, 58, 93), "drv"] = "k"
mpg[c(29, 43, 129, 203), "cty"] = c(3, 4, 39, 42)
table(mpg$drv)
mpg$drv = ifelse(mpg$drv %in% "k", NA, mpg$drv)
table(mpg$drv)  
# 12-2
boxplot(mpg$cty)
quan = boxplot(mpg$cty)$stats
mpg$cty = ifelse((mpg$cty >= quan[1]) & (mpg$cty <= quan[5]), mpg$cty, NA)
boxplot(mpg$cty)
# 12-3
mpg %>%
  filter(!is.na(drv) & !is.na(cty)) %>%
  group_by(drv) %>%
  summarise(mean(cty))
