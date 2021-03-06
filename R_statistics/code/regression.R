data("cars")

####################################################################
#회귀
head(cars)
m=lm(dist~speed, data=cars)
m#왼쪽이 종속변수
#m에 저장하면 따로 수식을 쓸 필요 없이 계산이 가능함.


fitted(m)[1:4] #회귀식 예측치
residuals(m)[1:4]
predict(m,newdata = data.frame(speed=3))
summary(m)
#잔차의 사분위 수를 보면 대강 등분산성 알 수 있음
#공분산 항목은 변수, 잔차 평균을 검정 t값 
#귀무가설:상관없음 대립가설:상관있음 
#p가 0.05보다 작으면 쓸모 있는변수 
#잔차는 1 상태에서 검정 
#변수는 0 상태에서 검정
#팁:*이 보이면 유의함으로 넘어갈 수 있음
#팁:.이 보이면 애매한 것
#팁: 비어 있으면 무의미함 제거 대상
#결정계수: 회귀식의 오차가 얼마나
#다중선형회귀식은 수정된 결정계수를 봐야함
#실측치와 회귀식을 통한 추정치가 근접해 있으면 r이 1과 가깝게 나옴
install.packages("mlbench")
library(mlbench)
data(BostonHousing)
str(BostonHousing)

#####################################################################
#다중회귀
m2=lm(medv~.,data=BostonHousing)
summary(m2)

#chars값 설명
# 0=[1,0,0]
# 1=[0,1,0]
# 2=[0,0,1]

#회귀분석할 때 Y값은 무조건 수치형이어야 함, X는 범주형이어도 벡터화하면 가능함

######################################################################
#단계적 회귀변수 선택
#중요하지 않은 것을 하나씩빼면서 원래와 비교함 ,F값을 확인
#전체에서 하나씩 빼면서(후진) or 0에서 하나씩 넣어가면서(전진) 

m3=step(m2,direction = "both")#both는 전진 후진을 하나씩 해봄

#정보지수 AIC:뭔가 하나가빠졌을 때 다음단계에서 확인해야 하는 지표
#,확률이 낮을 수록, 모수의 특성 개수가 클 수록 영향을 받음
# 작을 수록 좋음
#이게 작아지는 방향으로 단계적인 시도 

#RSS







