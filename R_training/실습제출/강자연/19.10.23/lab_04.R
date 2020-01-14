#문제1
L1 <- list(
  name="scott",
  sal=3000
)
result1 <- L1[[2]][1]*2

#문제2
L2 <- list(
  "scott",
  c(100,200,300)
)
L2

#문제3
L3 <- list(c(3,5,7), c(LETTERS[1:3]))
L3[[2]][1] <- "Alpha"

#문제4
L4 <- list(alpha=0:4, beta=sqrt(1:5), gamma=log(1:5))
L4[[1]]+10

#문제5
L5 <- list(math=list(95, 90), writing=list(90, 85), reading=list(85, 80))
unlist(unlist(L5))
mean(unlist(L5))

#문제6
time <- 32150
hour <- time%/%3600
time1 <- time%%3600
minute <- time1%/%60
time2 <- time1%%60
second <- time2%%60
hour; minute; second

#num1%%num2 # 나머지값만 구함
#num1%/%num2 #몫만 구함


paste(c(hour,minute,second), c("시간", "분", "초"), sep="")

