# install.packages("caret")
library(caret)

###  0. 전처리가 끝나다는 전제이다. ####


####  1.분석데이터 / 테스트 데이터 분할   ####
'iris 3개 품종간의 데이터 추출 데이터를 유지해서 데이터수집_ 
특정 품종 과학습으로 인한 오류 방지'
idx <- createDataPartition(iris$Species, p=0.7, list=F)  #Species품종에 따라수집 , 전체 중 70% , 리스트로 리턴X
iris_train <- iris[idx,]
iris_test <- iris[-idx,]

table(iris_train$Species)
table(iris_test$Species)

library(nnet)
model <- multinom(Species~., data=iris_train)
summary(model)

result<-predict(model, iris_test)
result

#평가 매트릭스
#install.packages("e1071")
confusionMatrix(result, iris_test$Species)   #Accuracy : 정확도 






'2번 쨰 연습 : c트리구조로 모델만들기----------------------------------------------------------'

library(caret)
idx <- createDataPartition(iris$Species, p=0.7, list=F)
iris_train[idx,]
iris_test[-idx,]

library(rpart)
model <- rpart(Species~. ,data=iris_train)
result <- predict(model, iris_test, type='class') #type='class' 확률값 아니다. 분류로 예측해라
head(result,3)

confusionMatrix(result, iris_test$Species)
#이 과정을 반복해서 나오는 Accuracy 값으로 모델정확도를 판단해야 한다.

#의사결정나무 특징 : 이상치에 민감하고 , 굉장히 이분법적 분류이기 때문에 경계값에 민감,
#                    정확성도 수학적모델이 약하기 때문에 낮다.



'1.코딩은 간단하다 그러나.. 관련 이론이 뒷받침되어야 하는것
 2. 여러 모델을 적용해서 가장 예측정확성이 높은 모델을 사용하면 되는 것이다.
3번째 연습  :  의사결정나무 보완 ~ 랜덤포레스트로 모델만들기!'
library(randomForest)
idx <- createDataPartition(iris$Species, p=0.7, list = F)
iris_train[idx,]
iris_test[-idx,]

model <- randomForest(Species~. ,data=iris_train, importance=T)  #500개로 모형 만듬_디폴트 , importance=T 변수 중요가 값을 따로 볼 수 있다. : 
model.pred <- predict(model, newdata=iris_test, type ="response") #type ="response" ,level말고 label로 출력

confusionMatrix(model.pred, iris_test$Species, positive='versicolor')


#type='class' , type='resposne'  ?
'Response gives you the numerical result while class gives you the label assigned to that value.
So Response lets you to determine your threshold.
https://stackoverflow.com/questions/23085096/type-parameter-of-the-predict-function'
