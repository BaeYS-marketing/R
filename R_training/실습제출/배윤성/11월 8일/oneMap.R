library(Kormaps)
library(dplyr)

rm(list=ls())

DONG<-read.csv('c:/RStudy/data/one.csv')
#View(DONG)
data(korpopmap3)
Encoding(names(korpopmap3))<-'UTF-8'

#View(korpopmap3)
Encoding(korpopmap3@data$name_eng)<-'UTF-8'
Encoding(korpopmap3@data$name)<-'UTF-8'
Encoding(korpopmap3@data$행정구역별_읍면동)<-'UTF-8'



#관악구
View(DONG)
donglist<-DONG %>% 
        filter(구별 == '관악구') %>% 
        select(동)

donglist<-unique(donglist)
donglist


#korpopamp3 데이터 
Encoding(korpopmap3@data$행정구역별_읍면동)<-'UTF-8'

list<-korpopmap3@data$name
df<- as.data.frame(list)
View(df)


#donglist 와 korpopmap3 데이터 비교 
print(donglist)
    
df %>% 
        mutate(index = 1:length(df$list)) %>% 
        filter(list == c(  '낙성대동',
                             '난곡동',
                             '난향동',
                             '남현동',
                             '대학동',
                             '미성동',
                           '보라매동',
                             '삼성동',
                             '서림동',
                            '서원동',
                            '성현동',
                            '신림동',
                            '신사동',
                            '신원동',
                            '은천동',
                            '인헌동',
                            '조원동',
                            '중앙동',
                            '청룡동',
                            '청림동',
                            '행운동'))


