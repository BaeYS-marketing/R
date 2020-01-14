# 문제1
install.packages("ggplot2")
library(ggplot2)
str(mpg)
mpg <- as.data.frame(mpg)

# 1-1
mpg %>% nrow()
mpg %>% ncol()

# 1-2
install.packages("dplyr")
library(dplyr)
mpg %>% head(10)

# 1-3
mpg %>% tail(10)

# 1-4
mpg %>% View()

# 1-5
summary(mpg)

# 1-6
str(mpg)


# 문제2
# 2-1
mpg <- mpg %>% rename(city = cty,
                      highway = hwy)

# 2-2
mpg %>% head


# 문제3
# 3-1
library(ggplot2)
midwest <- as.data.frame(midwest)
str(midwest)

# 3-2
midwest <- midwest %>% rename(total = poptotal,
                              asian = popasian)

# 3-3
midwest <- midwest %>% mutate(percent = asian / total * 100)

# 3-4
midwest %>% mutate(p = ifelse(mean(percent) > percent, "large", "small"))


# 문제4
# 4-1
mpg
mpg %>%
  filter(displ == 4 | displ == 5) %>%
  group_by(displ) %>%
  summarise(mean_hwy = mean(highway))
## displ(배기량)이 4인 자동차의 highway(고속도로 연비)가 평균적으로 더 높다.

# 4-2
mpg %>%
  filter(manufacturer == "audi" | manufacturer == "toyota") %>%
  group_by(manufacturer) %>%
  summarise(mean_cty = mean(city))
## toyota의 city(도시 연비)가 평균적으로 더 높다.

# 4-3
mpg %>%
  filter(manufacturer == "chevrolet" | manufacturer == "ford" | manufacturer == "honda") %>%
  group_by(manufacturer) %>%
  summarise(mean_hwy = mean(highway))


# 문제5
# 5-1
new_mpg <- mpg %>% select(class, city)
new_mpg %>% head

# 5-2
new_mpg %>%
  filter(class == "suv" | class == "compact") %>%
  group_by(class) %>%
  summarise(mean_cty = mean(city))
## class(자동차 종류)가 "compact"인 자동차의 city(도시 연비)가 더 높다.


# 문제6
mpg %>%
  filter(manufacturer == "audi") %>%
  select(model, highway) %>%
  arrange(desc(highway)) %>%
  head(5)
