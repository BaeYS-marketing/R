data(iris)
library(caret)

#150건 --> 70%(105건 ==> 3)
idx <- createDataPartition(iris$Species, p=0.7, list=F)  #70%행 추출 

View(idx)
View(iris_train)
iris_train = iris[idx,]
iris_test = iris[-idx,]

table(iris_train$Species)
table(iris_test$Species)


library(e1071) #나이브 기법_ 패키지로드 

#나이브 베이즈 적합
naive.result <- naiveBayes(iris_train, iris_train$Species, laplace =1)

#테스트 데이터 평가
naive.pred <- predict(naive.result, iris_test, type='class')

table(naive.pred, iris_test$Species)

confusionMatrix(naive.pred, iris_test$Species)




#책 연습 문제 : 1번
setwd("C:/R_statistics/data")
movie <- read.csv("movie.csv", header = T)

nm<- naiveBayes(movie[1:5], movie$장르, laplace=0)
head(movie)

result <- predict(nm, movie[1:5])
sum(movie$장르 !=result)



# 2번
mail <- read.csv("spam.csv", header=T)
mail[is.na(mail)]<-0

nm2<- naiveBayes(mail[2:13], mail$메일종류, laplace = 0)
head(mail)

result2<- predict(nm2, mail[2:13])
sum(mail$메일종류 !=result2)
result2
nm2



