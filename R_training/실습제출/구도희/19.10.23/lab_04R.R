# 문제1
L1 <- list(
  name = "scott",
  sal = 3000
)
L1
result1 <- L1[[2]]*2
result1

# 문제2
L2 <- list("scott",
           c(100,200,300)
          )
L2

# 문제3
L3 <- list(
  c(3,5,7),
  c("A","B","c")
)
L3[[2]][1] <- "Alpha"
L3[[2]][1]

# 문제4
L4 <- list(
  alpha=0.4,
  beta=sqrt(1:5),
  gamma=log(1:5)
)
L4[[1]]+10

# 문제 5
mean(unlist(list(math=list(95, 90),
     writing=list(90, 85),
     reading=list(85, 80)))) 

# 문제 6
time <- c(ceiling(32150/3600),
          (32150%%3600)%%60,
          (32150%%3600)%%60)
paste(time, c("시간","분","초"))

