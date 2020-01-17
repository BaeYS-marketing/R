#3주차 배울 것
#11월 4일 - 동적크롤링 실습마무리, 데이터 전처리(stringr-문자열 처리, dplyr 패키지 공부)
#11월 5일 - string r 마무리, 날짜처리, 기본시각화(graphics 패키지), 
#11월 6일 - ggplot2패키지를 이용한 시각화
#11월 7일 - 지도그리기, ggmap패키지 이용, leaflet 패키지, 텍스트마이닝(koNLP)
#11월 8일-  텍스트마이닝-시각화 tm패키지를 사용한 텍스트마이닝, reshape2 패키지

#11월 11일- shiny 패키지를 활용한 분석 결과 웹 디플로이

#########################################################################################
#새로운 강사님
#11월 12일- 통계분석시작




##

'- 새로운 R 패키지의 설치 
   install.packages("패키지명")
- 이미 설치된 R 패키지 확인 
   installed.packages() 
- 설치된 패키지 삭제 
   remove.packages("패키지명") 
- 설치된 패키지의 버전 확인 
   packageVersion("패키지명") 
- 설치된 패키지 업데이트 
   update.packages("패키지명") 
- 설치된 패키지 로드 
   library(패키지명), require(패키지명) 
- 로드된 패키지 언로드 
   detach("package:패키지명") 
- 로드된 패키지 점검 
   search() 
- 설치된 패키지의 버전 점검 
   packageVersion(패키지명)
'

###############################################################################

install.packages("dplyr")
library(dplyr)
install.packages("ggplot2")
str(ggplot2::mpg)        #패키지 로드 안하고 이용하는 방법   ~  ::
head(ggplot2::mpg)
mpg <- as.data.frame(ggplot2::mpg)
head(mpg)
exam <- read.csv("csv_exam.csv")
str(exam)
dim(exam)
head(exam);tail(exam)
View(exam)
# exam에서 class가 1인 경우만 추출하여 출력
exam %>% filter(class == 1) # [참고] 단축키 [Ctrl+Shit+M]으로 %>% 기호 입력
# 2반인 경우만 추출
exam %>% filter(class == 2)
# 1반이 아닌 경우
exam %>% filter(class != 1)
# 3반이 아닌 경우
exam %>% filter(class != 3)
# 수학 점수가 50점을 초과한 경우
exam %>% filter(math > 50)
# 수학 점수가 50점 미만인 경우
exam %>% filter(math < 50)
# 영어점수가 80점 이상인 경우
exam %>% filter(english >= 80)
# 영어점수가 80점 이하인 경우
exam %>% filter(english <= 80)
# 1반 이면서 수학 점수가 50점 이상인 경우
exam %>% filter(class == 1 & math >= 50)
# 2반 이면서 영어점수가 80점 이상인 경우
exam %>% filter(class == 2 & english >= 80)
# 수학 점수가 90점 이상이거나 영어점수가 90점 이상인 경우
exam %>% filter(math >= 90 | english >= 90)
# 영어점수가 90점 미만이거나 과학점수가 50점 미만인 경우
exam %>% filter(english < 90 | science < 50)
# 목록에 해당되는 행 추출하기
exam %>% filter(class == 1 | class == 3 | class == 5)  # 1, 3, 5 반에 해당되면 추출
# %in% 연산자 이용하기
exam %>% filter(class %in% c(1,3,5))  # 1, 3, 5 반에 해당하면 추출  / %in% : 기본함수 

#+ 편한부분 : exam$class라고 굳이 안해도 된다. 이미 앞에서 받아서 진행하기 때문
#단, %>% 연산 시행하고 나면 출력은 되지만 그 연산은 저장되지 않는다
#> 즉 결과값 저장 : 대입연산자 사용하여 변수에 담기!

# 추출한 행으로 데이터 만들기
class1 <- exam %>% filter(class == 1)  # class가 1인 행 추출, class1에 할당
class2 <- exam %>% filter(class == 2)  # class가 2인 행 추출, class2에 할당
mean(class1$math)                      # 1반 수학 점수 평균 구하기
mean(class2$math)                      # 2반 수학 점수 평균 구하기


exam %>% select(math)  # math 추출
exam %>% select(english)  # english 추출
# 여러 변수 추출하기
exam %>% select(class, math, english)  # class, math, english 변수 추출
# 변수 제외하기
exam %>% select(-math)  # math 제외
exam %>% select(-math, -english)  # math, english 제외
# dplyr 함수 조합하기
# class가 1인 행만 추출한 다음 english 추출
exam %>% filter(class == 1) %>% select(english)

#filter : 행
#select : 열 

# 가독성 있게 줄 바꾸기
exam %>%
   filter(class == 1) %>%  # class가 1인 행 추출
   select(english)         # english 추출

' exam
      %>% filter (X)       _새로운 행으로 시작할 때 사용하면 안된다.'


# 일부만 출력하기
exam %>%
   select(id, math) %>%  # id, math 추출
   head                  # 앞부분 6행까지 추출

#: haed 아규먼트 없이 부를 떄 괄호 생략할 수 있다. 

# 일부만 출력하기
exam %>%
   select(id, math) %>%  # id, math 추출
   head(10);head(1)              # 앞부분 10행까지 추출


# 오름차순으로 정렬하기
exam %>% arrange(math)  # math를 기준으로 오름차순 정렬
# 내림차순으로 정렬하기
exam %>% arrange(desc(math))  # math 내림차순 정렬
# 정렬 기준 변수 여러개 지정
exam %>% arrange(class, math)  # class 및 math 오름차순 정렬
                               # 1차 정렬조건 :  class   2차 정렬조건 math 

