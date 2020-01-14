library("kernlab")

m=ksvm(Species~. ,data=iris) #모형은 평균

head(predict(m, newdata=iris))  #피팅률_적합률 확인(훈련데이터를 모델에 다시 넣는 경우) 
#적합도(Fitting rate)와 정확률(Accuray)은 다르다.
#적합도가 너무 높으면 오버피팅 가능성이 높다.




#PRACTICE

set1 <- read.csv("C:\\R_statistics\\data\\set1.csv", stringsAsFactors = F)
View(set1)

#1 plot
plot(set1)
'모든 변수에서 상관관계가 보이지 않는다.
2차원상에서는 선형적 관계를 보여주지 않는다.'

#2 알기 쉽게 food,book 2개 차원으로만 해서 보자.
#경험상 차원이 추가될수록  선형관계를 보여주지 않더라. 
library(MASS)
'de : 밀도! 누적확률밀도    _ 밀도함수로 쓴거는 연속형이니까.
 kde 커널덴티스티 : 커널밀도모델 _ 비선형적으로 밀도를 보여주는 것  점->면적
 kde2 : 2변량  '

density <- kde2d(set1$food, set1$book, n=400)
image(density, xlab="food", ylab='book')
'x축의 가운데 평균
 y축의 가운데 평균
전체적인 데이터가 특히 food가 평균에 모여있다.

분포로 보았을 때 비선형적 성질을 갖고있다.'

#3
library(e1071)  #역사가 깊어서 파라미터 최적화가 잘되어 있다. 
m1 <- svm(status~ food + book + cul +cloth +travel , type ="C-classification", data=set1)
m1


#튜닝_ 직접 해보자! _ 튜닝해서 Accurrcy가 올라가는 경우가 종종 있다. 
tune.svm(m1, ...)

#4
predict(m1, set1)
#수동으로 한 것(오류율)  -> 다시 confusionMatrix 로 다양하게 해석하자!
sum(set1$status !=predict(m1, set1))


#5
library(kernlab)
m2 <-ksvm(status~., kernel='rbfdot', data=set1)
m2
sum(as.numeric(predict(m2, set1)>0.5) !=set1$status)
