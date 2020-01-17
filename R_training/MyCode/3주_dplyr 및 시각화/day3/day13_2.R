# install.packages("ggplot2")
# install.packages('googledrive')

'ggplot은 특히 밑그림부터 그리고 덧붙여나가는 방식이다(레이어링 방식).
밑그림은 x축 ,y축만 mapping.'


# library(ggplot2)
# library(dplyr)
search()
data(airquality)
str(airquality)

#1. x축 ,y축 매핑
ggplot(airquality, aes(x=Day, y=Temp))     #더 꾸미고 싶으면 테마 사용하면 된다.


#2. 빈 도화지에 점찍기  : + 연산자로 연결 
ggplot(airquality, aes(x=Day, y=Temp)) + geom_point() 


 
ggplot(airquality, aes(x=Day, y=Temp)) + geom_point(size=3, color="red")

ggplot(airquality, aes(x=Day, y=Temp)) + geom_line()

ggplot(airquality, aes(x=Day, y=Temp)) + geom_line() + geom_point()

ggplot(airquality, aes(x=Day, y=Temp)) + 
        geom_line(color="green") + geom_point(size=3)








str(mtcars)
?mtcars

table(mtcars$cyl)

#좌표만 주었다. 
ggplot(mtcars, aes(x=cyl)) + geom_bar()

ggplot(mtcars, aes(x=cyl)) + geom_bar(width=0.5)

#x축 팩터형으로 변환
ggplot(mtcars, aes(x=factor(cyl))) + geom_bar()



ggplot(mtcars, aes(x=factor(cyl))) + geom_bar(width=0.5)

# filㅣ = 이라는 매개변수!!!                                           #투명도 0.0 ~ 1.0
ggplot(mtcars, aes(x=factor(cyl))) + geom_bar(aes(fill= factor(gear)), alpha=0.2)


#교재 220-221
ggplot(mtcars, aes(x=factor(cyl))) + geom_bar(aes(fill=factor(gear))) + coord_polar()

ggplot(mtcars, aes(x=factor(cyl))) + geom_bar(aes(fill=factor(gear))) + coord_polar(theta='y')


#boxplot 인데 day로 그룹 
View(airquality)
ggplot(airquality, aes(x=Day, y=Temp, group=Day)) + geom_boxplot()

ggplot(airquality, aes(Temp)) + geom_histogram()


# +geom_bar : y축 입력 : 자동으로 카운팅
# table(mtcars$gear)
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_gray()
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_bw()
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_linedraw()
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_light()
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_dark()
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_minimal()
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_classic()
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_void()



# ggplot2 + 연산의 장점
imsi <- ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수")

imsi + theme_gray()
imsi + theme_bw()
imsi + theme_linedraw()
imsi + theme_light()
imsi + theme_dark()
imsi + theme_minimal()
imsi + theme_classic()
imsi + theme_void()




mpg <- as.data.frame(ggplot2::mpg)
str(mpg)
# x축 displ, y축 hwy로 지정해 배경 생성
ggplot(data = mpg, aes(x = displ, y = hwy))
# 배경에 산점도 추가
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()



#xlim으로 ylim으로 인덱싱하는 효과 
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
        geom_point() + xlim(3, 6)

ggplot(data = mpg, aes(x = displ, y = hwy)) +   geom_point() +  xlim(3, 6) +  ylim(10, 30)
ggplot(data = mpg, aes(x = displ, y = hwy)) +   geom_point() + coord_cartesian(ylim=c(60, 75))


# install.packages("xlsx")
library(xlsx)
getwd()                                   #첫 번째 시트를 URF-8로 읽겠다. 
classDF <- read.xlsx("../book/data.xlsx", 1, encoding="UTF-8")
str(classDF)
View(classDF)


bar_data <- classDF[3]
bar_data
ggplot(bar_data, aes(x=bloodType)) + geom_bar()


ggplot(classDF, aes(x=bloodType, fill=gender)) + 
        geom_bar()





# A, B회사의 매출 실적 데이터프레임 만들기
company <- c('A', 'A', 'A', 'A', 'B', 'B', 'B', 'B')
year <- c('1980', '1990', '2000', '2010', '1980', '1990', '2000', '2010')
sales <- c(2750, 2800, 2830, 2840, 2760, 2765, 2775, 2790)

coSalesDF <- data.frame(company, year, sales)

# 생성된 coSalesDF 확인
coSalesDF
str(coSalesDF)
#-------------------------------------------------------------

# 라인차트 생성 + grouping해서  - x축은 연도(year), y축은 매출(sales) 매칭
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(aes(group=company))

#-------------------------------------------------------------
# 선 색상 및 두께 설정                    @@ 범례도 자동설정!!
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(size=2, aes(group=company,colour=company))

#-------------------------------------------------------------
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(size=2, aes(group=company, colour=company)) + geom_point(size=2)


# 빈도 막대 그래프
ggplot(data = mpg, aes(x = drv)) + geom_bar()

# 선 그래프
ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()

# 상자 그림
ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()


## 추가 소스

mpg <- as.data.frame(ggplot2::mpg)
str(mpg)
# x축 displ, y축 hwy로 지정해 배경 생성
ggplot(data = mpg, aes(x = displ, y = hwy))
# 배경에 산점도 추가
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
        geom_point() + xlim(3, 6)
