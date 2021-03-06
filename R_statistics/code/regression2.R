setwd('C:/R_statistics')


str(cars)

#회귀분석
m<- lm(dist~speed, data =cars)


#만능함수 _ 상세정보
summary(m)
'T검정 귀무가설 : 각각의 계수가 0이어도 차이가 없다.   0일 때와 0이 아닐 때를 비교'
'F검정 귀무가설 : 평균?  y(=1)와 회귀식 y 차이가 없다.  분산비교로 검정'


par(mfrow=c(2,2), mar=c(2,2,2,2))

#만능함수2 plot
plot(m)
'#1 1) x축 회귀식으로 예측/ 피팅데이터, y축 잔차 ;  잔차는 0에 수렴될 수록 좋다. 빨간선 : 구간별 오차 평균 
    2) 등분산성도 확인해 볼 수 있다. : 잔차의 패턴의 보이는가? 앞의 잔차가 뒤에 잔차와 관계성을 갖나? 안 갖는다. 
 #2 확실한 방법 qqplot 잔차의 정규성확인 : 예측치 quantile, y축 잔차
 #3 1번을 루트 씌운거라서 크게 신경 안써도 된다. 
 #4 y축은 표준화된 잔차 x축 잔차의 영향력  쿸 공식에 넣었을 떄 평균에(0) 가깝게 나올 떄 회귀식에서 설명할 수 있는 데이터가 많다.
    잔차가 정규분포 안에 들어오는지 확인 할 때'

#더비 왓슨 : 잔차의 독립성 검정 
#install.packages("lmtest")
library(lmtest)
dwtest(m)
'귀무가설 : 오차항과 오차항 간의 상관계수가 없다. =. 0.09522 귀무가설 채택'


?qqnorm
?geom_smooth
  #################################################################################



##lm F-statistics : 축소모형(reduced model과 완전모형 full model) 간의 검정
' 완전 모델은 원래 사용한 모델 dist ~ speed며, 
축소 모델은 원래 사용한 모델보다 설명 변수를 줄인 모델로 
=> speed를 제외하고 dist를 상숫값으로 예측한 경우다.'
anova(
  object,  # 모델 피팅 함수(예를 들면, lm)의 반환 값
  ...      # 비교할 또 다른 객체들
)

#summary(lm)이 보여주는 F통계량은 annova()함수를 이용해 직접 구할 수 있다.
full <- lm(dist ~ speed, data=cars)
reduced <- lm(dist ~ 1, data=cars)
anova(reduced,full)
