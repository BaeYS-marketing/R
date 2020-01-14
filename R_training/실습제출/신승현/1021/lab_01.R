

#문제2

v1 <- 1:10
v1

v2 <- v1*2
v2

max_v <- max(v2)
print(max_v)
min_v <- min(v2)
print(min_v)
mean_v <- mean(v2)
print(mean_v)
sum_v <- sum(v2)
print(sum_v)

v3 <- v2[-5]
print(v3)

#문제3

#seq() 또는 rep() 함수를 이용하여 다음 결과가 나오도록 명령을 작성한다.
#(1) 1, 3, 5, 7, 9
#(2) 1, 1, 1, 1, 1
#(3) 1, 2, 3, 1, 2, 3, 1, 2, 3
#(4) 1, 1, 2, 2, 3, 3, 4, 4

r1 <- 1:10
r1

r1 <- seq(1, 10, 2)
r1

r1 <- rep(1:1, each=5)
r1

r1 <- rep(1:3, 3)
r1

r1 <- rep(1:4, each=2)
r1

#문제4

x <- 1:10 
x

x <- x + 3
x

v3 <- x
v3

q1 <- seq(1, 10, 3)
q1
q1 <- LETTERS[1:4]
q1


#문제5

week.korname <- c("일요일", "월요일", "화요일", "수요일",
                  "목요일", "금요일", "토요일")
week.korname

count = sample(1:100, 7)
count

which.max(count)
week.korname[which.max(count)]
week.korname[which.min(count)]
week.korname[which(count > 50)]
