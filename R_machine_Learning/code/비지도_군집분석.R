library(ggplot2)
data("diamonds")
head(diamonds)
str(diamonds)

#계층적 군집 : hcluster

#1000개 데이터 셈플링   : 사실 테스트 데이터임
t<- sample(1:nrow(diamonds),1000)  #행 추출
test <- diamonds[t,] #1000행, 10열
dim(test)


mydia<- test[c("price","carat","depth","table")]

result <- hclust(dist(mydia),method='ave') #군집 대표값으로 평균을 사용하겠다.
                                           #거리값 매트릭스로 데이터를 넣어줘야 한다. 

plot(result, hang=-1)

?hclust




#비계층적 군집 : Kmeans

result2<- kmeans(mydia,3)
result2

names(result2)

g1 <- subset(mydia, result2$cluster==1)
g2 <- subset(mydia, result2$cluster==2)
g3 <- subset(mydia, result2$cluster==3)

summary(g1)
summary(g2)
summary(g3)


km.out.withness<-c() 
km.out.between<-c()
for (k in 2:7){
  set.seed(1)
  km.out <- kmeans(mydia, centers = k) #그룹 한개는 의미가 없다.
  i=k-1 #인덱스 설정 
  km.out.withness[i]<-km.out$tot.withinss #군집  내  제곱합의  합  
  km.out.between[i]<-km.out$betweenss #군집  간  제곱합의  합
}
k<-c()
for(i in 2:7)k<-c(k,i)
verification<-data.frame(km.out.withness, km.out.between, 
                         row.names = paste0("k=",k))

'가장 급감한 지점(엘보우 포인트) k=3 일 때 적절하게 분류되었다. 라고 판단!'
