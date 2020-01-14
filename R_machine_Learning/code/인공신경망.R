library(nnet)

#데이터 표준화 : 1. z-value
#                2. min_max
iris_train_scale <- as.data.frame(sapply(iris_train[,-5], scale))

unique(iris$Species)

iris_test_scale <- as.data.frame(sapply(iris_test[,-5], scale))
iris_train_scale$Species <- iris_train$Species
iris_test_scale$Species <- iris_test$Species

nnet.result<-nnet(Species~. ,iris_train_scale, size=3)  #size = 노드 수(파라미터 조절은 노드 수 , 노드 층)

nnet.pred<-predict(nnet.result, iris_test_scale, type='class')
table(nnet.pred, iris_test$Species)
