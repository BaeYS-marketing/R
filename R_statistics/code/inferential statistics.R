setwd("c:\\Rwork\\Part-III")
data = read.csv("one_sample.csv",header=T)
head(data)
#############################################################
#1. 단일표본 비율검정(바이너리, 범주형인 경우)
x=data$survey
#팩터형으로 지정하면 따로 테이블을 쓰지 않아도 됨
str(x)
summary(as.factor(x)) #NA있는지 확인
table(x)

data$survey = as.factor(data$survey)
summary(data)

library(prettyR)
freq(x)

binom.test(c(136,4),p=0.8)

#############################################################
#2.단일표본 평균검정(수치형인 경우)



x = data$time
summary(x)


mean(x,na.rm=T)
x1 = na.omit(x)#결측치 다루는 것 이번에는 삭제함
summary(x1)

shapiro.test(x1)
hist(x1)
qqnorm(x1)#q플롯 직선에 가까울 수록 정규분포와 비슷함

t.test(x1, mu=5.2)
t.test(x1, mu=5.2, alter='greater')
#alter는 대립가설 #df는 자유도로 표본의 개수를 의미
#p밸류는 기각해도 오류가 없는 확률이라고 해석 낮으면 기각


###############################################################
#3. 복수표본 비율검정(바이너리, 범주인 경우)

setwd("c:\\Rwork\\Part-III")
data2 = read.csv("two_sample.csv",header=T)
head(data2)
x = data2$method
y = data2$survey

table(x)
table(y)#이렇게 보면 대충봐도 y가 좋아보임\
table(x,y,useNA = "ifany")

#양측검정
prop.test(c(110,135),c(150,150)) #T인 수, 전체 인원 수를 아규먼트로 받음

#단측검정
prop.test(c(110,135),c(150,150),alternative = "greater") 
prop.test(c(110,135),c(150,150),alternative = "less") 
# 세가지 다 해볼것



###############################################################
#3. 복수표본 평균검정(수치형)

result = subset(data2, !is.na(score), c(method,score))#행울 걸러내는 함수(데이터 값, 조건, 뽑을 컬럼)
head(result)
length(result$score)

a = subset(result, method==1)
b = subset(result, method==2)

length(a$score)
length(b$score)

a1 = a$score
b1 = b$score

mean(a1)#이 차이가 오차범위 안에 드는지 
mean(b1)

var.test(a1,b1)#이질집단  동질성 검사 #결과가 동질하게 나옴
t.test(a1,b1)#평균 동질성 검사 #기각하게 나옴 

t.test(a1,b1,var.equal = T)#동질적이지 않을 경우에도 처리할 수 있게 코딩이 됨
t.test(a1,b1,var.equal = F)#동질적인 경우, 디폴트값


###############################################################
#3. 대응표본(표본은 1개지만 시점 등이 다름) 평균검정(수치형, 사전검사와 사후검사 등 똑같은 표본의 변화를 감지)

setwd("c:\\Rwork\\Part-III")
data3 = read.csv("paired_sample.csv",header=T)
head(data3,10)
summary(data3)
result = subset(data3, !is.na(after), c(before,after))
head(result)

x = result$before
y = result$after

mean(x)
mean(y)

var.test(x,y,paired=T)#동질집단 동질성 검사는 paired=T, d이질집단이 디폴트 F
t.test(x,y,paired=T)#동질집단 t 검사는 paired=T, d이질집단이 디폴트 F
#1)차이가 있는지 확인.

t.test(x,y,paired=T,alternative = "less")#alternative = "less" 가 맞음 , 이미 알고 있기 때문
#2)x가 y보다 작은지 확인.

t.test(x,y,paired=T,alternative = "greater")
#3)x가 y보다 큰지 확인.

#######################################################################3
#4. 3개 이상 집단의 평균을 검정(f분포를 활용한 분산검정)

######################################################################
#5. 카이제곱 검정
data4 = read.csv("cleanDescriptive.csv",header=T)
head(data4)
#교차 분석은 두개 이상의 데이터의 상관관계 분석
#여기서는 두개가 다 범주형임

#부모의 학력수준이 자녀의 대학 진학에 어떤 영향을 미치는지에 대한 자료임
#문자열은 무조건 팩터형으로 되어있음
str(data4)
#여기서는 범주형 데이터를 찾기 위해 

x = data4$level2 #부모의 학력수준
y = data4$pass2 #자녀의 대학진학여부

table(x,y)

# install.packages("gmodels") #교차분석표 crossmodel 존재
library(gmodels)
library(ggplot2) #diamond data 존재


data("diamonds")
diamonds
CrossTable(x=diamonds$color,y=diamonds$cut)
CrossTable(x=diamonds$color,y=diamonds$cut,chisq = T)
#크로스 테이블은 각 칸마다 각 순서로 구성됨
#관측치, 
#카이제곱값, 
#행에서 칸이 차지하는 비율(전체 관측치 대비 상대도수에서의 비율), 
#열에서 칸이 차지하는 비율
#전체에서 칸이 차지하는 비율
#분포가 카이제곱을 잘 따르면, 독립적



#카이제곱 분포: 실제로 관찰된 빈도와 기대한 빈도와 얼마나 가깐운지
#명목척도인 경우 교차분석할 때 카이스퀘어 테스트 사용, 표하나의 칸이 관찰빈도

#자유도에 따른 카이제곱 값으로 판별


CrossTable(x=x,y=y,chisq = T)#카이제곱이라는 옵션으로 세부적인 결과 도출
chisq.test(x,y)



