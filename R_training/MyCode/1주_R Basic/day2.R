#matrix 실습 행 가로 열 세로!!, 디폴트로 열이 우선함
x1 <- matrix(1:8, nrow = 2)
x1
x1 <- x1*3
x1
sum(x1);min(x1);max(x1);mean(x1)

x2 <- matrix(1:8, nrow=3)
x2

#대입문장을 담으면서 출력도 하려면 ()로 묶어주면 된다.
(chars <- letters[1:10])
mat1 <- matrix(chars)
mat1
matrix(chars, nrow=1)

#행의 개수, 열의 개수 출력
dim(mat1)

#matrix (데이터벡터, 행,열,byrow=T열을 따라 배열 F행을 따라 배열, 기본값 )
matrix(chars, nrow = 5)
matrix(chars, nrow = 5, byrow=T)
matrix(chars, nrow = 5, ncol=5)
matrix(chars, nrow = 3)

#매트릭스만드는 또다른 방법
vec1 <- c(1,2,3)
vec2 <- c(4,5,6)
vec3 <- c(7,8,9)


##############################################################################
#붙이는 함수들  
#백터끼리 합치면 매트릭스,   데이터프레임에 추가해야 데이터프레임
mat1 <- rbind(vec1,vec2,vec3); mat1
mat2 <- cbind(vec1,vec2,vec3); mat2
mat1[1,1]
mat1[2,];mat1[,3]

is.vector(mat1[,3])

#아규먼트(argument) : drop         ~ 디폴트값 : drop = T  .. 백터로 드랍 
#드롭은 백터로 드랍하게 한다(기본값)
mat1[1,1,drop=F]
mat1[1,1,drop=F];mat1[,3,drop=F]

is.matrix(mat1[,3,drop=F])
##############################################################################

rownames(mat1) <- NULL
colnames(mat2) <- NULL
mat1:mat2

rownames(mat1) <- c("row1","row2","row3")
colnames(mat1) <- c("col1","col2","col3")

mat1
ls()

#매트릭스에서 쓸경우 열단위로 서머리 수행
summary(x2)

#2행 인덱스를 지정하여 평균내기
mean(x2[2,])
rowSums(x2); colSums(x2)


#apply함수
#(apply(매트릭스이름,매트릭스에서 행=1 열=2 단위선택, 사용할 함수를 호출)
x2
apply(x2,1,sum)
apply(x2,1,max)
apply(x2,1,min)
apply(x2,2,mean)
apply(x2,2,max)
apply(x2,2,sum)



?apply(array, margin, ...)


#Array실습
#array 함수 (데이터, dim=c(행,열,층))
a1 <- array(1:30,dim = c(2,3,5))
a1
#인덱싱 연습
a1[1,3,4]
a1[,,3]
a1[,,3, drop=F]


#drop 
test = matrix(1:6, nrow=2)
test
test[1,]
test[1, ,drop=F]


#팩터형 연습
score <- c(1,3,2,4,2,1,3,5,1,3,3,3)
class(score)
summary(score)

f_score <- factor(score)
class(f_score)
summary(f_score)

ff <- score
ff
class(ff)
as.factor(ff)
ff2<-as.factor(ff)
ff
ff2



#factor() , levels = , labels = 
######################################################
#levels : 팩터가 가질수 있는 값의 범위

str(iris)
levels(f_score)

plot(score)
plot(f_score)

data1 <- c('월','수','토','월','목','화')
data1
class(data1)
day1 <- factor(data1)
class(day1)
summary(day1)

levels(day1)
week.korabbname <- c('일','월','화','수','목','금','토')
day2 <- factor (data1, 
               levels=week.korabbname)
day2
summary(day2)

btype <- factor(
  c('A','O','AB','B','O','A'))

levels=c('A','B','O')

btype2 <- factor(
  c('A','O','AB','B','O','A'),
levels=c('A','B','O'))

btype   
btype2         #levels를 따로 지정할 경우, 그 안에 값 포함 안되면 NA

summary(btype)

gender <- factor(c(1,2,1,1,1,2,1,2),levels=c(1,2),
labels = c('남성','여성') )

gender
summary(gerder)
data()

###################################################################




#iris + 데이터소스 붙여넣기.
str(iris)
#Dataframe 실습
no <- c(1,2,3,4)
name <- c('Apple','Banana','Peach','Berry')
qty <- c(5,2,7,9)
price <- c(500,200,200,500)
fruit <- data.frame(no, name, qty, price)
str(fruit)
View(fruit)
fruit

