#문제1

a <- array(1:24, dim=c(2,3,4))
a

#(1)
a[2,3,4]
#(2) 각 층마다 2행의 데이터 출력
a[2,,]
#(3) 각 층마다 1열의 데이터 출력
a[,1,]
#(4) 3층의 모든 데이터 출력
a[,,3]
#(5) a라는 배열을 구성하는 모든 데이터에 +100을 연산하여 출력
a <- a+100
a
#(6) 4층의 모든 데이터들에 100을 곱한 결과를 출력
a <- a[,,4]*100
a
#(7) 각층의 1행, 2열과3열만 출력
a[1,2:3,]


#(8) 2층의 2행 데이터들의 값을 100을 더한 값으로 변경한다.
a[2,,2] = a[2,,2]+100

#(9) 1층의 모든 데이터들의 값에 2를 뺀 값으로 변경한다.

a[,,1]=a[,,1]-2
#(10) a 배열의 모든 데이터 값들을 10을 곱한 값으로 변경한다.
a = a*100


#(11) a 변수를 삭제한다.
rm(a)


#문제2
x <- c(1, 2, 3, 4)
y <- c(2, 4, 6, 8, 10) #y = seq(2,10,2)

df1 <- data.frame(x,y)


#문제3
col1 <- c(1,2,3,4,5)
col2 <- c("a","b","c","d","e") # col2 = letters[1:5]
col3 <- c(6,7,8,9,10)
df2 <- data.frame(col1, col2, col3)


#문제4

  제품명=c("사과", "딸기", "수박")
  가격=c(1800, 1500,3000) 
  판매량=c(24,38,13)
df3 <- data.frame(제품명,가격,판매량,stringsAsFactors = FALSE)



#문제5
mean(df3$가격)
mean(df3$판매량)


#문제6

name <- c("Porter", "Elsa", "Gates", "Wendy", "Ben")
gender <- factor(c("M","F","M","F","M"))
math <-c(85, 76, 99, 88, 40)


df4 <- data.frame(name,gender,math,stringsAsFactors=F)
df4$gender = factor(df4$gender)
str(df)

#(1)
stat = c(76,73, 95, 82, 35)
df4$stat = stat

#(2)
df4$score= df4$math + df4$stat

#(3)
df4$grade = ifelse(df4$score >=150, "A",
                   ifelse(df4$score>=100, "B",
                          ifelse(df4$score>=70, "C", "D")))

#문제7
emp <- read.csv(file.choose(),
                stringsAsFactors = F)

str(emp)


#문제8
emp[3:5,]

#9
emp$ename

#10
emp[,c("ename","sal")]

#11
emp[emp$job=="SALESMAN",c("ename","sal","job")]

#12
subset(emp, select=c("ename","sal","job"), subset=(sal>=1000 & sal<=3000))

#13
emp[emp$job!== "ANALYST", c("ename","sal","job")]

#14
emp[emp$job=="SALESMAN"|emp$job!== "ANALYST", c("ename","sal","job")]
#15
emp[is.na(emp$comm),c("ename","sal")]

#16
emp[order(emp$sal,decreasing =F),]
#많은 순이면 T




