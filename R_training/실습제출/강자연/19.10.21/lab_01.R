#문제1 
v1 <- c(1:10)
v2 <- 2*v1
max_v <- max(v2)
min_v <- min(v2)
avg_v <- mean(v2)
sum_v <- sum(v2)
v3 <- v2[-5]
print(v1);print(v2);print(v3)
print(max_v);print(min_v);print(avg_v);print(sum_v)

#문제3
seq(1, 9, 2)
rep(1, 5)
rep(1:3, 3)
rep(1:3, each= 3)

#문제4
v3 <- seq(1,10, 3)
names(v3) <- LETTERS[1:4]

#문제5 
count <- sample(1:100,7)
week.korname <- c('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일')
names(count) <- week.korname[1:7]
count
week.korname[which.max(count)]
week.korname[which.min(count)]
week.korname[which(count>50)]