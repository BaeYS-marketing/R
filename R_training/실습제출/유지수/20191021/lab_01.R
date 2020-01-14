#문제1
v1 <- c(1:10)
v2 <- v1 * 2
max_v <- max(v2)
min_v <- min(v2)
avg_v <- mean(v2)
sum_v <- sum(v2)
v3 <- v2[-5]
v1
# [1]  1  2  3  4  5  6  7  8  9 10
v2
# [1]  2  4  6  8 10 12 14 16 18 20
v3
# [1]  2  4  6  8 12 14 16 18 20
max_v
# [1] 20
min_v
# [1] 2
avg_v
# [1] 11
sum_v
# [1] 110

#문제2
seq(1,9,by = 2)
rep(1,5)
rep(1:3,3)
rep(1:4,each = 2)

#문제3
x <- seq(1,10,3)
names(x) <- LETTERS[1:4]

#문제4
count <- sample(1:100,7)
week.korname <- c("일요일", "월요일","화요일" ,"수요일","목요일","금요일","토요일")
names(count) <- week.korname
count
week.korname[which.max(count)]
week.korname[which.min(count)]
week.korname[which(count > 50)]
