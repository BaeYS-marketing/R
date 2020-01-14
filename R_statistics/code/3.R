
##############  t검정  ##################### 
'A사의 컴퓨터 지속시간 vs 기존 컴퓨터 지속시간 (5.2h)' 

getwd()
data <- read.csv("one_sample.csv", header=T)
head(data)

computer<-data$time


#전반적인 확인  _ 결측치 확인
summary(computer)
mean(computer,na.rm=T)

#결측치 처리 
'시간에 흐름에 따르지 않고 서로 연관성이 없다. 
=> 각각이 독립적이기 때문에 제거해도 상관없다.

1.제거

2.제거를 못하면 => 행마다 독립적 : 평균으로 대체   *온도 등의 수치는 그냥 평균으로 하면 안돼! 10시면 10시의 평균으로 
                   행마다 독립적이지 않다? :  시계열같은 경우 조심!
'


com<- na.omit(computer)

summary(com)


#정규분포 검정
'shapiro.test
H0 : 인수로 전달된 데이터셋이 정규성을 따른다.  '

#수치 : 더 정확하게 파악할 수 있다.
shapiro.test(com)
#=> p-value = 0.7242 : 모델이 적합 _ 귀무가설 기각할 수 없다.  

#시각화 
hist(com)
qqnorm(com)


#t검정
t.test(com, mu=5.2)
"5.2이다 귀무가설 기각"

t.test(com, alternative = 'greater',mu=5.2, conf.level = 0.95)


t.test(com, alternative = 'less',mu=5.2, conf.level = 0.95)
