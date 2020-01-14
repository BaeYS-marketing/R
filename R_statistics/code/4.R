
'
연구가설 : 두 가지 교육방법에 따라 A반과 B반의 교육생 만족율에 차이가 있다.
귀무가설 : 두 가지 교육방법에 따라 A반과 B반의 교육생의 만족율에 차이가 없다.'


satisfy <-read.csv("two_sample.csv")

head(satisfy,5)


#비율을 비교하는 것이니까 팩터형에 관심이 있다.
x<- satisfy$method
y<- satisfy$survey


#자동으로 범주형으로 변환
table(x)
table(y)

table(x,y)
table(x,y, useNA = "ifany") #결측치도 포함해서 알려줘


#비율검정 : 한집단 binom , 두집단 이상 prop
prop.test(c(110,135),c(150,150), alternative = "two.sided")
'두 집단 간의 만족도 비율의 차이를 알고 싶은 것
x,y 에서 만족도 수 / x,y, 전체인원'

'귀무가설 : 비율차이가 없다.'


#greater 단측검정하고 귀무가설 채택하면(두 집단간 비율차이가 없다) 안된다.
prop.test(c(110,135),c(150,150), alternative = "greater")

#앞에 기준
prop.test(c(110,135),c(150,150), alternative = "less")



#검정은 따라서 3가지 다 해본다. _two sided, greater, less
