getwd()

data(cars)
str(cars)


#종속dist , 독립speed
m<-lm(dist~speed, data=cars)
m
summary(m)


#적합된 회귀값 확인
fitted(m)[1:4]

#잔차 값 확인 
residuals(m)[1:4]

#두개 더하면 실측치 값이다.


#머신러닝은 여기서 끝나는 것이 아니라, 예측하는 것이 목표이다. 


predict(m, newdata = data.frame(speed=3))




summary(m)

library(MASS)
data(Boston)
Boston

install.packages("mlbench")
library("mlbench")

data("BostonHousing")
head(BostonHousing)


m2<- lm(medv~.,data=BostonHousing)
summary(m2)




#단계적 변수선택 방법
step(m2, direction= "both")
