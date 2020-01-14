install.packages("randomForest")
library(randomForest)

rf <- randomForest(Species~. ,data=iris)  # ~. 보다 인덱싱 방식이 빠르다.  R은 벡터형이기 때문에 속도가 빠르다.  
rf


'
Number of trees: 500  =>  앙상블 갯수 500개
OOB estimate of  error rate: 4%  =>  유효성검사  _정합률 96% , 에러율 4%

밑에는 어떻게 에러가 나왔는지 _에러에 대한 설명 [평가표 매트릭스]

행 : 예측치
열 : 실측치
                setosa versicolor virginica class.error
ex. versicolor      0         47         3        0.06

versicolor 50개 중 3개는 virginica로 에러

"*표본추출 떄문에 사람마다 결과가 다를 수 있지만
  일반적으로 500번 정도면 그 차이가 없다고 알려진다.
"
'

#한번 한것 보다 여러번 한 것이 더 정확하기 때문에
# >> 더욱 변수 중요도 평가에 잘 활용되고
#    >> argument option에 아예 존재한다. 

'MeanDecreaseAccuracy
[평균정확도를 개선]하는데 있어서 수치가 높을수록 영향력이 높은 것  _머신러닝에서 더욱..

MeanDecreaseGini
[불순도를 개선]하는데 있어서 수치가 높을수록 영향력이 높은 것 

불순도/정확도 개선에서 중요도 자체의 차이는 없더라도

cut off 기준이 없다.
1) 그래서 여러 알고리즘을 방법으로 다양하게 돌려보고 이를 통한 결과로 미루어 짐작
2) 도메인 경험으로 수치가 낮아도 포함시키기도 한다.

즉 참고용!!!
'