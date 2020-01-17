# 빈도 막대 그래프
ggplot(data = mpg, aes(x = drv)) + geom_bar()
# 선 그래프
ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()
# 상자 그림
ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()

library(MASS)
library(ggplot2)
str(Cars93)
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) + geom_point(shape=21, size=6)

#점 파란색 : colour
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) + geom_point(shape=21, size=6, colour="blue")

#점 채우기 : fill
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) + geom_point(shape=21, size=6, fill="blue")   

#점 포인터 설정 shape
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) + geom_point(colour="grey", shape=11, size=6) 

#축 관련 설정 : ggplot에서 설정해도 되고 , 뒤에 나오는 함수에서 설정해도 되고.
ggplot(Cars93, aes(x=Weight, y=MPG.highway, fill=Price)) + geom_point(colour="grey", shape=21, size=6) 
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) + geom_point(colour="grey", shape=21, size=6, aes(fill=Price)) 

#fill : 위에는 연속형 자료 (그라데이션)  / 지금은 팩터 : (색 구별)
ggplot(Cars93, aes(x=Weight, y=MPG.highway, fill=Cylinders)) +  geom_point(colour="grey", shape=21, size=6)

#scale_fill_brewer : 색을 따로지정하고 싶을 때 사용
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
ggplot(data=w, aes(x=year)) + geom_bar()   #!알아두자 :  x(year)를 기준으로 갯수를 세는 함수 
ggplot(data=w, aes(x=year, y=weight)) + geom_bar() # x축에 지정된 값의 개수를 세는 것이 기본이라 y축을 설정할 수 없다. 갯수를 세서 막대를 그리는게 기본이라..


# 위의 경우를 해결하려면 stat이라는 매개변수를 추가해야한다. 
ggplot(data=w, aes(x=year, y=weight) + geom_bar(stat="identity"))  #  +ylim=c(60,75)) : 기본 내장함수 , 


#좌표설정 : coord_cartesian _ ggplot에서 제공하는 함수(모든 함수에서 에러 없이 사용!    )
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(stat="identity") + coord_cartesian(ylim=c(60, 75))

# y범위 설정, fill함수 설정 
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(aes(fill=year), stat="identity") + coord_cartesian(ylim=c(60, 75))
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(aes(fill=year), colour="blue", stat="identity") + coord_cartesian(ylim=c(60, 75))

ggplot(data=w, aes(x=year, y=weight)) + geom_bar(aes(fill=year), stat="identity") + geom_label(aes(label=weight), nudge_y=1.1)+coord_cartesian(ylim=c(60, 75))
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(aes(fill=year), stat="identity") + geom_label(aes(label=weight), nudge_y=-1.1)+coord_cartesian(ylim=c(60, 75))
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(aes(fill=year), stat="identity") + geom_label(aes(label=weight), nudge_y=1.1)+coord_cartesian(ylim=c(60, 75)) + labs(title = "테스트", subtitle="ggplot2 패키지를 이용한 시각화", x="년도", y="무게")







# 트리맵 라이브러리 설치
# install.packages("treemap")
# 트리맵 메모리 로드
library(treemap)
library(xlsx)

sales_df <- read.xlsx("book/data.xlsx", 2, encoding="UTF-8")
# 트리맵 그리기



# index에 표현하고 싶은 계층 순서대로 벡터로 생성. product, region 순으로 벡터를 지정함으로써 product가 region보다 더 상위로 구분이 됨
# index : product이 메인, region이 서브 
treemap(sales_df, vSize="saleAmt", index=c("product", "region"), title="A기업 판매현황")

# 트리맵 그리기
treemap(sales_df, vSize="saleAmt", index=c("region", "product"), title="A기업 판매현황")

# 인터랙티브 그래프 만들기
# 패키지 준비하기
install.packages("plotly")
library(plotly)
# ggplot으로 그래프 만들기
library(ggplot2)
p <- ggplot(data = mpg, aes(x = displ, y = hwy, col = drv)) + geom_point()
p
# 인터랙티브 그래프 만들기
ggplotly(p)


# 인터랙티브 막대 그래프 만들기
p <- ggplot(data = diamonds, aes(x = cut, fill = clarity)) + geom_bar(position = "dodge")
ggplotly(p)