getwd()
setwd("C:/R_statistics/Part3")
data<- read.csv('one_sample.csv')

View(data)
head(data,6)
summary(data)


x<- data$survey
str(x)

'결측치 확인'
summary(x)  #'summary는 만능- 수치형이면 수치, 팩터면 팩터로 , 단 자동변환은 아니다!'
table(x)    #'talbe은 팩터형을 받는다. 아니면 자동변환'

f<- as.factor(x)
summary(f)


#install.packages("prettyR")
library("prettyR")

freq(x)

#앞에 있는 아규먼트를 기준으로 80%다 라는 양측검정이 시작된다. 
#비율검정 : 한집단 binom , 두집단 이상 prop

#분산이랑 상관없는 정말 확률 : 빈도수에 대한 비율!!!
#내가 보고자하는 확률을 알고있을 떄 사용``
binom.test(c(136,14),p=0.8)

'양측검정 HO : 만족비율이 80%이다. 
                           대립가설 만족비율이 80%가 아니다.'
'단측검정 HO [크다/작다] : 만족비율이 80%이다.
                           대립가설 만족비율이 80%보다 [크다/작다]'

#비율에 따르는 검정 
#앞에 기준, 이항이라서 아규먼트는 2개 : 0아니면 1
binom.test(c(136,14),p=0.8, alternative = "greater")

binom.test(c(14,136),p=0.2, alternative = "less")
#H0 : 전체불만율은 20이다ㅣ
#H1 : 전체불만율은 20보다 작다