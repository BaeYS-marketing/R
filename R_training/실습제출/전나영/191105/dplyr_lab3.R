# 문제7
install.packages("ggplot2")
library(ggplot2)

# 7-1
install.packages("dplyr")
library(dplyr)
mpg2 <- mpg %>% mutate(total = cty + hwy)

# 7-2
mpg2 <- mpg2 %>% mutate(avg = total / 2)

# 7-3
mpg2 %>%
  arrange(desc(total)) %>%
  head(3)

# 7-4
mpg %>%
  mutate(total = cty + hwy, avg = total / 2) %>%
  arrange(desc(total)) %>%
  head(3)


# 문제8
# 8-1
mpg %>%
  group_by(class) %>%
  summarise(mean_cty = mean(cty))

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
  summarise(n = n())


# 문제 9
fuel <- data.frame(fl = c("c", "d", "e", "p", "r"),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)
fuel

# 9-1
mpg <- left_join(mpg, fuel, by = "fl")

# 9-2
mpg %>%
  select(model, fl, price_fl) %>%
  head(5)


# 문제 10
midwest <- as.data.frame(ggplot2::midwest)
# 10-1
midwest <- midwest %>% mutate(percent = (poptotal-popadults) / poptotal)

# 10-2
midwest %>%
  select(county, percent) %>%
  arrange(desc(percent)) %>%
  head(5)

# 10-3
midwest <- midwest %>% mutate(grade = ifelse(percent >= 0.4, "large",
                                             ifelse(percent >= 0.3, "middle", "small")))
midwest %>%
  group_by(grade) %>%
  summarise(n = n())

# 10-4
midwest %>%
  mutate(asian_per = popasian / poptotal) %>%
  select(state, county, asian_per) %>%
  arrange(asian_per) %>%
  head(10)


# 문제 11
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65, 124, 131, 153, 212), "hwy"] <- NA

# 11-1
table(is.na(mpg$drv))
table(is.na(mpg$hwy))

# 11-2
mpg %>%
  filter(hwy != "NA") %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy))


# 문제 12
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10, 14, 58, 93), "drv"] <- "k"
mpg[c(29, 43, 129, 203), "cty"] <- c(3, 4, 39, 42)

# 12-1
mpg$drv <- ifelse(mpg$drv %in% c("f", "4", "r"), mpg$drv, NA)
table(mpg$drv)

# 12-2
boxplot(mpg$cty)$stats
mpg$cty <- ifelse(mpg$cty < 9 | mpg$cty > 26, NA, mpg$cty)
boxplot(mpg$cty)

# 12-3
mpg %>%
  filter(!is.na(drv) & !is.na(cty)) %>%
  group_by(drv) %>%
  summarise(mean_cty = mean(cty))
