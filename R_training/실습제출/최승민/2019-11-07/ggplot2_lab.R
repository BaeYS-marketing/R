  library(ggplot2)
  library(dplyr)
  
  #1
  ggplot(mpg, aes(x = cty, y= hwy)) +geom_point(col = "blue")
  ggsave("문1.png")
  
  #2
  cls <- ggplot(mpg, aes(x= class))
  cls + geom_bar(aes(fill = drv))
  ggsave("문2.png")

  #3
  options(scipen = 99) 
  ggplot(midwest, aes(x= poptotal, y = popasian)) + geom_point() + xlim(0, 500000) + ylim(0,10000)
  ggsave("문3.png")
  
  #4
  mpg <- as.data.frame(ggplot2::mpg)
  mpg <- mpg %>% 
    filter(class == "compact" | class == "subcompact" | class == "suv")
  
  ggplot(data = mpg, aes(x = class, y = hwy)) + geom_boxplot()
  ggsave("문4.png")  
  
  #5
  (prodd <- read.table("product_click.log", col.names = c("Purdate", "click")))
  ggplot(prodd, aes(x = click)) + geom_bar(aes(fill = click))
  ggsave("문5.png")       
  
  #6
  (prodd <- read.table("product_click.log", col.names = c("Purdate", "click")))
  prodd %>% 
    group_by(click) %>% 
    summarise(n = n()) 
  prodd$Purdate<- strptime(prodd$Purdate, "%Y%m%d%H%M")
  prodd$weekdays <- weekdays(prodd$Purdate)
  ggplot(data = prodd, aes(x = weekdays)) + geom_bar(aes(fill = weekdays))
  ggsave("문6.png")
