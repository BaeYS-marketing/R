library(dplyr)
library(ggplot2)

data(mpg)
mpg2<-mpg

#7-1
mpg2<-mpg2 %>% mutate(total = cty+hwy)
str(mpg2)


#7-2
mpg2 <- mpg2 %>% mutate(tAverage = total/2)


#7-3
mpg2 %>% select(tAverage) %>% head(3)


#7-4
mpg %>% mutate(total = cty+hwy) %>% 
        mutate(average = total/2) %>% 
        select(average) %>% 
        head(3)



#8-1
mpg %>% group_by(class) %>% 
        summarise(mean(cty))


#####8-2
mpg %>% group_by(class) %>% 
        summarise(averageCty = mean(cty)) %>%
        arrange(desc(averageCty))



#8-3
mpg %>% group_by(manufacturer) %>% 
        summarise(mean(hwy)) %>% 
        head(3)


#8-4
mpg %>% filter(class == 'compact') %>% 
        group_by(manufacturer) %>% 
        summarise(count= n()) %>% 
        arrange(desc(count))


#9-1
View(mpg)
fuel <- data.frame(fl = c('c','d','e','p','r'),
                   price_fl = c(2.35,2.38,2.11,2.76,2.22),
                   stringsAsFactors = F)
                   

'mpg %>% mutate(price_fl = if(fl=='c') price_fl =2.35
               else if(fl=='d')price_fl=2.38
               else if(fl=='e')price_fl=2.11
               else if(fl=='p')price_fl=2.76
               else if(fl=='r')price_fl=2.22
               else price_fl = NA
)'

?left_join
# mpg2<-left_join(mpg,fuel)

mpg %>% left_join(fuel, by='fl')

#짚어두어야 할 부분. join할 떄 데이터 사이즈!!!
#inner_join과의 차이  :  mpg 데이터 완전 보존 

'stringsAsFactors = T 였을 때 ;Warning message:
Column `fl` joining character vector and factor, coercing into character vector'

     

#9-2
mpg %>% left_join(fuel, by='fl') %>% 
        select(model,fl,price_fl) %>% 
        head(5)
    




#10-1
library(ggplot2)
midwest<-as.data.frame(midwest)

midwest %>% mutate(childRate = (poptotal-popadults)/poptotal*100)


#10-2
midwest2<-midwest %>% mutate(childRate = (poptotal-popadults)/poptotal*100) %>% 
        arrange(desc(childRate)) %>% 
        select(county, childRate) %>% 
        head(5)
midwest2


#########10-3  : ifelse함수의 활용 
midwest2 %>% 
        mutate(grade = ifelse(childRate>=40, 'large', 
                              ifelse(childRate>=30, 'middle', 'small')) ) %>% 
        group_by(grade) %>% 
        summarise(count = n())


# 10-4
midwest %>% 
        mutate( asian_pct = popasian/poptotal*100 ) %>% 
        arrange(asian_pct) %>% 
        head(10) %>% 
        select(state, county, asian_pct)



#11-1
data(mpg)
mpg<- as.data.frame(mpg)
mpg[c(65,124,131,153,212),'hwy'] <- NA        #  ,'hwy'] 행 , 렬 




table(is.na(mpg))  #결측치 개수 확인

table(is.na(mpg$drv))   #drv 칼럼 결측치 개수 확인 


########11-2
mpg %>% filter(is.na(mpg)==F) %>% 
        group_by(drv) %>% 
        summarise(average_hwy = mean(hwy)) %>% 
        arrange(desc(average_hwy))

mpg %>% 
        filter( !is.na(hwy) ) %>% 
        # select( drv, hwy ) %>% 
        group_by( drv ) %>% 
        summarise( average_hwy = mean(hwy) ) %>% 
        arrange(desc(average_hwy))





#12 -1
mpg <- data.frame(ggplot2::mpg)
mpg[c(10,14,58,93), 'drv'] <- 'k'
mpg[c(29,43,129,203), 'cty'] <- c(3,4,39,42)




table(mpg$drv)          #이상치 확인하는 방법1.




mpg[ ]

#1
mpg[ !mpg$drv %in% c('4','f','r'),'drv' ] <- NA
#2
mpg$drv <- ifelse(mpg$drv %in% c('4','f','r'), mpg$drv, NA)


table(mpg$drv)  #이상치 제거 확인



#12 -2


# boxplot(mpg)   
'Error in x[floor(d)] + x[ceiling(d)] : 
  non-numeric argument to binary operator'

boxplot(mpg$cty)
boxplot(mpg$cty)$stat   #박스플롯 + 콘솔창 : 통계치 출력 

mpg$cty[]

#1
mpg$cty <- ifelse(mpg$cty<9 | mpg$cty>26 , NA, mpg$cty)
mpg$cty

#2 다른 분 
mpg[(mpg$cty<9 | mpg$cty>26), 'cty'] <- NA
boxplot(mpg$cty)  # 이상치 제외 확인



#12-3

#나
mpg %>% group_by(drv,cty) %>% 
        summarise(mean(cty, na.rm=T))


#다른 분 
mpg %>% filter(!is.na(cty))&filter(!is.na(drv)) %>% 
        group_by(drv) %>% 
        summarise(mean_cty = mean(cty))


#또 다른 분 
mpg %>% 
        select(drv, cty) %>% 
        filter( !is.na(drv) ) %>% 
        group_by(drv) %>% 
        summarise(mean_cty = mean(cty, na.rm = T))