fruit[1,]
fruit[-1,]
fruit[,2]
fruit[,3] # fruit[,3, drop=F]
fruit[,3,drop=F]
fruit[, c(3,4)]
fruit[3,2]
fruit[3,1]

fruit[,3]
fruit$qty
fruit[[3]]
fruit[3]  # 데이터프레임 형식 유지



#####################몰랐던 신기한거########################
fruit[,3]
fruit[,3,drop=F]
fruit$qty
fruit[,'qty']
fruit['qty']
fruit[3]
fruit[[3]]
fruit[,c(1,3)]
subset(fruit, select = 'qty')

'행 자체 인덱싱 + 복수 인덱싱 : 아니면 백터형식으로 출력 ' 

str(fruit$qty)
str(fruit[3])

'상황에 따라 다르게 사용해야 할 때가 있으니까 알아두자'
df_midterm
mean(df_midterm$english)
mean(df_midterm[1])  #오류

#해설
class(df_midterm$english)
is.vector(df_midterm$english)
class(df_midterm[1])
############################################################

str(fruit$qty)
str(fruit[3])

# dataframe exam1
eng <- c(90, 80, 60, 70)
math <- c(50, 60, 100, 20)
classnum <- c(1,1,2,2)

df_midterm <- data.frame(
  english = eng, math, classnum)

df_midterm
str(df_midterm)
colnames(df_midterm)
rownames(df_midterm)
names(df_midterm)

mean(df_midterm$english)
mean(df_midterm[1])

mean(df_midterm$math)

df_midterm2 <- data.frame(
  c(90, 80, 60, 70), 
  c(50, 60, 100, 20), 
  c(1,1,2,2))
colnames(df_midterm2)
rownames(df_midterm2)
names(df_midterm2)
df_midterm2
df_midterm2 <- data.frame(
  영어=c(90, 80, 60, 70), 
  수학=c(50, 60, 100, 20), 
  클래스=c(1,1,2,2))
df_midterm2
df_midterm2$영어

df <- data.frame(var1=c(4,3,8), 
                 var2=c(2,6)) # 오류
#백터 행렬 구조가  맞아야한다. 


df <- data.frame(var1=c(4,3,8), 
                 var2=c(2,6,1))
str(df)
df$var_sum <- df$var1 + df$var2
##############df$var_sum 이런 것을 파생변수!!!!!!####################
#파생변수 : 칼럼을 지정과 동시에 원래 데이터셋에 추가해주는 편리함.
#####################################################################

df$var_mean <- df$var_sum/2
df$result <- ifelse(df$var1>df$var2, 
                    "var1이 크다", "var1이 작다")
df

getwd() # setwd('xxx')
setwd('c:/Rstudy')  #절대경로 
getwd()

#csv파일열기   *첫번 쨰 줄은 무조건 헤더로 읽는다.

scoreF <- read.csv("data/score.csv", header=F)   #상대경로
scoreF[1.2]
score <- read.csv("data/score.csv")
score[1,2]

score
str(score)
score$sum <- 
  score$math+score$english+score$science
score$result <- ifelse(score$sum >= 200, 
                       "pass", "fail")
score

'문제Q 몇명이 합격했나'

summary(score$result)  #불러올 때는 자동으로 올 문자백터는 팩터로 읽지만
                       #우리가 추가할 때는 그게 아니다.


#방법1 집계함수(어떤 타입이든 무조건 개수 세어주는 함수)
table(score$result)

#방법2 임시
summary(factor(score$result))

#방법3 변환
score$result = factor(score$result) 
str(score)
summary(score)

#summary결과 학생 id가 숫자형으로 되어있어서 집계되고 있다.
#-> 문자형으로 바꾸기 / 효과 summary볼 때 편하다.
score$id = as.character(score$id)
score$class = factor(score$class)
summary(score)

#iflese 다중조건 이용하기 _ (아규먼트 안에 다시 ifelse 사용)
score$grade<-ifelse(score$sum >= 230,"A",
                    ifelse(score$sum >= 215,"B", 
                           ifelse(score$sum >=200,"C","D")))
score
View(score)








# order() 와 sort() 복습_day1
v <- c(10,3,7,4,8)
sort(v)
order(v)


