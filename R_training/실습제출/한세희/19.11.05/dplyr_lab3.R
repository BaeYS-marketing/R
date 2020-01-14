# 문제 7 -----------------------다시
mpg_new <- mpg
mpg_new %>% mutate(total_y = hwy + cty) %>% 
  mutate(average_y = total_y/2) %>% group_by(model) %>% 
  summarise(mean_average_y = mean(average_y)) %>% 
  arrange(desc(mean_average_y)) %>% head(3)


# 문제 8
# 8-1,2
mpg %>% group_by(class) %>% select(cty) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty))
# 8-3
mpg %>% group_by(manufacturer) %>% select(hwy) %>%
  summarise(mean_hwy = mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>% head(3)
# 8-4  -------------------------------->나중에
mpg %>% group_by(manufacturer, class) %>% summarise(classnum = n()) %>% 
  mutate(compactnum = ifelse(class=="compact", classnum, 0)) %>%
  group_by(manufacturer) %>%  arrange(desc(compactnum))


# 문제9
fuel <- data.frame(fl = c("c","d","e","p","r"),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)
print(fuel)
# 9-1
mpg <- ggplot2::mpg
mpg <- left_join(mpg, fuel, by="fl")
mpg
# 9-2
mpg %>% select(model,fl,price_fl) %>% head(5)



# 문제10
midwest <- ggplot2::midwest
midwest <- as.data.frame(midwest)
# 10-1,2
midwest %>% mutate(teenpercent = (poptotal-popadults)/poptotal*100) %>%
  group_by(county) %>% select(county, teenpercent) %>% 
  arrange(desc(teenpercent)) %>% head(5)
# 10-3------------------>다시
midwest %>% mutate(teenpercent = (poptotal-popadults)/poptotal*100) %>%
  mutate(teenpergrade = if(teenpercent >=40){
    print("large")
  }elseif(teenpercent >=30){
    print("middle")
  }else{
    print("small")
  }
  )
# 10-4
midwest %>% mutate(asianpercent= popasian/poptotal*100) %>% 
  select(state, county, asianpercent) %>% 
  arrange(asianpercent) %>% head(10)

# 문제11
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212), "hwy"] <- NA
