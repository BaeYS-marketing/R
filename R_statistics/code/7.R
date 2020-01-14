## 교차분석
'두 집단의 범주형 자료의 관련성을 알아볼 때 사용
:  두 변량이 명목/서열형 자료이어야 하고 상관관계를 보고 싶을 때.'


data<- read.csv("cleanDescriptive.csv", header=T)
View(data)

head(data)
str(data)

#부모 학력수준 정보
parent<-data$level2 

#자녀 대학 진학여부 
child<-data$pass2 


table(parent,child)


#추가설치
#install.packages("gmodels")   #CrossTalbe()
library(gmodels)               #data ~ diamond
library(ggplot2)


data("diamonds")
diamonds


CrossTable(x=diamonds$color, y=diamonds$cut)

#1 관측치
#2 카이제곱검정 결과 
#3 행기준 : 전체 관측치 대비 상대도수에서(0.126) Fair가 갖고 있는 상대도수 
#4 열기준 : 전체 Fiar 중에서 D가 차지하는 비율 
#5 행+열 기준 : 전체에서 D이고 Fair가 차지하는 비율





" 카이 제곱 분포 !!!"

'관찰된 빈도가 기대한 빈도(평균, 일반적인 성향 / 집단을 비교하는 상관관계)와 얼마나 가까운가를 검정하는 도구'
#명목형 = 바이너리 = 독립성 검정할 떄 사용하기도 한다. `~독립적이여야 카이제곱분포를 따른다.`
kai-value ~  x^2 분포 (카이스퀘어 분포)


평균성향 : 일반적인 카이제곱분포 ~ H0~  차이가 없다.  
평균성향에서 벗어난다. : 일반적인 카이제곱분포에서 벗어난다. ~ H1 ~ 차이가 있다.


관측치 - 기대빈도/일반적인 성향 , 즉
관측치 - 평균

=> 편차 제곱


기대빈도는 기대값으로 구한다.


========================================================================
        