#파일 불러오기 file.choose()함수 
emp <- read.csv(file.choose(),
                stringsAsFactors = F)     

emp
str(emp)
View(emp)   '결측치 존재, 오라클에 있는 데이터셋 가져온것'

#NA가 중요한 이유 : 연산 결과에서 NA가 존재하면 '에러'가 난다.



# 1. emp에서 직원 이름
emp$ename
emp[,2]
emp[,"ename"] 
emp[,2, drop=FALSE] 
emp[,"ename",drop=F] 
emp[2]
emp["ename"] 



# 2. emp에서 직원이름, 잡, 샐러리
emp[,c(2,3,6)]
emp[,c("ename","job","sal")]
subset(emp,select = c(ename, job, sal))
?subset
'subset() : select = 를 생략못하는 이유_ select은 세번째 아규먼트'


# 3. emp에서 1,2,3 행 들만
emp[1:3,]
emp[c(1,2,3),]

# 4. ename이 "KING"인 직원의 모든 정보
#방법1 알고있는 경우
emp[9,] 


#벙법2 칼럼으로 찾아가기 
emp$ename=="KING"    # 연산마다 비교한느거 아시죠?

emp[c(F,F,F,F,F,F,F,F,T,F,F,F,
      F,F,F,F,F,F,F,F),]

#####################오류 바로잡기#######################
str(emp)
emp[,emp$ename == 'KING']  #오류 - 연산 결과값/행렬적용 이해 부족
emp[emp$ename == "KING",]


#방법3, subset() + R코드 보다 보면 아큐먼트명을 쓸 때 안쓸 때 그 이유.
subset(emp,subset= emp$ename=="KING")
subset(emp,emp$ename=="KING") 

emp[emp$ename=="KING",] 



# 5. select ename,sal from emp where sal>=2000
#cf.아규먼트를 지정하면 순서는 상관 없다. 
subset(emp, select=c("ename","sal"), subset= emp$sal>= 2000)
subset(emp, emp$sal>= 2000, c("ename","sal"))
emp[emp$sal>=2000,c("ename","sal")]




# 6. select ename,sal from emp where sal between 2000 and 3000
#방법1
subset(emp, select=c("ename","sal"), subset=(sal>=2000 & sal<=3000))



#방법2
emp[emp$sal>=2000 & emp$sal <=3000, c("ename","sal")]



'풀이'
aaa<-emp$sal>=2000 & emp$sal
aaa
'1. 조건식 연산 결과는 : 값이 아니라 T/F 논리형이고,
 2. 조건식을 통한 인덱싱의 알고리즘은 : T F T ... 이런 논리결과값
 3. 백터 인덱싱에서 : T만 값을 추출하는 알고리즘으로 최종출력'  



#방법3
emp[!is.na(emp$comm), c("ename", "comm")]




#################################################################
#테스트#  내용 요약
#################################################################

#1
emp$c(ename,sal) ###오류  : $는 하나의 컬럼만 호출가능
emp[c(ename,sal)] #오류   : 여러개 일 때 ''를 붙인다.

subset(emp, select =c(ename, empno), subset = comm == NA) 
#오류 : NA 는 데이터가 아니다.



#2
##subset으로 추출하기
subset(emp, select =c(ename, empno), subset = is.na(emp$comm)==T)



#3#
문제11  ####subset에서는 +select 절에서는 칼럼에 '' 안 붙여도 된다.
        # 물론 붙여도 된다. 단!! subset 함수 내 subset 조건에서는 안된다.   
                             # 함수 내 subset 조건은 칼럼 조건이라서!!!
                             #- emp 데이터 셋으로 지정해놔서
str(emp)

subset(emp, select = c(sal,ename,job), subset = job =='SALESMAN' )

subset(emp, select =c('sal','ename','job'), 
                  subset = job == 'SALESMAN')   #가능

subset(emp, select =c('sal','ename','job'), 
       subset = 'job' == 'SALESMAN')            #오류 
 


#4#
#subset 말고 인덱싱으로 
emp[emp$job == 'SALESMAN', c('ename','sal','ename')]

#관측치 확인은 행으로 
#추출 정보 확인은 컬럼으로


emp$job == 'SALESMAN'
#논리 연산자 결과는 T/F
#+ 여기서 모든 행을 다 연산 해야 하는 이유. 자동추가 완성되기 때문.






