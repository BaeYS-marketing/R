#install.packages('arules')
#install.packages("arulesViz")

library(arules)
library(arulesViz)
data("Groceries")

str(Groceries)  #트랜잭션스 타입 데이터
                # 트랜잭션을 묶어주는 역활 
                # @_ 에끼오 : class(오브젝트)안에 있는 데이터
                # 기본데이터(csv)를 트랜잭션으로 형변환시켜줘야 함.

'데이터 탐색단계'                
View(Groceries)
Groceries

inspect(Groceries) #트랜잭션스 데이터의 트랜잭션을 보고 싶을 때 
summary(Groceries)  #9835건 주문, 등장 아이템 169개


sort(itemFrequency(Groceries,type ="absolute"),decreasing = T)
                                   #절대수치
itemFrequencyPlot(Groceries, topN=10, type='absolute')
itemFrequencyPlot(Groceries, topN=10, type='relative') #상대수치


apriori(Groceries) #support=0.1, confidence=0.8 
result_rules<-apriori(Groceries, 
                      parameter=list(support=0.005,confidence=0.5,minlen=2)) 
                                                                # {lhs} --> {rhs} 차이 2이상        
result_rules 
summary(result_rules)  # {lhs} --> {rhs} 
inspect(result_rules[1:10])

plot(result_rules,method="graph",control=list(type="items")) 


#csv파일을 트랜잭션 파일로 바로 읽기 가능!
stran2<-read.transactions("single_format.csv",format="single", 
                          sep=",",cols=c(1,2), rm.duplicates=T)




#practice 교재

#데이터 탐색
build<- read.csv("building.csv", header=T)
build[is.na(build)]<-0
build<-build[-1]
build

#연관성 분석
library(arules)
trans<- as.matrix(build, "Transaction")

rules1<- apriori(trans, parameter=list(supp=0.2, conf=0.6, target="rules"))
rules1
inspect(sort(rules1))

rules2<- subset(rules1, subset = lhs %pin% '보습학원' & confidence>0.7)
inspect(sort(rules2))

rules3<- subset(rules1, subset = lhs %pin% '편의점' & confidence>0.7)
inspect(sort(rules3))


#visualization
b2 <- t(as.matrix(build)) %*% as.matrix(build)  #자기 자신의 역함수를 곱한다!!
#install.packages('sna')
#install.packages('rgl')
library(sna)
library(rgl)

b2.w<-b2-diag(diag(b2))
b3.w<-data.frame(b2.w)
gplot(b3.w, displaylabel=T, vertex.cex=sqrt(diag(b2)), vertex.col="green",
       edge.col='blue', boxed.labels=F, arrowhead.cex=0.3, label.pos=3, edge.lwd=b3.w*2)