ggplot(data = mpg, aes(x = displ, y = hwy)) +   geom_point() +  xlim(3, 6) +  ylim(10, 30)

install.packages("xlsx")
library(xlsx)
classDF <- read.xlsx("data.xlsx", 1, encoding="UTF-8")
str(classDF)
View(classDF)

bar_data <- classDF[3]
bar_data
ggplot(bar_data, aes(x=bloodType)) + geom_bar()


ggplot(classDF, aes(x=bloodType, fill=gender)) + 
        geom_bar()





# A, B회사의 매출 실적 데이터프레임 만들기
company <- c('A', 'A', 'A', 'A', 'B', 'B', 'B', 'B')
year <- c('1980', '1990', '2000', '2010', '1980', '1990', '2000', '2010')
sales <- c(2750, 2800, 2830, 2840, 2760, 2765, 2775, 2790)

coSalesDF <- data.frame(company, year, sales)

# 생성된 coSalesDF 확인
coSalesDF
str(coSalesDF)
#-------------------------------------------------------------

# 라인차트 생성 - x축은 연도(year), y축은 매출(sales) 매칭
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(aes(group=company))

#-------------------------------------------------------------
# 선 색상 및 두께 설정
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(size=2, aes(group=company,colour=company))

#-------------------------------------------------------------
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(size=2, aes(group=company, colour=company)) + geom_point(size=2)


# 빈도 막대 그래프
ggplot(data = mpg, aes(x = drv)) + geom_bar()

# 선 그래프
ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()

# 상자 그림
ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()




library(MASS)
str(Cars93)
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) +  geom_point(shape=21, size=6)
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) +  geom_point(shape=21, size=6, colour="blue")
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) +   geom_point(shape=21, size=6, fill="blue")   
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) +  geom_point(colour="grey", shape=21, size=6) 
ggplot(Cars93, aes(x=Weight, y=MPG.highway, fill=Price)) +   geom_point(colour="grey", shape=21, size=6) 
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) +   geom_point(colour="grey", shape=21, size=6, aes(fill=Price)) 

ggplot(Cars93, aes(x=Weight, y=MPG.highway, fill=Cylinders)) +  geom_point(colour="grey", shape=21, size=6)
ggplot(Cars93, aes(x=Weight, y=MPG.highway, fill=Cylinders)) +
        geom_point(colour="grey", shape=21, size=6) +
        scale_fill_brewer(palette="Oranges") # Oranges  

ggplot(Cars93, aes(x=Weight, y=MPG.highway, fill=Cylinders)) +
        geom_point(colour="grey", shape=21, size=6) +
        scale_fill_brewer(palette="Reds") # Reds

ggplot(Cars93, aes(x=Weight, y=MPG.highway, fill=Cylinders)) +
        geom_point(colour="grey", shape=21, size=6) +
        scale_fill_brewer(palette="Blues") # Blues


w <- data.frame(year=c("2014", "2015", "2016", "2017", "2018"), weight=c(65,66,64,68,72))
ggplot(data=w, aes(x=year)) + geom_bar()
ggplot(data=w, aes(x=year, y=weight)) + geom_bar()
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(stat="identity")
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(stat="identity") + coord_cartesian(ylim=c(60, 75))
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(aes(fill=year), stat="identity") + coord_cartesian(ylim=c(60, 75))
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(aes(fill=year), colour="blue", stat="identity") + coord_cartesian(ylim=c(60, 75))
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(aes(fill=year), stat="identity") + geom_label(aes(label=weight), nudge_y=1.1)+coord_cartesian(ylim=c(60, 75))
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(aes(fill=year), stat="identity") + geom_label(aes(label=weight), nudge_y=-1.1)+coord_cartesian(ylim=c(60, 75))
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(aes(fill=year), stat="identity") + geom_label(aes(label=weight), nudge_y=1.1)+coord_cartesian(ylim=c(60, 75)) + labs(title = "테스트", subtitle="ggplot2 패키지를 이용한 시각화", x="년도", y="무게")

# 트리맵 라이브러리 설치
install.packages("treemap")
# 트리맵 메모리 로드
library(treemap)

sales_df <- read.xlsx("data.xlsx", 2, encoding="UTF-8")
#-------------------------------------------------------------

# 트리맵 그리기
# index에 표현하고 싶은 계층 순서대로 벡터로 생성. product, region 순으로 벡터를 지정함으로써 product가 region보다 더 상위로 구분이 됨
treemap(sales_df, vSize="saleAmt", index=c("product", "region"), title="A기업 판매현황")

# 트리맵 그리기
treemap(sales_df, vSize="saleAmt", index=c("region", "product"), title="A기업 판매현황")
?mpg
성적
# 인터랙티브 그래프 만들기
# 패키지 준비하기
# install.packages("plotly")
library(plotly)
# ggplot으로 그래프 만들기
library(ggplot2)
p <- ggplot(data = mpg, aes(x = displ, y = hwy, col = drv)) + geom_point()
p



# 인터랙티브 그래프 만들기!!!!
# html. css 그니까 자바스크립트로 만든거야 !!!
imsi <- ggplotly(p)





str(imsi)
?ggplotly
?renderTags
library(htmltools)
renderTags(imsi)

# 인터랙티브 막대 그래프 만들기
p <- ggplot(data = diamonds, aes(x = cut, fill = clarity)) + 
        geom_bar(position = "dodge")
ggplotly(p)

        