
#새로운 교수법 적용했을 때, 점수의 차이 
data <- read.csv("paired_sample.csv")
data


summary(data)

result <- subset(data, !is.na(after), c(before, after))

before<-result$before
after<- result$after



mean(before)
mean(after)


# 분산비율
# 동질집단이기 때문에 입력 아규머트가 약간 다르다. 
# 디폴트는 이질 집단 - F
var.test(after, before, piared =T)
'P 매우 높다. 귀무가설 기각아 안된다. ; 귀무가설 채택 : 분산차이가 없다.'

t.test(before,after, paired =T)
'P 매우 낮다. 귀무가설 기각해도 문제 없다. 
  두 그룹의 평균차기가 없다(0)이 구간 내 없다. = 대립가설 채택'

