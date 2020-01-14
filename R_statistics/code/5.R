
#두 집단의 실기 시험의 평균차이가 있는가
'두 집단의 연속형 데이터의 검정 vs 두 집단의 팩터형 데이터의 검정'



satisfy

#데이터 결측치 제거, 원하는 2개 행만 시행
result <- subset(satisfy, !is.na(score), c(method, score))


head(result,5)



#교육방법에 따라 시험점수 차이가 있을 것이다!가 연구 목표


#데이터 한번더 정제
dim(result)

a_method <- subset(result,method ==1)
b_method <- subset(result, method ==2)


#두 집단의 개수를 확인
dim(a_method)
dim(b_method)


a_score <- a_method$score
b_score <- b_method$score


var.test(a_score,b_score)
var.test(a_score,b_score , var.equal =T )

#두 집단의 분산이 차이가 있을 때 , 
# !!! 단, 두 집단 분산비가 같을 떄는 결과값의 차이가 없어서 기본 디폴트는 F이다. 
var.test(a_score,b_score, var.eqaul = F)

'귀무가설 : 두 집단간 분산차이가 없다.'
=> p_value = 0.3002 귀무가설 기각 못한다. 즉, 분산차이가 없다.


t.test(a_score, b_score)
"귀무가설 : 두 집단의 평균차이는 없다."

=> p_value = 0,0411 그래도 간당간당하니 차이가 있다. 