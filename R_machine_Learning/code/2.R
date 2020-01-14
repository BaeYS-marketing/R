#install.packages("ggvis")
#install.packages("class")
library(ggvis)
library(class)
library(caret)

set.seed(1234) #시드 작업 : 컴퓨터 근처 메모리 이용하려는 관성탈피 
idx <- createDataPartition(iris$Species, p=0.7, list = F)
iris_train <- iris[idx,]
iris_test <- iris[-idx,]


model <- knn(train = iris_train[,-5], test = iris_test[,-5] ,cl=iris_train$Species, k=3)  
#k=1부터 해서 제일 정확성이 좋은 k 값을 찾는 것_ 여기서는 k=3


#테스트 데이터에 대한 예측치 ~ 다른 모델과의 차이점!
model
summary(model)   #디폴트로 가장 핵심이 되는 예측치리턴 역활로 정의되어 있다.

confusionMatrix(model, iris_test$Species) #예측치, 실측치(레이블값)




# install.packages("kknn")
library(kknn)
'1) 거리 구하는 계산방식이 조금더 디테일한 튜닝 [distance 옵션]
 2) 가까운 거리에는 가중치 부여  [kernel 옵션]
'