exam %>% arrange(class, desc(math))




exam %>%
   mutate(total = math + english + science) %>%  # 총합 변수 추가
   head                                          # 일부 추출

'exam 파생변수 exam에 저장 안됐다. ~ 대입연산으로 저장안했기 때문'

#여러 파생변수 한 번에 추가하기
exam %>%
   mutate(total = math + english + science,          # 총합 변수 추가
          mean = (math + english + science)/3) %>%   # 총평균 변수 추가
                                                     # mutate(total=, mean=)
   head 

'같은 결과 : exam %>% mutate(total = math + english + science,
                           mean = total/3 %>% head'
 

# 일부 추출
# mutate()에 ifelse() 적용하기
exam %>%
   mutate(test = ifelse(science >= 60, "pass", "fail")) %>%
   head

#추가한 변수를 dplyr 코드에 바로 활용하기
exam %>%
   mutate(total = math + english + science) %>%  # 총합 변수 추가
   arrange(total) %>%                            # 총합 변수 기준 정렬
   head                                          # 일부 추출

# 전체 요약하기
'NOT summary'
exam %>% summarise(mean_math = mean(math))  # math 평균 산출

#이건 mean(exam$math)와 같다.. 즉 전체를 대상으로 하면 기본함수와 같다. 
#!! summarise   : group_by와 어울려서 활용도가 높기 떄문에 배운는 것.

# 집단별로 요약하기
exam %>%
   group_by(class) %>%                # class별로 분리, SQL : group by와 같다. 
   summarise(mean_math = mean(math))  # 그룹(class)단위로 math 평균 산출
       #출력 결과 데이터셋 : 티블(tibble) 
       #티블 : advanced data frame  거의 데이터프레임과 비슷
       #데이터프레임이라고 보면 된다. 다만 업그레이드 버젼이라는 것


#여러 요약통계량 한 번에 산출하기
exam %>%
   group_by(class) %>%                   # class별로 분리
   summarise(mean_math = mean(math),     # math 평균
             sum_math = sum(math),       # math 합계
             median_math = median(math), # math 중앙값
             n = n())                    # 그룹핑한 결과에서 갯수(학생 수)
                                         # n() : 개수 

# 각 집단별로 다시 집단 나누기
str(mpg)

mpg %>%
   group_by(manufacturer, drv) %>%      # 1차;회사별, 2차;구방방식별 분리
   summarise(mean_cty = mean(cty)) %>%  # cty 평균 산출
   head(10)                             # 일부 출력



?mpg #패키지 로드
?ggplot2::mpg #패키지 로드X




#[ 문제 ] 
#회사별로 "suv" 자동차의 도시 및 고속도로 통합 연비 평균을 구해 내림차순으로 정렬하고, 1~5위까지 출력하기
#절차	기능	dplyr 함수
#1	회사별로 분리	group_by()
#2	suv 추출	filter()
#3	통합 연비 변수 생성	mutate()
#4	통합 연비 평균 산출	summarise()
#5	내림차순 정렬	arrange()
#6	1~5위까지 출력	head()


#install.packages("Rcpp")

# install.packages("ggplot2")
library(ggplot2)
mpg <- as.data.frame(mpg)
str(mpg)
mpg %>%
   group_by(manufacturer) %>%           # 회사별로 분리
   filter(class == "suv") %>%           # suv 추출
   mutate(tot = (cty+hwy)/2) %>%        # 통합 연비 변수 생성
   summarise(mean_tot = mean(tot)) %>%  # 통합 연비 평균 산출
   arrange(desc(mean_tot)) %>%          # 내림차순 정렬
   head(5)                              # 1~5위까지 출력

#쌤
mpg %>%                                 
   filter(class == "suv") %>%           #필터부터 하는게 맞지.SQL적으로 
   mutate(tot = (cty+hwy)/2) %>% 
   group_by(manufacturer) %>%           
   summarise(mean_tot = mean(tot)) %>%  
   arrange(desc(mean_tot)) %>%          # 내림차순 정렬
   head(5) 


# 가로로 합치기
# 중간고사 데이터 생성
test1 <- data.frame(id = c(1, 2, 3, 4, 5),  midterm = c(60, 80, 70, 90, 85))
# 기말고사 데이터 생성
test2 <- data.frame(id = c(1, 2, 3, 4, 5),  final = c(70, 83, 65, 95, 80))


#left_join : 왼쪽데이터를 기준으로 통합 ~ 오른쪽이 일치하지 않으면 NA
#inner_join : 두개의 데이터에서 서로 공통된 요소들만 묶어서 조인


# id 기준으로 합치기
total <- left_join(test1, test2, by = "id")  # id 기준으로 합쳐 total에 할당
# 다른 데이터 활용해 변수 추가하기
# 반별 담임교사 명단 생성
name <- data.frame(class = c(1, 2, 3, 4, 5), teacher = c("kim", "lee", "park", "choi", "jung"))

# class 기준 합치기
exam_new <- left_join(exam, name, by = "class")

# 세로로 합치기
# 학생 1~5번 시험 데이터 생성
group_a <- data.frame(id = c(1, 2, 3, 4, 5),  test = c(60, 80, 70, 90, 85))
# 학생 6~10번 시험 데이터 생성
group_b <- data.frame(id = c(6, 7, 8, 9, 10),  test = c(70, 83, 65, 95, 80))
#세로로 합치기
group_all <- bind_rows(group_a, group_b)  # 데이터 합쳐서 group_all에 할당



